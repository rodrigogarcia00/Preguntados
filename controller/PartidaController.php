<?php

class PartidaController {

    private const LOGIN_VER = "/login/ver";
    private $renderer;
    private $partidaModel;
    private $preguntaModel;
    private const TIEMPO_LIMITE_PREGUNTA = 30;
    private $usuarioModel;

    public function __construct($renderer, $partidaModel, $preguntaModel, $usuarioModel) {
        $this->renderer = $renderer;
        $this->partidaModel = $partidaModel;
        $this->preguntaModel = $preguntaModel;
        $this->usuarioModel = $usuarioModel;
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

        if (!isset($_SESSION["partida_id"]) || !isset($_POST["pregunta_id"])) {
            Redirect::to("/home/ver");
        }

        $partidaId = $_SESSION["partida_id"];
        $preguntaId = $_POST["pregunta_id"];
        $respuestaId = $_POST["respuesta_id"] ?? null;

        $resultadoFueraTiempo = $this->verificarYProcesarTiempoAgotado($partidaId, $preguntaId);

        if ($resultadoFueraTiempo !== null) {
            $this->renderer->render("partida/resultado", $resultadoFueraTiempo);
            return;
        }

        if ($respuestaId === null) {
            Redirect::to("/home/ver");
        }

        $resultado = $this->partidaModel->responder($partidaId, $preguntaId, $respuestaId);

        unset($_SESSION["pregunta_inicio"]);
        unset($_SESSION["pregunta_actual_timer_id"]);

        if ($resultado["correcta"]) {
            Redirect::to("/partida/jugar");
        }

        $this->renderer->render("partida/resultado", $resultado);
    }

    private function mostrarPregunta($partidaId) {
        $pregunta = $this->partidaModel->obtenerPreguntaActualONueva($partidaId);

        $puntaje = $this->partidaModel->obtenerPuntaje($partidaId);

        $preguntaId = $pregunta["id"];
        $tiempoRestante = $this->calcularTiempoRestante($preguntaId);

        // Atrapamos el mensaje de la trampita si es que viene de usar una
        $mensajeTrampita = $_SESSION['mensaje_trampita'] ?? null;
        unset($_SESSION['mensaje_trampita']); // Lo borramos para que no aparezca en la siguiente pregunta

        $this->renderer->render("partida/jugar", [
            "pregunta_id" => $pregunta["id"],
            "pregunta_enunciado" => $pregunta["enunciado"],
            "categoria_nombre" => $pregunta["categoria_nombre"],
            "categoria_color" => $pregunta["categoria_color"],
            "respuestas" => $pregunta["respuestas"],
            "puntaje" => $puntaje,
            "nivel_descripcion" => $pregunta["nivel_descripcion"],
            "tiempo_limite" => $tiempoRestante,
            "trampitas" => $_SESSION["trampitas"] ?? 0,
            "mensaje_trampita" => $mensajeTrampita
        ]);
    }

    private function calcularTiempoRestante($preguntaId) {
        if (!isset($_SESSION["pregunta_inicio"]) || !isset($_SESSION["pregunta_actual_timer_id"]) || $_SESSION["pregunta_actual_timer_id"] != $preguntaId) {
            $_SESSION["pregunta_inicio"] = time();
            $_SESSION["pregunta_actual_timer_id"] = $preguntaId;
        }

        $segundosTranscurridos = time() - $_SESSION["pregunta_inicio"];
        $tiempoRestante = self::TIEMPO_LIMITE_PREGUNTA - $segundosTranscurridos;

        if ($tiempoRestante < 0) {
            $tiempoRestante = 0;
        }

        return $tiempoRestante;
    }

    private function verificarYProcesarTiempoAgotado($partidaId, $preguntaId) {
        $inicio = $_SESSION["pregunta_inicio"] ?? null;

        $tiempoAgotado = $inicio === null || (time() - $inicio) >= self::TIEMPO_LIMITE_PREGUNTA;

        if ($tiempoAgotado) {
            $resultado = $this->partidaModel->responderFueraDeTiempo($partidaId, $preguntaId);

            unset($_SESSION["pregunta_inicio"]);
            unset($_SESSION["pregunta_actual_timer_id"]);

            return $resultado;
        }

        return null;
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

    public function usarTrampita() {
        session_start();
        if (!isset($_SESSION["usuario_id"]) || !isset($_SESSION["partida_id"])) {
            Redirect::to("/login");
        }

        $preguntaId = $_POST["pregunta_id"] ?? null;
        $usuarioId = $_SESSION["usuario_id"];
        $partidaId = $_SESSION["partida_id"];

        if (isset($_SESSION["trampitas"]) && $_SESSION["trampitas"] > 0) {
            $this->usuarioModel->descontarTrampita($usuarioId);
            $_SESSION["trampitas"] -= 1;

            $respuestaCorrecta = $this->partidaModel->obtenerRespuestaCorrecta($preguntaId);

            if ($respuestaCorrecta) {
                $this->partidaModel->responder($partidaId, $preguntaId, $respuestaCorrecta['id']);
                $_SESSION['mensaje_trampita'] = "🃏 ¡Trampita usada! Sumaste 1 punto. La respuesta era: " . $respuestaCorrecta['texto'];
            }

            unset($_SESSION["pregunta_inicio"]);
            unset($_SESSION["pregunta_actual_timer_id"]);

            Redirect::to("/partida/jugar");
        } else {
            Redirect::to("/home/ver");
        }
    }

    public function reportar() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to(self::LOGIN_VER);
        }

        $preguntaId = $_POST["pregunta_id"] ?? null;
        $motivo = $_POST["motivo"] ?? null;
        $usuarioId = $_SESSION["usuario_id"];

        if ($preguntaId && $motivo) {
            $this->partidaModel->guardarReporte($preguntaId, $usuarioId, $motivo);
            Redirect::to("/home/ver?exito=reporte");
        } else {
            Redirect::to("/home/ver");
        }
    }
    
}
