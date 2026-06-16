USE preguntados;

CREATE TABLE preguntas (
                           id          INT AUTO_INCREMENT PRIMARY KEY,
                           enunciado   VARCHAR(255) NOT NULL,
                           categoria   VARCHAR(50)  NOT NULL,
                           nivel       DECIMAL(3,2) NOT NULL DEFAULT 0.40,
                           respuesta_correcta_id INT NULL,
                           veces_respondida   INT DEFAULT 0,
                           veces_correcta     INT DEFAULT 0,
                           estado      ENUM('pendiente','aprobada','rechazada','reportada') DEFAULT 'aprobada',
                           creada_por  INT NULL,
                           creada_en   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (creada_por) REFERENCES usuarios(id)
);

CREATE TABLE respuestas (
                            id           INT AUTO_INCREMENT PRIMARY KEY,
                            pregunta_id  INT NOT NULL,
                            texto        VARCHAR(255) NOT NULL,
                            FOREIGN KEY (pregunta_id) REFERENCES preguntas(id) ON DELETE CASCADE
);

CREATE TABLE preguntas_vistas (
                                  usuario_id   INT NOT NULL,
                                  pregunta_id  INT NOT NULL,
                                  respondio_bien TINYINT(1) NULL,
                                  vista_en     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (usuario_id, pregunta_id),
                                  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
                                  FOREIGN KEY (pregunta_id) REFERENCES preguntas(id)
);

ALTER TABLE usuarios ADD COLUMN nivel DECIMAL(3,2) DEFAULT 0.40;