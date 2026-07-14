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
            WHERE p.activa = 1 AND c.activa = 1
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
        $estadisticas = $this->obtenerEstadisticasUsuario($usuarioId);

        $totalRespondidas = $estadisticas["total"];
        $correctas = $estadisticas["correctas"];

        if ($totalRespondidas >= 10) {
            $ratioCorrectas = round($correctas / $totalRespondidas, 2);

            $pregunta = $this->obtenerPreguntaNoVistaMasCercanaAlNivel($usuarioId, $ratioCorrectas);

            if ($pregunta != null) {
                return $pregunta;
            }

            return $this->obtenerPreguntaMasCercanaAlNivel($ratioCorrectas);
        }

        $pregunta = $this->obtenerPreguntaNoVista($usuarioId);

        if ($pregunta != null) {
            return $pregunta;
        }

        return $this->obtenerPreguntaAleatoria();
    }

    public function obtenerPreguntaNoVista($usuarioId) {
        $sql = "SELECT p.*
                FROM preguntas p
                INNER JOIN categorias c ON p.categoria_id = c.id
                WHERE p.activa = 1 AND c.activa = 1 AND p.id NOT IN (
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

    public function guardarPreguntaSugerida($usuarioId, $categoriaId, $pregunta, $opA, $opB, $opC, $opD, $correcta) {
        $sql = "INSERT INTO preguntas_sugeridas 
            (usuario_id, categoria_id, pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        $this->database->execute($sql, [$usuarioId, $categoriaId, $pregunta, $opA, $opB, $opC, $opD, $correcta]);
    }

    public function getCategorias() {
        $sql = "SELECT * FROM categorias WHERE activa = 1";
        return $this->database->query($sql);
    }

    private function obtenerEstadisticasUsuario($usuarioId) {
        $sql = "SELECT COUNT(*) AS total, SUM(correcta) AS correctas
                FROM respuestas_usuario
                WHERE usuario_id = ?";

        Log::info("PreguntaModel::obtenerEstadisticasUsuario usuarioId: $usuarioId");
        $filas = $this->database->query($sql, [$usuarioId]);
        return !empty($filas) ? $filas[0] : ["total" => 0, "correctas" => 0];
    }

    private function obtenerPreguntaNoVistaMasCercanaAlNivel($usuarioId, $nivelObjetivo) {
        $sql = "SELECT p.*
                FROM preguntas p
                INNER JOIN categorias c ON p.categoria_id = c.id
                WHERE p.activa = 1 AND c.activa = 1 AND p.id NOT IN (
                    SELECT pregunta_id
                    FROM usuario_pregunta_vista
                    WHERE usuario_id = ?
                )
                ORDER BY ABS(p.nivel - ?), RAND()
                LIMIT 1";

        Log::info("PreguntaModel::obtenerPreguntaNoVistaMasCercanaAlNivel usuarioId: $usuarioId, nivelObjetivo: $nivelObjetivo");
        $filas = $this->database->query($sql, [$usuarioId, $nivelObjetivo]);
        return !empty($filas) ? $filas[0] : null;
    }

    private function obtenerPreguntaMasCercanaAlNivel($nivelObjetivo) {
        $sql = "SELECT p.*
                FROM preguntas p
                INNER JOIN categorias c ON p.categoria_id = c.id
                WHERE p.activa = 1 AND c.activa = 1
                ORDER BY ABS(p.nivel - ?), RAND()
                LIMIT 1";

        Log::info("PreguntaModel::obtenerPreguntaMasCercanaAlNivel nivelObjetivo: $nivelObjetivo");
        $filas = $this->database->query($sql, [$nivelObjetivo]);
        return !empty($filas) ? $filas[0] : null;
    }

}
