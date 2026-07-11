<?php

class SessionHelper {
    public static function iniciarSesion() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    public static function validarAcceso($controller, $method) {
        
        $controller = strtolower($controller ? $controller : "landing");
        $method = $method ? $method : "ver";

        if (self::usuarioLogueadoYQuiereEntrarAlLogin($controller, $method)) {
            self::redirigirUsuarioLogueado();
        }

        if (self::esRutaAdmin($controller, $method)) {
            self::validarAdmin();
            return;
        }

        if (!self::esRutaPublica($controller, $method)) {
            self::validarUsuarioLogueado();
        }
    }

    private static function usuarioLogueadoYQuiereEntrarAlLogin($controller, $method) {
        return self::estaLogueado() && $controller === "login" && in_array($method, ["ver", "verRegistro"], true);
    }

    private static function redirigirUsuarioLogueado() {
        if (self::esAdminLogueado()) {
            Redirect::to("/admin/reportes");
        }
        Redirect::to("/home/ver");
    }

    private static function validarUsuarioLogueado() {
        if (!self::estaLogueado()) {
            Redirect::to("/login/ver");
        }
    }

    private static function validarAdmin() {
        if (!self::estaLogueado()) {
            Redirect::to("/login/ver");
        }

        if (!self::esAdminLogueado()) {
            Redirect::to("/home/ver");
        }
    }

    private static function estaLogueado() {
        return isset($_SESSION["usuario_id"]);
    }

    private static function esAdminLogueado() {
        return isset($_SESSION["usuario_rol"]) && $_SESSION["usuario_rol"] === "ADMIN";
    }

    private static function esRutaPublica($controller, $method) {
        $rutasPublicas = [
            "landing" => ["ver"],
            "login" => ["ver", "verRegistro", "registrar", "validar"],
            "usuario" => ["validar"],
        ];

        return isset($rutasPublicas[$controller])
            && in_array($method, $rutasPublicas[$controller], true);
    }

    private static function esRutaAdmin($controller, $method) {
        return $controller === "admin";
    }
}
