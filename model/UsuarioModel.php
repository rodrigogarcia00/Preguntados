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

    public function registrarUsuario($nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $latitud, $longitud, $foto, $codigo_verificacion) {
        $sql = "INSERT INTO usuarios (nombre, anio_nacimiento, sexo, username, email, password, pais, ciudad, latitud, longitud, foto, codigo_verificacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Log::info("SQL: $sql [$nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $latitud, $longitud, $foto, $codigo_verificacion]");

        $this->database->execute($sql, [$nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $latitud, $longitud, $foto, $codigo_verificacion]);

        return $this->database->getLastInsertId();
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

    public function buscarPorId($id) {
        $sql = "SELECT * FROM usuarios WHERE id = ?";
        $filas = $this->database->query($sql, [$id]);
        return !empty($filas) ? $filas[0] : null;
    }

    public function activarUsuario($id) {
        $sql = "UPDATE usuarios SET activo = 1 WHERE id = ?";
        return $this->database->execute($sql, [$id]);
    }

    public function getPartidasDeUsuario($usuarioId) {
        $sql = "SELECT p.id, p.puntaje, p.estado, p.fecha_inicio, p.fecha_fin
                FROM partidas p
                WHERE p.usuario_id = ?
                ORDER BY p.fecha_inicio DESC";
        Log::info("UsuarioModel::getPartidasDeUsuario id=$usuarioId");
        return $this->database->query($sql, [$usuarioId]);
    }

    public function obtenerPosicionRanking($puntaje) {
        $sql = "SELECT COUNT(*) + 1 as posicion FROM usuarios WHERE puntaje_total > ? AND activo = 1";
        $filas = $this->database->query($sql, [$puntaje]);
        return !empty($filas) ? $filas[0]['posicion'] : '-';
    }

    public function registrarCompraTrampita($usuarioId, $cantidad, $precioTotal) {
        // 1. Guardamos el registro de la venta en el historial
        $sqlCompra = "INSERT INTO compras_trampitas (usuario_id, cantidad, precio_total) 
                      VALUES ('$usuarioId', '$cantidad', '$precioTotal')";
        $this->database->execute($sqlCompra);

        // 2. Le sumamos las trampitas compradas a la "billetera" del usuario
        $sqlActualizarStock = "UPDATE usuarios 
                               SET trampitas = trampitas + $cantidad 
                               WHERE id = '$usuarioId'";
        $this->database->execute($sqlActualizarStock);
    }

    public function descontarTrampita($usuarioId) {
        // Le restamos 1 asegurándonos de que tenga más de 0
        $sql = "UPDATE usuarios SET trampitas = trampitas - 1 WHERE id = '$usuarioId' AND trampitas > 0";
        $this->database->execute($sql);
    }
}
