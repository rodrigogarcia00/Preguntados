<?php

class PreguntaModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    private function obtenerNivelUsuario($usuarioId) {
        $sql = "SELECT preguntas_respondidas, respuestas_correctas FROM usuarios WHERE id = ?";
        $filas = $this->database->query($sql, [$usuarioId]);

        if (empty($filas)) {
            return 0.50;
        }

        $respondidas = (int) $filas[0]['preguntas_respondidas'];
        $correctas = (int) $filas[0]['respuestas_correctas'];

        if ($respondidas < 10) {
            return 0.50; // Nivel medio si respondió menos de 10 preguntas
        }

        // Calculamos su porcentaje de aciertos (Nivel 0.00 a 1.00)
        return round($correctas / $respondidas, 2);
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

        $pregunta["nivel_descripcion"] = $this->obtenerDescripcionNivel($pregunta["nivel"]);

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
        $nivelUsuario = $this->obtenerNivelUsuario($usuarioId);

        $margenInferior = $nivelUsuario - 0.20;
        $margenSuperior = $nivelUsuario + 0.20;

        // Buscamos una pregunta NO VISTA que encaje con su nivel
        $sql = "SELECT p.*
                FROM preguntas p
                WHERE p.id NOT IN (
                    SELECT pregunta_id
                    FROM usuario_pregunta_vista
                    WHERE usuario_id = ?
                )
                AND p.nivel BETWEEN ? AND ?
                ORDER BY RAND()
                LIMIT 1";

        $resultado = $this->database->query($sql, [$usuarioId, $margenInferior, $margenSuperior]);

        // Si no hay preguntas de su nivel, le damos CUALQUIER pregunta que no haya visto
        if (empty($resultado)) {
            $sqlFallback = "SELECT p.*
                            FROM preguntas p
                            WHERE p.id NOT IN (
                                SELECT pregunta_id
                                FROM usuario_pregunta_vista
                                WHERE usuario_id = ?
                            )
                            ORDER BY RAND()
                            LIMIT 1";
            $resultado = $this->database->query($sqlFallback, [$usuarioId]);
        }

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

    public function actualizarNivel($preguntaId, $respondioCorrectamente) {
        if ($respondioCorrectamente) {
            $sql = "UPDATE preguntas
                    SET veces_respondida = veces_respondida + 1,
                        veces_correcta = veces_correcta + 1
                    WHERE id = ?";
        } else {
            $sql = "UPDATE preguntas
                    SET veces_respondida = veces_respondida + 1
                    WHERE id = ?";
        }

        $this->database->execute($sql, [$preguntaId]);

        $this->recalcularNivel($preguntaId);
    }

    private function recalcularNivel($preguntaId) {
        $sql = "SELECT veces_respondida, veces_correcta
                FROM preguntas
                WHERE id = ?";

        $filas = $this->database->query($sql, [$preguntaId]);

        if (empty($filas)) {
            return;
        }

        $pregunta = $filas[0];

        $vecesRespondida = (int) $pregunta["veces_respondida"];
        $vecesCorrecta = (int) $pregunta["veces_correcta"];

        if ($vecesRespondida < 10) {
            $nivel = 0.40;
        } else {
            $vecesIncorrecta = $vecesRespondida - $vecesCorrecta;
            $nivel = $vecesIncorrecta / $vecesRespondida;
            $nivel = round($nivel, 2);
        }

        $sql = "UPDATE preguntas
                SET nivel = ?
                WHERE id = ?";

        $this->database->execute($sql, [$nivel, $preguntaId]);
    }

    public function obtenerDescripcionNivel($nivel) {
        $nivel = (float) $nivel;

        if ($nivel <= 0.25) {
            return "Fácil";
        }

        if ($nivel <= 0.50) {
            return "Medio";
        }

        if ($nivel <= 0.75) {
            return "Difícil";
        }

        return "Muy difícil";
    }

}
