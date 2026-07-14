<?php

class EditorController{
    private $model;
    private $renderer;

    function __construct($model, $renderer){
        $this->model = $model;
        $this->renderer = $renderer;
    }

    public function list() {
        $datos['sugeridas'] = $this->model->getPreguntasSugeridas();
        $datos['reportadas'] = $this->model->getPreguntasReportadas();
        $datos['preguntas'] = $this->model->getTodasLasPreguntas();

        $this->renderer->render('editor', $datos);
    }

    public function editar() {
        $id = $_POST['id'];
        $pregunta = $this->model->getPreguntaSugeridaPorId($id)[0];

        $categorias = $this->model->getCategoriasActivas();
        foreach($categorias as &$cat) {
            if ($cat['id'] == $pregunta['categoria_id']) {
                $cat['selected'] = true;
            }
        }
        $pregunta['categorias'] = $categorias;

        $this->renderer->render('editarPregunta', $pregunta);
    }

    public function procesarEdicion() {
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
        $id = $_POST['id'];
        $this->model->aprobarPregunta($id);
        Redirect::to('/editor/list');
    }

    public function rechazar() {
        $id = $_POST['id'];
        $this->model->rechazarPregunta($id);
        Redirect::to('/editor/list');
    }

    public function desestimarReporte() {
        $reporte_id = $_POST['reporte_id'];

        $this->model->desestimarReporte($reporte_id);
        Redirect::to('/editor/list');
    }

    public function deshabilitarPregunta() {
        $pregunta_id = $_POST['pregunta_id'];
        $reporte_id = $_POST['reporte_id'];

        $this->model->deshabilitarPreguntaReportada($pregunta_id, $reporte_id);
        Redirect::to('/editor/list');
    }

    public function crearActiva() {
        $datos['categorias'] = $this->model->getCategoriasActivas();
        $this->renderer->render('editorFormActiva', $datos);
    }

    public function procesarCreacionActiva() {
        $enunciado = $_POST['enunciado'];
        $categoria_id = $_POST['categoria'];
        $correcta = $_POST['respuesta_correcta'];
        $textos = [$_POST['opcion_a'], $_POST['opcion_b'], $_POST['opcion_c'], $_POST['opcion_d']];

        $this->model->crearPreguntaNueva($enunciado, $categoria_id, $correcta, $textos, $_SESSION["usuario_id"]);
        Redirect::to('/editor/list');
    }

    public function editarActiva() {
        $pregunta_id = $_POST['pregunta_id'];
        $datos = $this->model->getPreguntaActivaConRespuestas($pregunta_id);

        if(isset($_POST['reporte_id'])) {
            $datos['reporte_id'] = $_POST['reporte_id'];
        }

        $categorias = $this->model->getCategoriasActivas();
        foreach($categorias as &$cat) {
            if ($cat['id'] == $datos['categoria_id']) {
                $cat['selected'] = true;
            }
        }
        $datos['categorias'] = $categorias;

        $this->renderer->render('editorFormActiva', $datos);
    }

    public function procesarEdicionActiva() {
        $pregunta_id = $_POST['pregunta_id'];
        $reporte_id = $_POST['reporte_id'] ?? null;
        $enunciado = $_POST['enunciado'];
        $categoria_id = $_POST['categoria'];
        $correcta = $_POST['respuesta_correcta'];

        $ids = [$_POST['id_a'], $_POST['id_b'], $_POST['id_c'], $_POST['id_d']];
        $textos = [$_POST['opcion_a'], $_POST['opcion_b'], $_POST['opcion_c'], $_POST['opcion_d']];

        $this->model->actualizarPreguntaActiva($pregunta_id, $enunciado, $categoria_id, $correcta, $ids, $textos, $reporte_id);
        Redirect::to('/editor/list');
    }

    public function categorias() {
        $datos['categorias'] = $this->model->getCategorias();
        $this->renderer->render('editorCategorias', $datos);
    }

    public function crearCategoria() {
        $this->renderer->render('editorFormCategoria');
    }

    public function procesarCreacionCategoria() {
        $nombre = $_POST['nombre'];
        $color = $_POST['color'];
        $this->model->crearCategoria($nombre, $color);
        Redirect::to('/editor/categorias');
    }

    public function editarCategoria() {
        $id = $_POST['id'];
        $datos['categoria'] = $this->model->getCategoriaPorId($id);
        $this->renderer->render('editorFormCategoria', $datos);
    }

    public function procesarEdicionCategoria() {
        $id = $_POST['id'];
        $nombre = $_POST['nombre'];
        $color = $_POST['color'];
        $this->model->actualizarCategoria($id, $nombre, $color);
        Redirect::to('/editor/categorias');
    }

    public function eliminarCategoria() {
        $id = $_POST['id'];
        $this->model->eliminarCategoria($id);
        Redirect::to('/editor/categorias');
    }

    public function activarCategoria() {
        $id = $_POST['id'];
        $this->model->activarCategoria($id);
        Redirect::to('/editor/categorias');
    }

    public function habilitarPregunta() {
        $pregunta_id = $_POST['pregunta_id'];
        $this->model->habilitarPregunta($pregunta_id);
        Redirect::to('/editor/list');
    }
}