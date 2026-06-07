<?php
class LoginController{
    private $renderer;
    private $model;
    private $request;

    public function __construct($renderer, $model, $request) {
        $this->renderer = $renderer;
        $this->model = $model;
        $this->request = $request;
    }

    public function verRegistro() {
        $this->renderer->render("registro");
    }

    public function registrar() {
        Redirect::to("/login/ver");
        exit;
    }

    public function ver() {
        session_start();
        $error = $_SESSION["error"] ?? null;
        unset($_SESSION["error"]);
        $this->renderer->render("login", ["error" => $error]);
    }

    public function validar() {
        $username = $this->request->post("username");
        $password = $this->request->post("password");

        if (empty($username) || empty($password)) {
            session_start();
            $_SESSION["error"] = "Complete todos los campos.";
            Redirect::to("/login/ver");
            return;
        }

        $usuario = $this->model->getByUsername($username);

        if ($usuario === null || !password_verify($password, $usuario["password"])) {
            session_start();
            $_SESSION["error"] = "Usuario o contraseña incorrectos.";
            Log::warning("LoginController::validar - credenciales incorrectas: $username");
            Redirect::to("/login/ver");
            return;
        }

        session_start();
        $_SESSION["usuario_id"]     = $usuario["id"];
        $_SESSION["usuario_nombre"] = $usuario["nombre"];
        $_SESSION["username"]       = $usuario["username"];

        Log::info("LoginController::validar - login exitoso: $username");
        Redirect::to("/home/ver");
    }

    public function logout() {
        session_start();
        session_destroy();

        Redirect::to("/login/ver");
    }
}
