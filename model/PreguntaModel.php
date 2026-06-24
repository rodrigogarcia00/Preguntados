<?php

class PreguntaModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function obtenerAleatoriaConRespuestas() {
        $pregunta = $this->obtenerPreguntaAleatoria();

        if ($pregunta === null) {
            return null;
        }

        $pregunta["respuestas"] = $this->obtenerRespuestasDePregunta($pregunta["id"]);

        return $pregunta;
    }

    private function obtenerPreguntaAleatoria() {
        $sql = "SELECT p.id,
                p.enunciado,
                p.nivel,
                c.nombre AS categoria_nombre,
                c.color AS categoria_color
            FROM preguntas p
            INNER JOIN categorias c ON c.id = p.categoria_id
            ORDER BY RAND()
            LIMIT 1";

        $filas = $this->database->query($sql);

        return !empty($filas) ? $filas[0] : null;
    }

    private function obtenerRespuestasDePregunta($preguntaId) {
        $sql = "SELECT id, texto
            FROM respuestas
            WHERE pregunta_id = ?
            ORDER BY RAND()";

        $filas = $this->database->query($sql, [$preguntaId]);

        return !empty($filas) ? $filas : null;
    }

    public function obtenerPorIdConRespuestas($preguntaId) {
        $pregunta = $this->obtenerPreguntaPorId($preguntaId);

        $pregunta["respuestas"] = $this->obtenerRespuestasDePregunta($pregunta["id"]);

        return $pregunta;
    }

    private function obtenerPreguntaPorId($preguntaId) {
        $sql = "SELECT p.id,
                    p.enunciado,
                    p.nivel,
                    c.nombre AS categoria_nombre,
                    c.color AS categoria_color
                FROM preguntas p
                INNER JOIN categorias c ON c.id = p.categoria_id
                WHERE p.id = ?";

        $filas = $this->database->query($sql, [$preguntaId]);

        return $filas[0];
    }
}
