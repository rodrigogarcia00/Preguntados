<?php

class PartidaModel
{
    private $database;

    public function __construct($database) {
        $this->database = $database;
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

        if ($respuestaId == $respuestaCorrecta["id"]) {
            $this->sumarPunto($partidaId);

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
}
