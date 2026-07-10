<?php

class AdminController
{
    private $renderer;
    private $adminModel;
    private $request;

    public function __construct($renderer, $adminModel, $request)
    {
        $this->renderer = $renderer;
        $this->adminModel = $adminModel;
        $this->request = $request;
    }

    public function reportes()
    {
        $this->validarAdmin();

        $periodo = $this->obtenerPeriodo();

        $resumen = $this->adminModel->getResumen($periodo);

        $correctasPorUsuario = $this->agregarBarra(
            $this->adminModel->getCorrectasPorUsuario($periodo),
            "porcentaje",
            100
        );

        $usuariosPorPais = $this->agregarBarra(
            $this->adminModel->getUsuariosPorPais($periodo),
            "cantidad"
        );

        $usuariosPorSexo = $this->agregarBarra(
            $this->adminModel->getUsuariosPorSexo($periodo),
            "cantidad"
        );

        $usuariosPorGrupoEdad = $this->agregarBarra(
            $this->adminModel->getUsuariosPorGrupoEdad($periodo),
            "cantidad"
        );

        $this->renderer->render("adminReportes", [
            "nombre" => $_SESSION["usuario_nombre"],
            "puntaje" => $_SESSION["puntaje"] ?? 0,
            "ocultar_perfil" => true,
            "periodo" => $periodo,
            "filtro_dia" => $periodo === "dia",
            "filtro_semana" => $periodo === "semana",
            "filtro_mes" => $periodo === "mes",
            "filtro_anio" => $periodo === "anio",

            "cantidad_jugadores" => $resumen["cantidad_jugadores"],
            "usuarios_nuevos" => $resumen["usuarios_nuevos"],
            "partidas_jugadas" => $resumen["partidas_jugadas"],
            "preguntas_en_juego" => $resumen["preguntas_en_juego"],
            "preguntas_creadas" => $resumen["preguntas_creadas"],

            "correctas_por_usuario" => $correctasPorUsuario,
            "usuarios_por_pais" => $usuariosPorPais,
            "usuarios_por_sexo" => $usuariosPorSexo,
            "usuarios_por_grupo_edad" => $usuariosPorGrupoEdad
        ]);
    }

    public function trampitas()
    {
        $this->validarAdmin();

        $balancePorUsuario = $this->adminModel->getBalanceTrampitasPorUsuario();
        $totales           = $this->adminModel->getTotalDineroTrampitas();

        $this->renderer->render("adminTrampitas", [
            "nombre"   => $_SESSION["usuario_nombre"],
            "puntaje"  => $_SESSION["puntaje"] ?? 0,

            "balance_por_usuario"       => $balancePorUsuario,
            "total_ventas"              => $totales["total_ventas"],
            "total_trampitas_vendidas"  => $totales["total_trampitas_vendidas"],
            "total_dinero"              => number_format($totales["total_dinero"], 2),
        ]);
    }

    public function graficoCorrectasPorUsuario()
    {
        $this->validarAdmin();

        $periodo = $this->obtenerPeriodo();

        $datos = $this->adminModel->getCorrectasPorUsuario($periodo);

        $this->generarGraficoBarras(
            "Porcentaje de respuestas correctas por usuario",
            $datos,
            "username",
            "porcentaje"
        );
    }

    public function graficoUsuariosPorPais()
    {
        $this->validarAdmin();

        $periodo = $this->obtenerPeriodo();

        $datos = $this->adminModel->getUsuariosPorPais($periodo);

        $this->generarGraficoTorta(
            "Usuarios por pais",
            $datos,
            "pais",
            "cantidad"
        );
    }

    public function graficoUsuariosPorSexo()
    {
        $this->validarAdmin();

        $periodo = $this->obtenerPeriodo();

        $datos = $this->adminModel->getUsuariosPorSexo($periodo);

        $this->generarGraficoTorta(
            "Usuarios por sexo",
            $datos,
            "sexo",
            "cantidad"
        );
    }

    public function graficoUsuariosPorEdad()
    {
        $this->validarAdmin();

        $periodo = $this->obtenerPeriodo();

        $datos = $this->adminModel->getUsuariosPorGrupoEdad($periodo);

        $this->generarGraficoBarras(
            "Usuarios por grupo de edad",
            $datos,
            "grupo_edad",
            "cantidad"
        );
    }

    private function obtenerPeriodo()
    {
        $periodo = $this->request->get("periodo") ?? "mes";

        if (!in_array($periodo, ["dia", "semana", "mes", "anio"])) {
            return "mes";
        }

        return $periodo;
    }

    private function validarAdmin()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            exit;
        }

        if (!isset($_SESSION["usuario_rol"]) || $_SESSION["usuario_rol"] !== "ADMIN") {
            Redirect::to("/home/ver");
            exit;
        }
    }

    private function generarGraficoBarras($titulo, $datos, $campoTexto, $campoValor)
    {
        require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph.php");
        require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph_bar.php");

        $labels = [];
        $valores = [];

        foreach ($datos as $fila) {
            $labels[] = $fila[$campoTexto];
            $valores[] = (float) $fila[$campoValor];
        }

        if (empty($valores)) {
            $labels = ["Sin datos"];
            $valores = [0];
        }

        $graph = new Graph(850, 420);
        $graph->SetScale("textlin");
        $graph->SetMargin(60, 30, 60, 110);

        $graph->title->Set($titulo);

        $graph->xaxis->SetTickLabels($labels);
        $graph->xaxis->SetLabelAngle(45);

        $barplot = new BarPlot($valores);
        $barplot->SetFillColor("#f2c94c");
        $barplot->value->Show();

        $graph->Add($barplot);

        $graph->Stroke();
        exit;
    }

    private function generarGraficoTorta($titulo, $datos, $campoTexto, $campoValor)
    {
        require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph.php");
        require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph_pie.php");

        $labels = [];
        $valores = [];

        foreach ($datos as $fila) {
            $labels[] = $fila[$campoTexto];
            $valores[] = (float) $fila[$campoValor];
        }

        if (empty($valores)) {
            $labels = ["Sin datos"];
            $valores = [1];
        }

        $graph = new PieGraph(850, 420);
        $graph->title->Set($titulo);

        $pie = new PiePlot($valores);
        $pie->SetLegends($labels);
        $pie->SetCenter(0.35, 0.55);
        $pie->SetSize(0.3);
        $pie->value->Show();

        $graph->Add($pie);

        $graph->Stroke();
        exit;
    }

    private function agregarBarra($filas, $campo, $maximo = null)
    {
        if (empty($filas)) {
            return [];
        }

        if ($maximo === null) {
            $maximo = 0;

            foreach ($filas as $fila) {
                if ($fila[$campo] > $maximo) {
                    $maximo = $fila[$campo];
                }
            }
        }

        foreach ($filas as &$fila) {
            $valor = $fila[$campo];

            if ($maximo > 0) {
                $fila["barra"] = round(($valor * 100) / $maximo);
            } else {
                $fila["barra"] = 0;
            }
        }

        return $filas;
    }
}