<?php
class LoginController{
    private $renderer;
    private $usuarioModel;
    private $ubicacionModel;
    private $request;

    public function __construct($renderer, $usuarioModel, $ubicacionModel, $request) {
        $this->renderer = $renderer;
        $this->usuarioModel = $usuarioModel;
        $this->ubicacionModel = $ubicacionModel;
        $this->request = $request;
    }

    public function verRegistro() {
        $this->renderer->render("registro");
    }

    public function registrar() {
        $foto = $this->procesarFoto();

        $ubicacion = $this->ubicacionModel->obtenerPaisYCiudadPorLatitudYLongitud(
            $this->request->post("latitud"),
            $this->request->post("longitud")
        );

        $nombre = $this->request->post("nombre_completo");
        $anio_nacimiento = $this->request->post("anio_nacimiento");
        $sexo = $this->request->post("sexo");
        $username = $this->request->post("nombre_usuario");
        $email = $this->request->post("correo");
        $password = $this->request->post("password");
        $confirm_password = $this->request->post("confirm_password");
        $pais = $ubicacion["pais"];
        $ciudad = $ubicacion["ciudad"];

        if ($password != $confirm_password) {
            $this->renderer->render("registro", [
                "error" => "Las contraseñas no coinciden"
            ]);
            return;
        }

        if (!is_numeric($anio_nacimiento)) {
            Log::warning("LoginController::registrar - año de nacimiento invalido: $anio_nacimiento");
            Redirect::toIndex();
            return;
        }

        if ($this->usuarioModel->existeUsername($username)) {
            $this->renderer->render("registro", ["error" => "El nombre de usuario ya está en uso."]);
            return;
        }

        if ($this->usuarioModel->existeEmail($email)) {
            $this->renderer->render("registro", ["error" => "El correo ya está registrado."]);
            return;
        }

        Log::info("LoginController::registrar - nombre=$nombre");
        $this->usuarioModel->registrarUsuario($nombre, $anio_nacimiento, $sexo, $username, $email, password_hash($password, PASSWORD_DEFAULT), $pais, $ciudad, $foto);
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

        $usuario = $this->usuarioModel->getByUsername($username);

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

    private function procesarFoto() {
        if ($_FILES["foto_perfil"]["error"] == 0) {
            $nombreArchivo = $_FILES["foto_perfil"]["name"];
            move_uploaded_file(
                $_FILES["foto_perfil"]["tmp_name"],
                "public/uploads/" . $nombreArchivo
            );
            return $nombreArchivo;
        }
        return "";
    }
}
