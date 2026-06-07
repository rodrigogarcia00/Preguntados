<?php

class UsuarioModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function registrarUsuario($nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto) {
        $sql = "INSERT INTO usuarios (nombre, anio_nacimiento, sexo, username, email, password, pais, ciudad, foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Log::info("SQL: $sql [$nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto]");

        return $this->database->execute($sql, [$nombre, $anio_nacimiento, $sexo, $username, $email, password_hash($password, PASSWORD_BCRYPT), $pais, $ciudad, $foto]);
    }
    

}
