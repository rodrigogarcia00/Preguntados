<?php

class AdminModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    private function getRangoFechas($periodo)
    {
        $hasta = date("Y-m-d H:i:s");

        switch ($periodo) {
            case "dia":
                $desde = date("Y-m-d 00:00:00");
                break;

            case "semana":
                $desde = date("Y-m-d 00:00:00", strtotime("monday this week"));
                break;

            case "mes":
                $desde = date("Y-m-01 00:00:00");
                break;

            case "anio":
                $desde = date("Y-01-01 00:00:00");
                break;

            default:
                $desde = "1970-01-01 00:00:00";
                break;
        }

        return [$desde, $hasta];
    }

    public function getResumen($periodo)
    {
        [$desde, $hasta] = $this->getRangoFechas($periodo);

        return [
            "cantidad_jugadores" => $this->contar("SELECT COUNT(*) AS total FROM usuarios WHERE rol = 'JUGADOR'"),
            "usuarios_nuevos" => $this->contar("SELECT COUNT(*) AS total FROM usuarios WHERE fecha_creacion BETWEEN ? AND ?", [$desde, $hasta]),
            "partidas_jugadas" => $this->contar("SELECT COUNT(*) AS total FROM partidas WHERE fecha_inicio BETWEEN ? AND ?", [$desde, $hasta]),
            "preguntas_en_juego" => $this->contar("SELECT COUNT(*) AS total FROM preguntas"),
            "preguntas_creadas" => $this->contar("SELECT COUNT(*) AS total FROM preguntas WHERE fecha_creacion BETWEEN ? AND ?", [$desde, $hasta])
        ];
    }

    private function contar($sql, $params = [])
    {
        $filas = $this->database->query($sql, $params);

        return !empty($filas) ? $filas[0]["total"] : 0;
    }

    public function getCorrectasPorUsuario($periodo)
    {
        [$desde, $hasta] = $this->getRangoFechas($periodo);

        $sql = "SELECT 
                    u.id,
                    u.nombre,
                    u.username,
                    COUNT(rp.id) AS respondidas,
                    SUM(CASE WHEN rp.correcta = 1 THEN 1 ELSE 0 END) AS correctas,
                    ROUND(
                        SUM(CASE WHEN rp.correcta = 1 THEN 1 ELSE 0 END) * 100 / COUNT(rp.id),
                        2
                    ) AS porcentaje
                FROM respuestas_partida rp
                INNER JOIN usuarios u ON u.id = rp.usuario_id
                WHERE rp.fecha_respuesta BETWEEN ? AND ?
                GROUP BY u.id, u.nombre, u.username
                ORDER BY porcentaje DESC";

        return $this->database->query($sql, [$desde, $hasta]);
    }

    public function getUsuariosPorPais($periodo)
    {
        [$desde, $hasta] = $this->getRangoFechas($periodo);

        $sql = "SELECT pais, COUNT(*) AS cantidad
                FROM usuarios
                WHERE fecha_creacion BETWEEN ? AND ?
                GROUP BY pais
                ORDER BY cantidad DESC";

        return $this->database->query($sql, [$desde, $hasta]);
    }

    public function getUsuariosPorSexo($periodo)
    {
        [$desde, $hasta] = $this->getRangoFechas($periodo);

        $sql = "SELECT sexo, COUNT(*) AS cantidad
                FROM usuarios
                WHERE fecha_creacion BETWEEN ? AND ?
                GROUP BY sexo
                ORDER BY cantidad DESC";

        return $this->database->query($sql, [$desde, $hasta]);
    }

    public function getUsuariosPorGrupoEdad($periodo)
    {
        [$desde, $hasta] = $this->getRangoFechas($periodo);

        $sql = "SELECT 
                    CASE 
                        WHEN YEAR(CURDATE()) - anio_nacimiento < 18 THEN 'Menores'
                        WHEN YEAR(CURDATE()) - anio_nacimiento >= 65 THEN 'Jubilados'
                        ELSE 'Medio'
                    END AS grupo_edad,
                    COUNT(*) AS cantidad
                FROM usuarios
                WHERE fecha_creacion BETWEEN ? AND ?
                GROUP BY grupo_edad
                ORDER BY cantidad DESC";

        return $this->database->query($sql, [$desde, $hasta]);
    }
}