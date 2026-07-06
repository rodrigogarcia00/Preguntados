<?php

class PreguntaController {
    private $preguntaModel;
    private $renderer;

    public function __construct($preguntaModel, $renderer) {
        $this->preguntaModel = $preguntaModel;
        $this->renderer = $renderer;
    }

    public function sugerir() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login");
        }

        $data["categorias"] = $this->preguntaModel->getCategorias();
        $this->renderer->render("sugerirPregunta", $data);
    }

    public function procesarSugerencia() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login");
        }

        $usuarioId = $_SESSION["usuario_id"];
        $categoriaId = $_POST["categoria_id"] ?? null;
        $pregunta = $_POST["pregunta"] ?? null;
        $opA = $_POST["opcion_a"] ?? null;
        $opB = $_POST["opcion_b"] ?? null;
        $opC = $_POST["opcion_c"] ?? null;
        $opD = $_POST["opcion_d"] ?? null;
        $correcta = $_POST["respuesta_correcta"] ?? null;

        if ($categoriaId && $pregunta && $opA && $opB && $opC && $opD && $correcta) {
            $this->preguntaModel->guardarPreguntaSugerida(
                $usuarioId, $categoriaId, $pregunta, $opA, $opB, $opC, $opD, $correcta
            );
        }

        Redirect::to("/home/ver?exito=pregunta");
    }
}