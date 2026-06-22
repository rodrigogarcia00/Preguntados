<?php

class UsuarioController
{
    private $usuarioModel;
    private $renderer;

    private $request;

    public function __construct($renderer, $usuarioModel, $request)
    {
        $this->renderer = $renderer;
        $this->usuarioModel = $usuarioModel;
        $this->request = $request;
    }

    public function validar() {
        $id = $this->request->get("id") ?? null;
        $codigo = $this->request->get("codigo") ?? null;

        if (!$id || !$codigo) {
            echo "Link inválido";
            return;
        }

        $usuario = $this->usuarioModel->buscarPorId($id);

        if (!$usuario) {
            echo "Usuario inexistente";
            return;
        }

        if ($usuario["codigo_verificacion"] !== $codigo) {
            echo "Código inválido";
            return;
        }

        $this->usuarioModel->activarUsuario($id);

        echo "Cuenta activada correctamente. Ya podés iniciar sesión.";
    }

    public function perfil() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }
        Redirect::to("/usuario/verPerfil?id=" . $_SESSION["usuario_id"]);
    }

    public function verPerfil() {
        session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }

        $id = $this->request->get("id");

        if (!is_numeric($id)) {
            Redirect::to("/home/ver");
            return;
        }

        $id = (int) $id;
        $usuario = $this->usuarioModel->buscarPorId($id);

        if (!$usuario) {
            Redirect::to("/home/ver");
            return;
        }

        $partidas = $this->usuarioModel->getPartidasDeUsuario($id);

        $partidasProcesadas = array_map(function ($partida) {
            $partida["gano"] = false; // Esto habría que cambiarlo mas adelante cuando hagamos el 1v1
            $partida["perdio"] = ($partida["estado"] == "FINALIZADA");

            return $partida;
        }, $partidas);

        Log::info("UsuarioController::verPerfil - id=$id");

        $this->renderer->render("verPerfilView", [
            "usuario_id" => $id,
            "nombre"    => $usuario["nombre"],
            "username"     => $usuario["username"],
            "pais"         => $usuario["pais"],
            "ciudad"       => $usuario["ciudad"],
            "latitud"      => $usuario["latitud"],
            "longitud"     => $usuario["longitud"],
            "con_mapa"     => (!empty($usuario["latitud"]) && !empty($usuario["longitud"])),
            "puntaje"      => $usuario["puntaje_total"],
            "partidas"     => $partidasProcesadas,
            "con_partidas" => !empty($partidasProcesadas),
            "sin_partidas" => empty($partidasProcesadas),
            "es_mi_perfil" => ($id === $_SESSION["usuario_id"]),
        ]);
    }
}
