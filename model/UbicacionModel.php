<?php

class UbicacionModel
{

    public function obtenerPaisYCiudadPorLatitudYLongitud($latitud, $longitud) {
        $url = "https://nominatim.openstreetmap.org/reverse?format=json&lat="
            . urlencode($latitud)
            . "&lon="
            . urlencode($longitud)
            . "&addressdetails=1";

        $opciones = [
            "http" => [
                "method" => "GET",
                "header" => "User-Agent: Preguntados\r\n"
            ]
        ];

        $contexto = stream_context_create($opciones);
        $respuesta = file_get_contents($url, false, $contexto);

        if ($respuesta === false) {
            return [
                "pais" => "Desconocido",
                "ciudad" => "Desconocida"
            ];
        }

        $data = json_decode($respuesta, true);
        $address = $data["address"] ?? [];

        return [
            "pais" => $address["country"] ?? "Desconocido",
            "ciudad" =>
                $address["town"]
                ?? $address["state_district"]
                ?? "Desconocida"
        ];
    }

}
