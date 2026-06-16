<?php
class LoginController{
    private const LOGIN_VIEW = "/login/ver";
    private $renderer;
    private $usuarioModel;
    private $ubicacionModel;
    private $mailModel;
    private $request;
    private $baseUrl;

    public function __construct($renderer, $usuarioModel, $ubicacionModel, $baseUrl, $mailModel, $request) {
        $this->renderer = $renderer;
        $this->usuarioModel = $usuarioModel;
        $this->ubicacionModel = $ubicacionModel;
        $this->mailModel = $mailModel;
        $this->request = $request;
        $this->baseUrl = $baseUrl;
    }

    public function verRegistro() {
        $this->renderer->render("registro");
    }

    public function registrar() {
        $nombre = $this->request->post("nombre_completo");
        $anio_nacimiento = $this->request->post("anio_nacimiento");
        $sexo = $this->request->post("sexo");
        $username = $this->request->post("nombre_usuario");
        $email = $this->request->post("correo");
        $password = $this->request->post("password");
        $confirm_password = $this->request->post("confirm_password");

        $error = $this->validarDatosRegistro(
            $anio_nacimiento,
            $username,
            $email,
            $password,
            $confirm_password
        );

        if ($error !== null) {
            $this->renderer->render("registro", [
                "error" => $error
            ]);
            return;
        }

        $ubicacion = $this->ubicacionModel->obtenerPaisYCiudadPorLatitudYLongitud(
            $this->request->post("latitud"),
            $this->request->post("longitud")
        );

        $foto = $this->procesarFoto();
        $pais = $ubicacion["pais"];
        $ciudad = $ubicacion["ciudad"];

        Log::info("LoginController::registrar - nombre=$nombre");

        $codigoVerificacion = bin2hex(random_bytes(16));
        $usuarioId = $this->usuarioModel->registrarUsuario(
            $nombre,
            $anio_nacimiento,
            $sexo,
            $username,
            $email,
            password_hash($password, PASSWORD_DEFAULT),
            $pais,
            $ciudad,
            $foto,
            $codigoVerificacion
        );

        $link = $this->baseUrl . "/usuario/validar?id=$usuarioId&codigo=$codigoVerificacion";
        $correoEnviado = $this->mailModel->enviarCorreoVerificacion($email, $link, $nombre);

        if ($correoEnviado) {
            $this->renderer->render("login", [
                "avisoActivacion" => "Se ha enviado un correo de verificación a tu dirección de correo electrónico."
            ]);
        } else {
            Log::error("LoginController::registrar - error enviando correo a $email");
            $this->renderer->render("login", [
                "avisoActivacion" => "No se pudo enviar el correo de verificación. Contactá al soporte."
            ]);
        }
    }

    private function validarDatosRegistro($anio_nacimiento, $username, $email, $password, $confirm_password) {
        if ($password != $confirm_password) {
            return "Las contraseñas no coinciden";
        }

        if (!is_numeric($anio_nacimiento)) {
            Log::warning("LoginController::registrar - año de nacimiento invalido: $anio_nacimiento");
            return "El año de nacimiento no es válido.";
        }

        if ($this->usuarioModel->existeUsername($username)) {
            return "El nombre de usuario ya está en uso.";
        }

        if ($this->usuarioModel->existeEmail($email)) {
            return "El correo ya está registrado.";
        }

        return null;
    }

    public function ver() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        $error = $_SESSION["error"] ?? null;
        unset($_SESSION["error"]);
        $this->renderer->render("login", ["error" => $error]);
    }

    public function validar() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        $username = $this->request->post("username");
        $password = $this->request->post("password");

        if (empty($username) || empty($password)) {
            $_SESSION["error"] = "Complete todos los campos.";
            Redirect::to(self::LOGIN_VIEW);
            return;
        }

        $usuario = $this->usuarioModel->getByUsername($username);

        if ($usuario["activo"] == 0) {
            session_start();
            $_SESSION["error"] = "Debés activar tu cuenta desde el correo electrónico.";
            Redirect::to("/login/ver");
            return;
        }

        if ($usuario === null || !password_verify($password, $usuario["password"])) {
            $_SESSION["error"] = "Usuario o contraseña incorrectos.";
            Log::warning("LoginController::validar - credenciales incorrectas: $username");
            Redirect::to(self::LOGIN_VIEW);
            return;
        }

        $_SESSION["usuario_id"]     = $usuario["id"];
        $_SESSION["usuario_nombre"] = $usuario["nombre"];
        $_SESSION["username"]       = $usuario["username"];
        $_SESSION["puntaje"]        = $usuario["puntaje_total"] ?? 0;
        $_SESSION["trampitas"]      = $usuario["trampitas"] ?? 0;

        Log::info("LoginController::validar - login exitoso: $username");
        Redirect::to("/home/ver");
    }

    public function logout() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        session_destroy();
        Redirect::to(self::LOGIN_VIEW);
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
