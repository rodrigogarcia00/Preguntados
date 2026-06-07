<?php
class HomeController{

    private $renderer;

    public function __construct($renderer) {
        $this->renderer = $renderer;
    }

    public function ver()
    {
        session_start();
        if(isset($_SESSION["usuario_id"])){
            Redirect::to("/login/ver");
            return;
        }
        Log::info("HomeController::ver - usuario: " . $_SESSION["username"]);
        $this->renderer->render("verHomeView", [
            "nombre" => $_SESSION["usuario_nombre"],
        ]);
    }

}
