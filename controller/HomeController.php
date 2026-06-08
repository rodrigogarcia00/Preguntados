<?php
class HomeController {

    private $renderer;

    public function __construct($renderer) {
        $this->renderer = $renderer;
    }

    public function ver() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }

        Log::info("HomeController::ver - usuario: " . $_SESSION["username"]);

        //Datos del usuario
        $puntaje   = $_SESSION["puntaje"]   ?? 0;
        $posicion  = $_SESSION["posicion"]  ?? '-';
        $trampitas = $_SESSION["trampitas"] ?? 0;

        //Historial de partidas
        $partidas = [];

        //Partidas pendientes
        $pendientes = [];

        $this->renderer->render("verHomeView", [
            "nombre"              => $_SESSION["usuario_nombre"],
            "puntaje"             => $puntaje,
            "posicion"            => $posicion,
            "trampitas"           => $trampitas,

            // Historial
            "con_partidas"        => !empty($partidas),
            "sin_partidas"        => empty($partidas),
            "partidas"            => $partidas,

            // Desafíos pendientes
            "partidas_pendientes" => !empty($pendientes),
            "pendientes"          => $pendientes,
        ]);
    }
}
