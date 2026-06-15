<?php

class LandingController {
    private $renderer;

    public function __construct($renderer) {
        $this->renderer = $renderer;
    }

    public function ver(){
        session_start();
        $logueado = isset($_SESSION["usuario_id"]);

        $this->renderer->render("verLandingView", [
            "logueado" => $logueado,
            "destino_jugar" => $logueado ? "/home/ver" : "/login/ver"
        ]);
    }
}