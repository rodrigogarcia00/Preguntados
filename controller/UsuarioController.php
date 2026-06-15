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
}
