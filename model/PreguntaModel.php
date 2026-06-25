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

    public function obtenerPreguntaParaUsuario($usuarioId) {
        $pregunta = $this->obtenerPreguntaNoVista($usuarioId);

        if ($pregunta != null) {
            return $pregunta;
        }

        return $this->obtenerPreguntaAleatoria();
    }

    public function obtenerPreguntaNoVista($usuarioId) {
        $sql = "SELECT p.*
                FROM preguntas p
                WHERE p.id NOT IN (
                    SELECT pregunta_id
                    FROM usuario_pregunta_vista
                    WHERE usuario_id = ?
                )
                ORDER BY RAND()
                LIMIT 1";

        $resultado = $this->database->query($sql, [$usuarioId]);

        return $resultado[0] ?? null;
    }
    public function guardarPreguntaVista($usuarioId, $preguntaId) {
        if (!$this->yaVioPregunta($usuarioId, $preguntaId)) {
            $sql = "INSERT INTO usuario_pregunta_vista (usuario_id, pregunta_id) VALUES (?, ?)";

            $this->database->execute($sql, [$usuarioId, $preguntaId]);
        }
    }
    public function yaVioPregunta($usuarioId, $preguntaId) {
        $sql = "SELECT id FROM usuario_pregunta_vista WHERE usuario_id = ? AND pregunta_id = ?";

        $resultado = $this->database->query($sql, [$usuarioId, $preguntaId]);

        return count($resultado) > 0;
    }

}
