USE preguntados;
SET NAMES utf8mb4;

SET @cat_historia = (SELECT id FROM categorias WHERE nombre = 'Historia' LIMIT 1);
SET @cat_deportes = (SELECT id FROM categorias WHERE nombre = 'Deportes' LIMIT 1);
SET @cat_entretenimiento = (SELECT id FROM categorias WHERE nombre = 'Entretenimiento' LIMIT 1);
SET @cat_arte = (SELECT id FROM categorias WHERE nombre = 'Arte' LIMIT 1);
SET @cat_ciencia = (SELECT id FROM categorias WHERE nombre = 'Ciencia' LIMIT 1);


INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es la capital de Australia?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Sídney', 0),
(@pregunta_id, 'Canberra', 1),
(@pregunta_id, 'Melbourne', 0),
(@pregunta_id, 'Brisbane', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el río más largo del mundo?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Río Nilo', 0),
(@pregunta_id, 'Río Amazonas', 1),
(@pregunta_id, 'Río Yangtsé', 0),
(@pregunta_id, 'Río Misisipi', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué imperio construyó Machu Picchu?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Imperio Azteca', 0),
(@pregunta_id, 'Imperio Inca', 1),
(@pregunta_id, 'Imperio Maya', 0),
(@pregunta_id, 'Imperio Tolteca', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el país más grande del mundo por superficie?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'China', 0),
(@pregunta_id, 'Canadá', 0),
(@pregunta_id, 'Rusia', 1),
(@pregunta_id, 'Estados Unidos', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién fue el primer emperador romano?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Julio César', 0),
(@pregunta_id, 'Augusto', 1),
(@pregunta_id, 'Nerón', 0),
(@pregunta_id, 'Trajano', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el desierto más grande del mundo?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Desierto del Sahara', 0),
(@pregunta_id, 'Desierto de Gobi', 0),
(@pregunta_id, 'Antártida', 1),
(@pregunta_id, 'Desierto de Atacama', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿En qué continente se encuentra Egipto?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Asia', 0),
(@pregunta_id, 'África', 1),
(@pregunta_id, 'Europa', 0),
(@pregunta_id, 'Oceanía', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué revolución comenzó en 1789?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Revolución Industrial', 0),
(@pregunta_id, 'Revolución Francesa', 1),
(@pregunta_id, 'Revolución Rusa', 0),
(@pregunta_id, 'Revolución Mexicana', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es la montaña más alta del mundo?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'K2', 0),
(@pregunta_id, 'Monte Everest', 1),
(@pregunta_id, 'Monte Kilimanjaro', 0),
(@pregunta_id, 'Aconcagua', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué tratado puso fin a la Primera Guerra Mundial?', @cat_historia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Tratado de Versalles', 1),
(@pregunta_id, 'Tratado de Westfalia', 0),
(@pregunta_id, 'Tratado de Utrecht', 0),
(@pregunta_id, 'Tratado de Tordesillas', 0);


INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué país ganó el Mundial de fútbol de Qatar 2022?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Francia', 0),
(@pregunta_id, 'Argentina', 1),
(@pregunta_id, 'Brasil', 0),
(@pregunta_id, 'Croacia', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿En qué deporte se usa un "birdie" o pajarito?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Tenis', 0),
(@pregunta_id, 'Bádminton', 1),
(@pregunta_id, 'Golf', 0),
(@pregunta_id, 'Squash', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuántos puntos vale un touchdown en fútbol americano?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '3', 0),
(@pregunta_id, '6', 1),
(@pregunta_id, '7', 0),
(@pregunta_id, '10', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué tenista ganó más títulos de Grand Slam en la historia masculina hasta 2024?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Roger Federer', 0),
(@pregunta_id, 'Rafael Nadal', 0),
(@pregunta_id, 'Novak Djokovic', 1),
(@pregunta_id, 'Andy Murray', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuántos sets como máximo se juegan en un partido de tenis masculino de Grand Slam?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '3', 0),
(@pregunta_id, '5', 1),
(@pregunta_id, '7', 0),
(@pregunta_id, '9', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿En qué deporte se utiliza un "home run"?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Béisbol', 1),
(@pregunta_id, 'Cricket', 0),
(@pregunta_id, 'Sóftbol', 0),
(@pregunta_id, 'Rugby', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué jugador es considerado el máximo goleador histórico de la Champions League?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Lionel Messi', 0),
(@pregunta_id, 'Cristiano Ronaldo', 1),
(@pregunta_id, 'Robert Lewandowski', 0),
(@pregunta_id, 'Karim Benzema', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuántos aros tiene el símbolo olímpico?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '4', 0),
(@pregunta_id, '5', 1),
(@pregunta_id, '6', 0),
(@pregunta_id, '7', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿En qué país se originó el judo?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'China', 0),
(@pregunta_id, 'Japón', 1),
(@pregunta_id, 'Corea del Sur', 0),
(@pregunta_id, 'Tailandia', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuántos jugadores forman un equipo de básquetbol en la cancha?', @cat_deportes, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '4', 0),
(@pregunta_id, '5', 1),
(@pregunta_id, '6', 0),
(@pregunta_id, '7', 0);


INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué banda lanzó el álbum "Abbey Road"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'The Rolling Stones', 0),
(@pregunta_id, 'The Beatles', 1),
(@pregunta_id, 'Pink Floyd', 0),
(@pregunta_id, 'Led Zeppelin', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué serie de televisión es famosa por la frase "Winter is coming"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Vikingos', 0),
(@pregunta_id, 'Juego de Tronos', 1),
(@pregunta_id, 'The Witcher', 0),
(@pregunta_id, 'Outlander', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién interpretó al personaje de Jack Sparrow en "Piratas del Caribe"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Orlando Bloom', 0),
(@pregunta_id, 'Johnny Depp', 1),
(@pregunta_id, 'Geoffrey Rush', 0),
(@pregunta_id, 'Javier Bardem', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué película ganó el Óscar a Mejor Película en 2020 siendo la primera de habla no inglesa en lograrlo?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '1917', 0),
(@pregunta_id, 'Parásitos', 1),
(@pregunta_id, 'Joker', 0),
(@pregunta_id, 'Once Upon a Time in Hollywood', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué cantante es conocido como "El Rey del Pop"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Elvis Presley', 0),
(@pregunta_id, 'Michael Jackson', 1),
(@pregunta_id, 'Prince', 0),
(@pregunta_id, 'Freddie Mercury', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué saga de películas presenta a "Darth Vader"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Star Trek', 0),
(@pregunta_id, 'Star Wars', 1),
(@pregunta_id, 'Guardianes de la Galaxia', 0),
(@pregunta_id, 'Dune', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué actriz interpretó a Hermione Granger en la saga "Harry Potter"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Bonnie Wright', 0),
(@pregunta_id, 'Emma Watson', 1),
(@pregunta_id, 'Evanna Lynch', 0),
(@pregunta_id, 'Katie Leung', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué banda de rock británica lanzó "The Dark Side of the Moon"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Queen', 0),
(@pregunta_id, 'Pink Floyd', 1),
(@pregunta_id, 'Deep Purple', 0),
(@pregunta_id, 'Black Sabbath', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué director es conocido por películas como "Tiburón" y "Jurassic Park"?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'George Lucas', 0),
(@pregunta_id, 'Steven Spielberg', 1),
(@pregunta_id, 'James Cameron', 0),
(@pregunta_id, 'Ridley Scott', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué serie animada presenta a la familia Simpson en Springfield?', @cat_entretenimiento, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Padre de Familia', 0),
(@pregunta_id, 'Los Simpson', 1),
(@pregunta_id, 'Bob Esponja', 0),
(@pregunta_id, 'South Park', 0);


INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién escribió "Don Quijote de la Mancha"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Lope de Vega', 0),
(@pregunta_id, 'Miguel de Cervantes', 1),
(@pregunta_id, 'Federico García Lorca', 0),
(@pregunta_id, 'Francisco de Quevedo', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién pintó "La noche estrellada"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Pablo Picasso', 0),
(@pregunta_id, 'Vincent van Gogh', 1),
(@pregunta_id, 'Claude Monet', 0),
(@pregunta_id, 'Salvador Dalí', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién escribió "Cien años de soledad"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Mario Vargas Llosa', 0),
(@pregunta_id, 'Gabriel García Márquez', 1),
(@pregunta_id, 'Julio Cortázar', 0),
(@pregunta_id, 'Jorge Luis Borges', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué autor escribió "Romeo y Julieta"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Charles Dickens', 0),
(@pregunta_id, 'William Shakespeare', 1),
(@pregunta_id, 'Oscar Wilde', 0),
(@pregunta_id, 'Jane Austen', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué movimiento artístico se asocia con Salvador Dalí?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Cubismo', 0),
(@pregunta_id, 'Surrealismo', 1),
(@pregunta_id, 'Impresionismo', 0),
(@pregunta_id, 'Expresionismo', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién escribió "1984"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Aldous Huxley', 0),
(@pregunta_id, 'George Orwell', 1),
(@pregunta_id, 'Ray Bradbury', 0),
(@pregunta_id, 'H.G. Wells', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién pintó "El Guernica"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Salvador Dalí', 0),
(@pregunta_id, 'Pablo Picasso', 1),
(@pregunta_id, 'Joan Miró', 0),
(@pregunta_id, 'Francisco de Goya', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién escribió "Romeo y Julieta" y "Hamlet"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Christopher Marlowe', 0),
(@pregunta_id, 'William Shakespeare', 1),
(@pregunta_id, 'Ben Jonson', 0),
(@pregunta_id, 'John Milton', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿En qué museo se encuentra la Mona Lisa?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Museo del Prado', 0),
(@pregunta_id, 'Museo del Louvre', 1),
(@pregunta_id, 'Museo Británico', 0),
(@pregunta_id, 'Galería Uffizi', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién escribió "El Principito"?', @cat_arte, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Victor Hugo', 0),
(@pregunta_id, 'Antoine de Saint-Exupéry', 1),
(@pregunta_id, 'Albert Camus', 0),
(@pregunta_id, 'Jules Verne', 0);


INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el planeta más cercano al Sol?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Venus', 0),
(@pregunta_id, 'Mercurio', 1),
(@pregunta_id, 'Tierra', 0),
(@pregunta_id, 'Marte', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el órgano más grande del cuerpo humano?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'El corazón', 0),
(@pregunta_id, 'El hígado', 0),
(@pregunta_id, 'La piel', 1),
(@pregunta_id, 'Los pulmones', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el animal terrestre más grande del mundo?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Rinoceronte', 0),
(@pregunta_id, 'Elefante africano', 1),
(@pregunta_id, 'Hipopótamo', 0),
(@pregunta_id, 'Jirafa', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuántos huesos tiene el cuerpo humano adulto?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '186', 0),
(@pregunta_id, '206', 1),
(@pregunta_id, '226', 0),
(@pregunta_id, '246', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Quién propuso la teoría de la evolución por selección natural?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Gregor Mendel', 0),
(@pregunta_id, 'Charles Darwin', 1),
(@pregunta_id, 'Louis Pasteur', 0),
(@pregunta_id, 'Carl Linneo', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es el planeta más grande del sistema solar?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Saturno', 0),
(@pregunta_id, 'Júpiter', 1),
(@pregunta_id, 'Neptuno', 0),
(@pregunta_id, 'Urano', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué parte de la célula contiene el material genético?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Mitocondria', 0),
(@pregunta_id, 'Núcleo', 1),
(@pregunta_id, 'Ribosoma', 0),
(@pregunta_id, 'Citoplasma', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Cuál es la velocidad de la luz aproximadamente?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, '300.000 km/s', 1),
(@pregunta_id, '150.000 km/s', 0),
(@pregunta_id, '500.000 km/s', 0),
(@pregunta_id, '1.000.000 km/s', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué animal es conocido como el "rey de la selva"?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Tigre', 0),
(@pregunta_id, 'León', 1),
(@pregunta_id, 'Leopardo', 0),
(@pregunta_id, 'Jaguar', 0);

INSERT INTO preguntas (enunciado, categoria_id, nivel) VALUES ('¿Qué científico desarrolló la teoría de la relatividad?', @cat_ciencia, 0.40);
SET @pregunta_id = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto, es_correcta) VALUES
(@pregunta_id, 'Isaac Newton', 0),
(@pregunta_id, 'Albert Einstein', 1),
(@pregunta_id, 'Niels Bohr', 0),
(@pregunta_id, 'Stephen Hawking', 0);
