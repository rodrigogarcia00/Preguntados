<?php

class usuarioModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getByUsername($username) {
        $sql = "SELECT * FROM usuarios WHERE username = ?";
        log::info("UsuarioModel::getByUsername username: $username");
        $filas = $this->database->query($sql, [$username]);
        return !empty($filas) ? $filas[0] : null;
    }
}