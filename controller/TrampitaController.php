<?php

class TrampitaController {
    private $usuarioModel;

    public function __construct($usuarioModel) {
        $this->usuarioModel = $usuarioModel;
    }

    public function comprar() {

        $usuarioId = $_SESSION["usuario_id"];
        $cantidad = 1;
        $precio = 1.00;

        $this->usuarioModel->registrarCompraTrampita($usuarioId, $cantidad, $precio);

        $_SESSION["trampitas"] = ($_SESSION["trampitas"] ?? 0) + 1;

        Redirect::to("/home/ver?exito=compra");
    }
}