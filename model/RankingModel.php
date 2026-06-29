<?php

class RankingModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getRanking()
    {
        $sql = "SELECT id, nombre, username, foto, puntaje_total
                FROM usuarios
                WHERE activo = 1
                ORDER BY puntaje_total DESC";

        Log::info("SQL: $sql");

        return $this->database->query($sql);
    }
}