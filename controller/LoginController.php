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
        $password = password_hash($this->request->post("password"), PASSWORD_DEFAULT);
        $pais = $ubicacion["pais"];
        $ciudad = $ubicacion["ciudad"];

        if (!is_numeric($anio_nacimiento)) {
            Log::warning("LoginController::registrar - año de nacimiento invalido: $anio_nacimiento");
            Redirect::toIndex();
            return;
        }

        Log::info("LoginController::registrar - nombre=$nombre");
        $this->usuarioModel->registrarUsuario($nombre, $anio_nacimiento, $sexo, $username, $email, $password, $pais, $ciudad, $foto);
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
