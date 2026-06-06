<?php
class LoginController{
    private $renderer;

    public function __construct($renderer) {
        $this->renderer = $renderer;
    }

    public function verRegistro() {
        $this->renderer->render("registro");
    }

    public function registrar() {
        Redirect::to("/login/ver");
        exit;
    }

    public function ver() {
        $this->renderer->render("login");
    }

    public function validar() {
        Redirect::to("/home/ver");
        exit;
    }

    public function logout() {
        session_start();
        session_destroy();

        Redirect::to("/login/ver");
        exit;
    }
}
