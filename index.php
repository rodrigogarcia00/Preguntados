<?php
require_once __DIR__ . '/helpers/Autoloader.php';

SessionHelper::iniciarSesion();

$controller = $_GET['controller'] ?? '';
$method = $_GET['method'] ?? '';

SessionHelper::validarAcceso($controller, $method);

$config = new Configurator();
$router = $config->getRouter();

$router->dispatch($controller, $method);
