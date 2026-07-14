<?php

class EditorModel
{
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getPreguntasSugeridas() {
        $query = "SELECT ps.*, c.nombre AS categoria_nombre 
                  FROM preguntas_sugeridas ps 
                  JOIN categorias c ON ps.categoria_id = c.id 
                  WHERE ps.estado = 'PENDIENTE'";
        return $this->database->query($query);
    }

    public function getPreguntasReportadas() {
        $query = "SELECT r.id AS reporte_id, r.motivo, 
                         p.id AS pregunta_id, p.enunciado AS pregunta, 
                         c.nombre AS categoria_nombre,
                         (SELECT GROUP_CONCAT(CONCAT(texto, IF(es_correcta = 1, ' (✔ Correcta)', '')) SEPARATOR ' | ') 
                          FROM respuestas 
                          WHERE pregunta_id = p.id) AS opciones_respuestas
                  FROM reportes r 
                  JOIN preguntas p ON r.pregunta_id = p.id 
                  JOIN categorias c ON p.categoria_id = c.id 
                  WHERE r.estado = 'PENDIENTE' AND p.activa = 1";

        return $this->database->query($query);
    }

    public function getPreguntaSugeridaPorId($id) {
        return $this->database->query("SELECT * FROM preguntas_sugeridas WHERE id = ?", [$id]);
    }

    public function actualizarPreguntaSugerida($id, $pregunta, $categoria_id, $resp_correcta, $opcion_a, $opcion_b, $opcion_c, $opcion_d) {
        $query = "UPDATE preguntas_sugeridas 
                  SET pregunta = ?, 
                      categoria_id = ?, 
                      respuesta_correcta = ?,
                      opcion_a = ?,
                      opcion_b = ?,
                      opcion_c = ?,
                      opcion_d = ?
                  WHERE id = ?";

        return $this->database->execute($query, [$pregunta, $categoria_id, $resp_correcta, $opcion_a, $opcion_b, $opcion_c, $opcion_d, $id]);
    }

    public function rechazarPregunta($id) {
        return $this->database->execute("UPDATE preguntas_sugeridas SET estado = 'RECHAZADA' WHERE id = ?", [$id]);
    }

    public function aprobarPregunta($id) {
        $sugeridas = $this->getPreguntaSugeridaPorId($id);

        if (count($sugeridas) > 0) {
            $sug = $sugeridas[0];

            $queryPregunta = "INSERT INTO preguntas (enunciado, categoria_id, creada_por_usuario_id) VALUES (?, ?, ?)";
            $this->database->execute($queryPregunta, [$sug['pregunta'], $sug['categoria_id'], $sug['usuario_id']]);

            $pregunta_id = $this->database->getLastInsertId();

            $this->insertarRespuesta($pregunta_id, $sug['opcion_a'], $sug['respuesta_correcta'] == 'A' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_b'], $sug['respuesta_correcta'] == 'B' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_c'], $sug['respuesta_correcta'] == 'C' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_d'], $sug['respuesta_correcta'] == 'D' ? 1 : 0);

            $queryUpdate = "UPDATE preguntas_sugeridas SET estado = 'APROBADA' WHERE id = ?";
            return $this->database->execute($queryUpdate, [$id]);
        }
    }

    public function insertarRespuesta($pregunta_id, $texto, $es_correcta) {
        $query = "INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (?, ?, ?)";
        return $this->database->execute($query, [$pregunta_id, $texto, $es_correcta]);
    }

    public function desestimarReporte($reporte_id) {
        return $this->database->execute("UPDATE reportes SET estado = 'DESESTIMADO' WHERE id = ?", [$reporte_id]);
    }

    public function deshabilitarPreguntaReportada($pregunta_id, $reporte_id = null) {
        $this->database->execute("UPDATE preguntas SET activa = 0 WHERE id = ?", [$pregunta_id]);

        if (!empty($reporte_id)) {
            $this->database->execute("UPDATE reportes SET estado = 'ACEPTADO' WHERE id = ?", [$reporte_id]);
        }
    }

    public function getTodasLasPreguntas() {
        $query = "SELECT p.id, p.enunciado, p.activa, c.nombre AS categoria_nombre, c.activa AS categoria_activa 
                  FROM preguntas p 
                  JOIN categorias c ON p.categoria_id = c.id 
                  ORDER BY p.id DESC";
        return $this->database->query($query);
    }

    public function habilitarPregunta($pregunta_id) {
        $this->database->execute("UPDATE preguntas SET activa = 1 WHERE id = ?", [$pregunta_id]);
    }

    public function getPreguntaActivaConRespuestas($id) {
        $preguntas = $this->database->query("SELECT * FROM preguntas WHERE id = ?", [$id]);
        if (empty($preguntas)) return null;

        $pregunta = $preguntas[0];

        $respuestas = $this->database->query("SELECT * FROM respuestas WHERE pregunta_id = ? ORDER BY id ASC", [$id]);

        if (count($respuestas) >= 4) {
            $pregunta['opcion_a'] = $respuestas[0]['texto']; $pregunta['id_a'] = $respuestas[0]['id'];
            if ($respuestas[0]['es_correcta'] == 1) $pregunta['respuesta_correcta'] = 'A';

            $pregunta['opcion_b'] = $respuestas[1]['texto']; $pregunta['id_b'] = $respuestas[1]['id'];
            if ($respuestas[1]['es_correcta'] == 1) $pregunta['respuesta_correcta'] = 'B';

            $pregunta['opcion_c'] = $respuestas[2]['texto']; $pregunta['id_c'] = $respuestas[2]['id'];
            if ($respuestas[2]['es_correcta'] == 1) $pregunta['respuesta_correcta'] = 'C';

            $pregunta['opcion_d'] = $respuestas[3]['texto']; $pregunta['id_d'] = $respuestas[3]['id'];
            if ($respuestas[3]['es_correcta'] == 1) $pregunta['respuesta_correcta'] = 'D';
        }

        return $pregunta;
    }

    public function actualizarPreguntaActiva($pregunta_id, $enunciado, $categoria_id, $correcta, $ids_resp, $textos_resp, $reporte_id = null) {
        $sql = "UPDATE preguntas SET enunciado = ?, categoria_id = ? WHERE id = ?";
        $this->database->execute($sql, [$enunciado, $categoria_id, $pregunta_id]);

        $letras = ['A', 'B', 'C', 'D'];
        for ($i = 0; $i < 4; $i++) {
            $es_correcta = ($correcta == $letras[$i]) ? 1 : 0;
            $sqlResp = "UPDATE respuestas SET texto = ?, es_correcta = ? WHERE id = ?";
            $this->database->execute($sqlResp, [$textos_resp[$i], $es_correcta, $ids_resp[$i]]);
        }

        if (!empty($reporte_id)) {
            $sqlRep = "UPDATE reportes SET estado = 'RESUELTO' WHERE id = ?";
            $this->database->execute($sqlRep, [$reporte_id]);
        }
    }

    public function crearPreguntaNueva($enunciado, $categoria_id, $correcta, $textos_resp, $creador_id) {
        $sql = "INSERT INTO preguntas (enunciado, categoria_id, activa, creada_por_usuario_id) VALUES (?, ?, 1, ?)";
        $this->database->execute($sql, [$enunciado, $categoria_id, $creador_id]);
        $pregunta_id = $this->database->getLastInsertId();

        $letras = ['A', 'B', 'C', 'D'];
        for ($i = 0; $i < 4; $i++) {
            $es_correcta = ($correcta == $letras[$i]) ? 1 : 0;
            $sqlResp = "INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (?, ?, ?)";
            $this->database->execute($sqlResp, [$pregunta_id, $textos_resp[$i], $es_correcta]);
        }
    }

    public function getCategorias() {
        $sql = "SELECT * FROM categorias";
        return $this->database->query($sql);
    }

    public function getCategoriasActivas() {
        return $this->database->query("SELECT * FROM categorias WHERE activa = 1");
    }

    public function getCategoriaPorId($id) {
        $res = $this->database->query("SELECT * FROM categorias WHERE id = ?", [$id]);
        return count($res) > 0 ? $res[0] : null;
    }

    public function crearCategoria($nombre, $color) {
        $sql = "INSERT INTO categorias (nombre, color) VALUES (?, ?)";
        return $this->database->execute($sql, [$nombre, $color]);
    }

    public function actualizarCategoria($id, $nombre, $color) {
        $sql = "UPDATE categorias SET nombre = ?, color = ? WHERE id = ?";
        return $this->database->execute($sql, [$nombre, $color, $id]);
    }

    public function eliminarCategoria($id) {
        $sql = "UPDATE categorias SET activa = 0 WHERE id = ?";
        return $this->database->execute($sql, [$id]);
    }

    public function activarCategoria($id) {
        $sql = "UPDATE categorias SET activa = 1 WHERE id = ?";
        return $this->database->execute($sql, [$id]);
    }
}