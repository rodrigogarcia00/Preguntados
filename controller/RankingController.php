<?php

class RankingController
{
    private $model;
    private $renderer;
    private $request;

    public function __construct($model, $renderer)
    {
        $this->model    = $model;
        $this->renderer = $renderer;
    }

    public function ver()
    {
        Log::info("RankingController::ver");

        $usuarios = $this->model->getRanking();

        $posicion = 1;

        foreach ($usuarios as &$usuario) {

            $usuario["posicion"] = $posicion;

            $usuario["puntaje"] = $usuario["puntaje_total"] . " pts";

            if ($usuario["foto"] == null || $usuario["foto"] == "") {
                $usuario["foto"] = "perfil-icono.png";
            }

            if ($posicion == 1) {
                $usuario["medalla"] = "🥇";
            } else if ($posicion == 2) {
                $usuario["medalla"] = "🥈";
            } else if ($posicion == 3) {
                $usuario["medalla"] = "🥉";
            } else {
                $usuario["medalla"] = "#" . $posicion;
            }

            $posicion++;
        }

        $this->renderer->render("ranking", [
            "usuarios" => $usuarios
        ]);
    }
}