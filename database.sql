CREATE DATABASE IF NOT EXISTS preguntados;
USE preguntados;

CREATE TABLE usuarios (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          nombre VARCHAR(100) NOT NULL,
                          anio_nacimiento INT NOT NULL,
                          sexo VARCHAR(20) NOT NULL,
                          username VARCHAR(50) NOT NULL UNIQUE,
                          email VARCHAR(150) NOT NULL UNIQUE,
                          password VARCHAR(255) NOT NULL,
                          pais VARCHAR(100) NOT NULL,
                          ciudad VARCHAR(100) NOT NULL,
                          foto VARCHAR(255),
                          puntaje_total INT DEFAULT 0,
                          fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE usuarios ADD COLUMN activo TINYINT(1) DEFAULT 0;
ALTER TABLE usuarios ADD COLUMN codigo_verificacion VARCHAR(255);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    puntaje INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'ACTIVA',
    fecha_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_fin DATETIME NULL
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    color VARCHAR(20) NOT NULL
);

CREATE TABLE preguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enunciado VARCHAR(255) NOT NULL,
    categoria_id INT NOT NULL,
    nivel VARCHAR(20) DEFAULT 0.40,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE respuestas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pregunta_id INT NOT NULL,
    texto VARCHAR(255) NOT NULL,
    es_correcta TINYINT(1) DEFAULT 0,
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(id)
);

INSERT INTO categorias (nombre, color) VALUES
('Historia', '#c0392b'),
('Deportes', '#27ae60'),
('Entretenimiento', '#2980b9'),
('Arte', '#b132d1'),
('Ciencia', '#d1e632');

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿En qué año comenzó la Segunda Guerra Mundial?', 1);
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (1, '1939', 1), (1, '1945', 0), (1, '1914', 0), (1, '1929', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿En qué año cayó el Muro de Berlín?', 1);
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p2, '1987', 0), (@p2, '1989', 1), (@p2, '1991', 0), (@p2, '1993', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Cuántos jugadores tiene un equipo de fútbol en la cancha?', 2);
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p1, '9', 0), (@p1, '10', 0), (@p1, '11', 1), (@p1, '12', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Cada cuántos años se celebran los Juegos Olímpicos de verano?', 2);
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p2, '2 años', 0), (@p2, '4 años', 1), (@p2, '5 años', 0), (@p2, '6 años', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Quién dirigió la trilogía original de "El Señor de los Anillos"?', 3);
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p1, 'James Cameron', 0), (@p1, 'Peter Jackson', 1), (@p1, 'Steven Spielberg', 0), (@p1, 'Christopher Nolan', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Qué actor interpretó a Iron Man en el universo cinematográfico de Marvel?', 3);
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p2, 'Chris Evans', 0), (@p2, 'Robert Downey Jr.', 1), (@p2, 'Chris Hemsworth', 0), (@p2, 'Mark Ruffalo', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Quién pintó la Mona Lisa?', 4);
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p1, 'Miguel Ángel', 0), (@p1, 'Leonardo da Vinci', 1), (@p1, 'Rafael', 0), (@p1, 'Donatello', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Quién esculpió "El David"?', 4);
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p5, 'Leonardo da Vinci', 0), (@p5, 'Miguel Ángel', 1), (@p5, 'Donatello', 0), (@p5, 'Bernini', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Qué gas necesitan las plantas para hacer fotosíntesis?', 5);
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p3, 'Oxígeno', 0), (@p3, 'Dióxido de carbono', 1), (@p3, 'Nitrógeno', 0), (@p3, 'Hidrógeno', 0);

INSERT INTO preguntas (enunciado, categoria_id) VALUES ('¿Qué elemento químico tiene el símbolo "O"?', 5);
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES (@p6, 'Oro', 0), (@p6, 'Oxígeno', 1), (@p6, 'Osmio', 0), (@p6, 'Ozono', 0);

ALTER TABLE usuarios ADD COLUMN latitud DECIMAL(10,8) NULL;
ALTER TABLE usuarios ADD COLUMN longitud DECIMAL(11,8) NULL;
ALTER TABLE partidas ADD COLUMN pregunta_actual_id INT;
ALTER TABLE partidas ADD COLUMN pregunta_inicio DATETIME;

CREATE TABLE usuario_pregunta_vista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    pregunta_id INT NOT NULL,
    fecha_vista DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE preguntas MODIFY nivel DECIMAL(3,2) NOT NULL DEFAULT 0.40;
ALTER TABLE preguntas ADD COLUMN veces_respondida INT NOT NULL DEFAULT 0;
ALTER TABLE preguntas ADD COLUMN veces_correcta INT NOT NULL DEFAULT 0;
ALTER TABLE usuarios
ADD COLUMN rol VARCHAR(20) DEFAULT 'JUGADOR';
ALTER TABLE preguntas
ADD COLUMN fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN creada_por_usuario_id INT NULL;