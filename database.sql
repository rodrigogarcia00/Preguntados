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
