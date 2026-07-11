<?php

class EditorController{
    private $model;
    private $renderer;

    function __construct($model, $renderer){
        $this->model = $model;
        $this->renderer = $renderer;
    }

    public function list() {
        $this->validarEditor();

        $datos['sugeridas'] = $this->model->getPreguntasSugeridas();
        $datos['reportadas'] = $this->model->getPreguntasReportadas();

        $this->renderer->render('editor', $datos);
    }

    public function editar() {
        $this->validarEditor();
        $id = $_POST['id'];

        // Buscamos los datos de esa pregunta en la BD para precargar el formulario
        $datos['pregunta'] = $this->model->getPreguntaSugeridaPorId($id);

        // Renderizamos la nueva vista pasándole los datos de la pregunta
        $this->renderer->render('editarPregunta', $datos['pregunta'][0]);
    }

    public function procesarEdicion() {
        $this->validarEditor();

        $id = $_POST['id'];
        $pregunta = $_POST['enunciado'];
        $categoria_id = $_POST['categoria'];
        $resp_correcta = $_POST['respuesta_correcta'];
        $opcion_a = $_POST['opcion_a'];
        $opcion_b = $_POST['opcion_b'];
        $opcion_c = $_POST['opcion_c'];
        $opcion_d = $_POST['opcion_d'];

        $this->model->actualizarPreguntaSugerida($id, $pregunta, $categoria_id, $resp_correcta, $opcion_a, $opcion_b, $opcion_c, $opcion_d);
        Redirect::to('/editor/list');
    }

    public function aprobar() {
        $this->validarEditor();
        $id = $_POST['id'];
        $this->model->aprobarPregunta($id);
        Redirect::to('/editor/list');
    }

    public function rechazar() {
        $this->validarEditor();
        $id = $_POST['id'];
        $this->model->rechazarPregunta($id);
        Redirect::to('/editor/list');
    }

    private function validarEditor()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        if (!isset($_SESSION["usuario_id"])) {
            Redirect::to("/login/ver");
            exit;
        }

        if (!isset($_SESSION["usuario_rol"]) || $_SESSION["usuario_rol"] !== "EDITOR") {
            Redirect::to("/home/ver");
            exit;
        }
    }

    public function desestimarReporte() {
        $this->validarEditor();
        $reporte_id = $_POST['reporte_id'];

        $this->model->desestimarReporte($reporte_id);
        Redirect::to('/editor/list');
    }

    public function deshabilitarPregunta() {
        $this->validarEditor();
        $pregunta_id = $_POST['pregunta_id'];
        $reporte_id = $_POST['reporte_id'];

        $this->model->deshabilitarPreguntaReportada($pregunta_id, $reporte_id);
        Redirect::to('/editor/list');
    }
}