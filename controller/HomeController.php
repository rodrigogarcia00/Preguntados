<?php
class HomeController {

    private $renderer;
    private $partidaModel;

    public function __construct($renderer, $partidaModel) {
        $this->renderer = $renderer;
        $this->partidaModel = $partidaModel;
    }

    public function ver() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }

        Log::info("HomeController::ver - usuario: " . $_SESSION["username"]);

        $estadisticas = $this->partidaModel->obtenerEstadisticasLobby($_SESSION["usuario_id"]);
        $puntaje = $estadisticas['puntaje_total'];
        $posicion = $estadisticas['posicion'];
        $trampitas = $_SESSION["trampitas"] ?? 0;

        $partidas = $this->partidaModel->obtenerHistorialDeUsuario($_SESSION["usuario_id"]);

        $this->renderer->render("verHomeView", [
            "nombre"              => $_SESSION["usuario_nombre"],
            "puntaje"             => $puntaje,
            "posicion"            => $posicion,
            "trampitas"           => $trampitas,

            "con_partidas"        => !empty($partidas),
            "sin_partidas"        => empty($partidas),
            "partidas"            => $partidas,

            "partidas_pendientes" => false,
            "pendientes"          => [],
        ]);
    }
}
