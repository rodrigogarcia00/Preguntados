<?php

class UsuarioModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getByUsername($username) {
        $sql = "SELECT * FROM usuarios WHERE username = ?";
        Log::info("UsuarioModel::getByUsername username: $username");
        $filas = $this->database->query($sql, [$username]);
        return !empty($filas) ? $filas[0] : null;
    }

    public function registrarUsuario($nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto) {
        $sql = "INSERT INTO usuarios (nombre, anio_nacimiento, sexo, username, email, password, pais, ciudad, foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Log::info("SQL: $sql [$nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto]");

        return $this->database->execute($sql, [$nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto]);
    }
    public function existeUsername($username) {
        $sql = "SELECT id FROM usuarios WHERE username = ?";
        $filas = $this->database->query($sql, [$username]);
        return !empty($filas);
    }
    public function existeEmail($email) {
        $sql = "SELECT id FROM usuarios WHERE email = ?";
        $filas = $this->database->query($sql, [$email]);
        return !empty($filas);
    }

}
