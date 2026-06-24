<?php

class PartidaController {

    private const LOGIN_VER = "/login/ver";
    private $renderer;
    private $partidaModel;
    private $preguntaModel;

    public function __construct($renderer, $partidaModel, $preguntaModel) {
        $this->renderer = $renderer;
        $this->partidaModel = $partidaModel;
        $this->preguntaModel = $preguntaModel;
    }

    public function nueva() {
        session_start();

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to(self::LOGIN_VER);
        }

        $usuarioId = $_SESSION["usuario_id"];

        $partidaId = $this->partidaModel->crear($usuarioId);

        $_SESSION["partida_id"] = $partidaId;

        Redirect::to("/partida/jugar");
    }

    public function responder() {
        session_start();

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to(self::LOGIN_VER);
        }

        if (!isset($_SESSION["partida_id"])) {
            Redirect::to("/home/ver");
        }

        if (!isset($_POST["pregunta_id"]) || !isset($_POST["respuesta_id"])) {
            Redirect::to("/home/ver");
        }

        $partidaId = $_SESSION["partida_id"];
        $preguntaId = $_POST["pregunta_id"];
        $respuestaId = $_POST["respuesta_id"];

        $resultado = $this->partidaModel->responder($partidaId, $preguntaId, $respuestaId);

        if ($resultado["correcta"]) {
            $this->mostrarPregunta($partidaId);
            return;
        }

        unset($_SESSION["partida_id"]);

        $this->renderer->render("partida/resultado", $resultado);
    }

    private function mostrarPregunta($partidaId) {
        $pregunta = $this->partidaModel->obtenerPreguntaActualONueva($partidaId);

        $puntaje = $this->partidaModel->obtenerPuntaje($partidaId);

        $this->renderer->render("partida/jugar", [
            "pregunta_id" => $pregunta["id"],
            "pregunta_enunciado" => $pregunta["enunciado"],
            "categoria_nombre" => $pregunta["categoria_nombre"],
            "categoria_color" => $pregunta["categoria_color"],
            "respuestas" => $pregunta["respuestas"],
            "puntaje" => $puntaje
        ]);
    }

    public function jugar() {
        session_start();

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to(self::LOGIN_VER);
        }

        if (!isset($_SESSION["partida_id"])) {
            Redirect::to("/partida/nueva");
        }

        $this->mostrarPregunta($_SESSION["partida_id"]);
    }
    
}
