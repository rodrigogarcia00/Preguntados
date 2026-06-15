<?php
class Configurator {

    private $config;

    public function __construct()
    {
        $this->config = parse_ini_file("config/config.ini");
    }

    public function getLoginController()
    {
        return new LoginController($this->getRenderer(), $this->getUsuarioModel(), $this->getUbicacionModel(), $this->config['base_url'], $this->getMailModel(), new Request());
    }

    public function getHomeController()
    {
        return new HomeController($this->getRenderer());
    }

    private function getDatabase()
    {
        return new MyDatabase(
            $this->config['hostname'],
            $this->config['username'],
            $this->config['password'],
            $this->config['database']
        );
    }

    private function getRenderer()
    {
        return new MustacheRenderer(__DIR__ . '/../view');
    }

    private function getMyMail() {
        return new MyMail($this->config['mail_host'], $this->config['mail_username'], $this->config['mail_from_name'], $this->config['mail_password'], $this->config['mail_port']);
    }

    private function getUsuarioModel() {
        return new UsuarioModel($this->getDatabase());
    }

    public function getRouter()
    {
        return new Router($this, 'login', 'verRegistro');
    }

    public function getOrDefault($controllerName, $defaultControllerName)
    {
        $getter = 'get' . ucfirst($controllerName) . 'Controller';
        if (method_exists($this, $getter)) {
            return $this->{$getter}();
        }
        $defaultGetter = 'get' . ucfirst($defaultControllerName) . 'Controller';
        return $this->{$defaultGetter}();
    }

    public function getUbicacionModel() {
        return new UbicacionModel();
    }
    public function getUsuarioController() {
        return new UsuarioController($this->getRenderer(), $this->getUsuarioModel(), new Request());
    }

    public function getMailModel() {
        return new MailModel($this->getMyMail());
    }
}
