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
        $periodo = $this->request->get("periodo") ?? "anio";

        if (!in_array($periodo, ["dia", "semana", "mes", "anio"])) {
            return "anio";
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
    public function imprimirReportes()
{
    $this->validarAdmin();

    $periodo = $this->obtenerPeriodo();

    $resumen = $this->adminModel->getResumen($periodo);

    $correctasPorUsuario = $this->adminModel->getCorrectasPorUsuario($periodo);
    $usuariosPorPais = $this->adminModel->getUsuariosPorPais($periodo);
    $usuariosPorSexo = $this->adminModel->getUsuariosPorSexo($periodo);
    $usuariosPorGrupoEdad = $this->adminModel->getUsuariosPorGrupoEdad($periodo);

    $carpetaGraficos = __DIR__ . "/../public/tmp";

    if (!is_dir($carpetaGraficos)) {
        mkdir($carpetaGraficos, 0777, true);
    }

    $graficoCorrectas = $carpetaGraficos . "/grafico_correctas_$periodo.png";
    $graficoPais = $carpetaGraficos . "/grafico_pais_$periodo.png";
    $graficoSexo = $carpetaGraficos . "/grafico_sexo_$periodo.png";
    $graficoEdad = $carpetaGraficos . "/grafico_edad_$periodo.png";

    $this->crearGraficoBarrasArchivo(
        "Porcentaje de respuestas correctas por usuario",
        $correctasPorUsuario,
        "username",
        "porcentaje",
        $graficoCorrectas
    );

    $this->crearGraficoTortaArchivo(
        "Usuarios por país",
        $usuariosPorPais,
        "pais",
        "cantidad",
        $graficoPais
    );

    $this->crearGraficoTortaArchivo(
        "Usuarios por sexo",
        $usuariosPorSexo,
        "sexo",
        "cantidad",
        $graficoSexo
    );

    $this->crearGraficoBarrasArchivo(
        "Usuarios por grupo de edad",
        $usuariosPorGrupoEdad,
        "grupo_edad",
        "cantidad",
        $graficoEdad
    );

    $datos = [
        "periodo" => $periodo,

        "cantidad_jugadores" => $resumen["cantidad_jugadores"],
        "usuarios_nuevos" => $resumen["usuarios_nuevos"],
        "partidas_jugadas" => $resumen["partidas_jugadas"],
        "preguntas_en_juego" => $resumen["preguntas_en_juego"],
        "preguntas_creadas" => $resumen["preguntas_creadas"],

        "correctas_por_usuario" => $correctasPorUsuario,
        "usuarios_por_pais" => $usuariosPorPais,
        "usuarios_por_sexo" => $usuariosPorSexo,
        "usuarios_por_grupo_edad" => $usuariosPorGrupoEdad,

        "grafico_correctas" => "public/tmp/grafico_correctas_$periodo.png",
        "grafico_pais" => "public/tmp/grafico_pais_$periodo.png",
        "grafico_sexo" => "public/tmp/grafico_sexo_$periodo.png",
        "grafico_edad" => "public/tmp/grafico_edad_$periodo.png"
    ];

    ob_start();
    $this->renderer->render("adminReportesPdf", $datos);
    $html = ob_get_clean();

    require_once __DIR__ . "/../vendor/dompdf/autoload.inc.php";

    $options = new \Dompdf\Options();
    $options->set("isRemoteEnabled", true);
    $options->set("chroot", __DIR__ . "/..");
    $options->set("enable_font_subsetting", true);

    $dompdf = new \Dompdf\Dompdf($options);
    $dompdf->loadHtml($html);
    $dompdf->setPaper("A4", "portrait");
    $dompdf->render();

    $dompdf->stream("reporte_admin_$periodo.pdf", [
        "Attachment" => false
    ]);

    exit;
}
    private function crearGraficoBarrasArchivo($titulo, $datos, $campoTexto, $campoValor, $archivoSalida)
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

    $graph = new Graph(540, 260);
    $graph->SetScale("textlin");
    $graph->SetMargin(55, 25, 45, 75);

    $graph->title->Set($titulo);

    $graph->xaxis->SetTickLabels($labels);
    $graph->xaxis->SetLabelAngle(45);

    $barplot = new BarPlot($valores);
    $barplot->SetFillColor("#f2c94c");
    $barplot->value->Show();

    $graph->Add($barplot);

    $graph->Stroke($archivoSalida);
}

private function crearGraficoTortaArchivo($titulo, $datos, $campoTexto, $campoValor, $archivoSalida)
{
    require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph.php");
    require_once(__DIR__ . "/../vendor/jpgraph/src/jpgraph_pie.php");

    if (!class_exists("PieGraph")) {
        die("No se pudo cargar PieGraph. Revisá que exista vendor/jpgraph/src/jpgraph_pie.php");
    }

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

    $graph = new PieGraph(540, 260);
    $graph->title->Set($titulo);

    $pie = new PiePlot($valores);
    $pie->SetLegends($labels);
    $pie->SetCenter(0.35, 0.52);
    $pie->SetSize(0.22);
    $pie->value->Show();

    $graph->Add($pie);

    $graph->Stroke($archivoSalida);
}
private function imagenBase64($ruta)
{
    if (!file_exists($ruta)) {
        return "";
    }

    return "data:image/png;base64," . base64_encode(file_get_contents($ruta));
}
}