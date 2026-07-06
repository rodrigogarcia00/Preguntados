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
        session_start();

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }

        if (!isset($_SESSION["usuario_rol"]) || $_SESSION["usuario_rol"] !== "ADMIN") {
            Redirect::to("/home/ver");
            return;
        }

        $periodo = $this->request->get("periodo") ?? "mes";

        if (!in_array($periodo, ["dia", "semana", "mes", "anio"])) {
            $periodo = "mes";
        }

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