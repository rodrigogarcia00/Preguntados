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
        // Traemos el reporte, la pregunta, su categoría y concatenamos sus respuestas
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
        return $this->database->query("SELECT * FROM preguntas_sugeridas WHERE id = '$id'");
    }

    public function actualizarPreguntaSugerida($id, $pregunta, $categoria_id, $resp_correcta, $opcion_a, $opcion_b, $opcion_c, $opcion_d) {
        $query = "UPDATE preguntas_sugeridas 
                  SET pregunta = '$pregunta', 
                      categoria_id = '$categoria_id', 
                      respuesta_correcta = '$resp_correcta',
                      opcion_a = '$opcion_a',
                      opcion_b = '$opcion_b',
                      opcion_c = '$opcion_c',
                      opcion_d = '$opcion_d'
                  WHERE id = '$id'";

        return $this->database->execute($query);
    }

    public function rechazarPregunta($id) {
        return $this->database->execute("UPDATE preguntas_sugeridas SET estado = 'RECHAZADA' WHERE id = '$id'");
    }

    public function aprobarPregunta($id) {
        // Obtenemos los datos de la sugerencia
        $sugeridas = $this->getPreguntaSugeridaPorId($id);

        if (count($sugeridas) > 0) {
            $sug = $sugeridas[0];

            // Insertamos en la tabla oficial de preguntas
            $queryPregunta = "INSERT INTO preguntas (enunciado, categoria_id, creada_por_usuario_id) 
                              VALUES ('" . $sug['pregunta'] . "', '" . $sug['categoria_id'] . "', '" . $sug['usuario_id'] . "')";
            $this->database->execute($queryPregunta);

            $pregunta_id = $this->database->getLastInsertId();

            $this->insertarRespuesta($pregunta_id, $sug['opcion_a'], $sug['respuesta_correcta'] == 'A' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_b'], $sug['respuesta_correcta'] == 'B' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_c'], $sug['respuesta_correcta'] == 'C' ? 1 : 0);
            $this->insertarRespuesta($pregunta_id, $sug['opcion_d'], $sug['respuesta_correcta'] == 'D' ? 1 : 0);

            return $this->database->execute("UPDATE preguntas_sugeridas SET estado = 'APROBADA' WHERE id = '$id'");
        }
    }

    public function insertarRespuesta($pregunta_id, $texto, $es_correcta) {
        $query = "INSERT INTO respuestas (pregunta_id, texto, es_correcta) 
                  VALUES ('$pregunta_id', '$texto', '$es_correcta')";
        return $this->database->execute($query);
    }

    public function desestimarReporte($reporte_id) {
        // Falsa alarma: el reporte no tenía sentido, cerramos el reporte y la pregunta sigue viva
        return $this->database->execute("UPDATE reportes SET estado = 'DESESTIMADO' WHERE id = '$reporte_id'");
    }

    public function deshabilitarPreguntaReportada($pregunta_id, $reporte_id) {
        // 1. Apagamos la pregunta para que no salga más en el juego
        $this->database->execute("UPDATE preguntas SET activa = 0 WHERE id = '$pregunta_id'");

        // 2. Cerramos el reporte como 'ACEPTADO' para que desaparezca de la lista
        return $this->database->execute("UPDATE reportes SET estado = 'ACEPTADO' WHERE id = '$reporte_id'");
    }
}