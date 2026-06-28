<?php

class PartidaModel {
    private $database;

    private $preguntaModel;

    public function __construct($database, $preguntaModel) {
        $this->database = $database;
        $this->preguntaModel = $preguntaModel;
    }

    public function crear($usuarioId) {
        $sql = "INSERT INTO partidas (usuario_id, puntaje, estado, fecha_inicio) VALUES (?, ?, ?, ?)";
        $this->database->execute($sql, [$usuarioId, 0, 'ACTIVA', date('Y-m-d H:i:s')]);
        return $this->database->getLastInsertId();
    }

    public function responder($partidaId, $preguntaId, $respuestaId) {
        $respuestaCorrecta = $this->buscarRespuestaCorrecta($preguntaId);

        if ($respuestaCorrecta === null) {
            $this->finalizar($partidaId);

            return [
                "correcta" => false,
                "puntaje" => $this->obtenerPuntaje($partidaId),
                "mensaje" => "La pregunta no tiene respuesta correcta cargada.",
                "respuesta_correcta" => "No disponible"
            ];
        }

        $respondioCorrectamente = $respuestaId == $respuestaCorrecta["id"];

        $this->preguntaModel->actualizarNivel($preguntaId, $respondioCorrectamente);

        if ($respondioCorrectamente) {
            $this->sumarPunto($partidaId);
            $this->limpiarPreguntaActual($partidaId);

            return [
                "correcta" => true,
                "puntaje" => $this->obtenerPuntaje($partidaId)
            ];
        }

        $this->finalizar($partidaId);

        return [
            "correcta" => false,
            "puntaje" => $this->obtenerPuntaje($partidaId),
            "mensaje" => "Respuesta incorrecta.",
            "respuesta_correcta" => $respuestaCorrecta["texto"]
        ];
    }

    public function obtenerPuntaje($partidaId) {
        $sql = "SELECT puntaje FROM partidas WHERE id = ?";

        $filas = $this->database->query($sql, [$partidaId]);

        return !empty($filas) ? $filas[0]["puntaje"] : null;
    }

    private function buscarRespuestaCorrecta($preguntaId) {
        $sql = "SELECT id, texto
            FROM respuestas
            WHERE pregunta_id = ?
            AND es_correcta = 1
            LIMIT 1";

        $filas = $this->database->query($sql, [$preguntaId]);

        return !empty($filas) ? $filas[0] : null;
    }

    private function sumarPunto($partidaId) {
        $sql = "UPDATE partidas
            SET puntaje = puntaje + 1
            WHERE id = ?
            AND estado = 'ACTIVA'";

        $this->database->execute($sql, [$partidaId]);
    }

    private function finalizar($partidaId) {
        $sql = "UPDATE partidas
            SET estado = 'FINALIZADA',
                fecha_fin = NOW()
            WHERE id = ?";

        $this->database->execute($sql, [$partidaId]);
    }

    public function obtenerPreguntaActualONueva($partidaId) {
        $partida = $this->buscarPorId($partidaId);

        if ($partida["pregunta_actual_id"] !== null) {
            return $this->preguntaModel->obtenerPorIdConRespuestas($partida["pregunta_actual_id"]);
        }

        $usuarioId = $partida["usuario_id"];

        $pregunta = $this->preguntaModel->obtenerPreguntaParaUsuario($usuarioId);

        $this->asignarPreguntaActual($partidaId, $pregunta["id"]);

        $this->preguntaModel->guardarPreguntaVista($usuarioId, $pregunta["id"]);

        return $this->preguntaModel->obtenerPorIdConRespuestas($pregunta["id"]);
    }

    private function buscarPorId($partidaId) {
        $sql = "SELECT *
                FROM partidas
                WHERE id = ?";

        $filas = $this->database->query($sql, [$partidaId]);

        return $filas[0];
    }

    private function asignarPreguntaActual($partidaId, $preguntaId) {
        $sql = "UPDATE partidas
                SET pregunta_actual_id = ?,
                    pregunta_inicio = ?
                WHERE id = ?";

        $this->database->execute($sql, [$preguntaId, date('Y-m-d H:i:s'), $partidaId]);
    }

    private function limpiarPreguntaActual($partidaId) {
        $sql = "UPDATE partidas
                SET pregunta_actual_id = NULL,
                    pregunta_inicio = NULL
                WHERE id = ?";

        $this->database->execute($sql, [$partidaId]);
    }

    public function responderFueraDeTiempo($partidaId, $preguntaId) {
        $respuestaCorrecta = $this->buscarRespuestaCorrecta($preguntaId);

        $this->preguntaModel->actualizarNivel($preguntaId, false);

        $this->finalizar($partidaId);

        return [
            "correcta" => false,
            "puntaje" => $this->obtenerPuntaje($partidaId),
            "mensaje" => "Se terminó el tiempo.",
            "respuesta_correcta" => $respuestaCorrecta["texto"]
        ];
    }
}
