<?php

class TrampitaController {
    private $usuarioModel;
    private $renderer;

    public function __construct($usuarioModel, $renderer) {
        $this->usuarioModel = $usuarioModel;
        $this->renderer = $renderer;
    }

    public function ver() {
        if (session_status() === PHP_SESSION_NONE) session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }
        $this->renderer->render("comprarTrampita", [
            "nombre"    => $_SESSION["usuario_nombre"],
            "puntaje"   => $_SESSION["puntaje"] ?? 0,
            "trampitas" => $_SESSION["trampitas"] ?? 0,
        ]);
    }

    public function confirmarCompra() {
        if (session_status() === PHP_SESSION_NONE) session_start();
        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            return;
        }

        $usuarioId = $_SESSION["usuario_id"];
        $cantidad  = 1;
        $precio    = 1.00;

        $this->usuarioModel->registrarCompraTrampita($usuarioId, $cantidad, $precio);
        $_SESSION["trampitas"] = ($_SESSION["trampitas"] ?? 0) + 1;

        Redirect::to("/home/ver?exito=compra");
    }

    public function comprar() {
        // Redirige a la página de confirmación en lugar de comprar directo
        Redirect::to("/trampita/ver");
    }
}