<?php

class PartidaController
{
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
            Redirect::to("/login/ver");
        }

        $usuarioId = $_SESSION["usuario_id"];

        $partidaId = $this->partidaModel->crear($usuarioId);

        $_SESSION["partida_id"] = $partidaId;

        $this->mostrarPregunta($partidaId);
    }

    public function responder() {
        session_start();

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
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
        $pregunta = $this->preguntaModel->obtenerAleatoriaConRespuestas();

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
    
}
