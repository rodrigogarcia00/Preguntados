<?php

class MyDatabase
{
    private $conexion;

    public function __construct($hostname, $username, $password, $database)
    {
        $this->conexion = new mysqli($hostname, $username, $password, $database);

        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }

        $this->conexion->set_charset("utf8mb4");
    }

    public function query($sql, $params = [])
    {
        $stmt = $this->conexion->prepare($sql);

        if (!$stmt) {
            die("Error preparando consulta: " . $this->conexion->error);
        }

        $this->bindParams($stmt, $params);

        $stmt->execute();

        $resultado = $stmt->get_result();

        if (!$resultado) {
            return [];
        }

        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function execute($sql, $params = [])
    {
        $stmt = $this->conexion->prepare($sql);

        if (!$stmt) {
            die("Error preparando consulta: " . $this->conexion->error);
        }

        $this->bindParams($stmt, $params);

        $stmt->execute();

        return $stmt->affected_rows;
    }

    private function bindParams($stmt, $params)
    {
        if (empty($params)) {
            return;
        }

        $types = "";

        foreach ($params as $param) {
            if (is_int($param)) {
                $types .= "i";
            } else if (is_float($param)) {
                $types .= "d";
            } else {
                $types .= "s";
            }
        }

        $bindParams = [];
        $bindParams[] = $types;

        foreach ($params as $key => $value) {
            $bindParams[] = &$params[$key];
        }

        call_user_func_array([$stmt, "bind_param"], $bindParams);
    }

    public function getLastInsertId()
    {
        return $this->conexion->insert_id;
    }

    public function __destruct()
    {
        $this->conexion->close();
    }
}