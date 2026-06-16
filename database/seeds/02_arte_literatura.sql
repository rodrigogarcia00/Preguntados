-- CATEGORIA: Arte y Literatura

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién pintó la Mona Lisa?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p1, 'Miguel Ángel'), (@p1, 'Leonardo da Vinci'), (@p1, 'Rafael'), (@p1, 'Donatello');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p1 AND texto = 'Leonardo da Vinci') WHERE id = @p1;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Don Quijote de la Mancha"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p2, 'Lope de Vega'), (@p2, 'Miguel de Cervantes'), (@p2, 'Federico García Lorca'), (@p2, 'Francisco de Quevedo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p2 AND texto = 'Miguel de Cervantes') WHERE id = @p2;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién pintó "La noche estrellada"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p3, 'Pablo Picasso'), (@p3, 'Vincent van Gogh'), (@p3, 'Claude Monet'), (@p3, 'Salvador Dalí');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p3 AND texto = 'Vincent van Gogh') WHERE id = @p3;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Cien años de soledad"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p4 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p4, 'Mario Vargas Llosa'), (@p4, 'Gabriel García Márquez'), (@p4, 'Julio Cortázar'), (@p4, 'Jorge Luis Borges');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p4 AND texto = 'Gabriel García Márquez') WHERE id = @p4;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién esculpió "El David"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p5, 'Leonardo da Vinci'), (@p5, 'Miguel Ángel'), (@p5, 'Donatello'), (@p5, 'Bernini');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p5 AND texto = 'Miguel Ángel') WHERE id = @p5;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué autor escribió "Romeo y Julieta"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p6, 'Charles Dickens'), (@p6, 'William Shakespeare'), (@p6, 'Oscar Wilde'), (@p6, 'Jane Austen');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p6 AND texto = 'William Shakespeare') WHERE id = @p6;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué movimiento artístico se asocia con Salvador Dalí?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p7 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p7, 'Cubismo'), (@p7, 'Surrealismo'), (@p7, 'Impresionismo'), (@p7, 'Expresionismo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p7 AND texto = 'Surrealismo') WHERE id = @p7;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "1984"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p8 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p8, 'Aldous Huxley'), (@p8, 'George Orwell'), (@p8, 'Ray Bradbury'), (@p8, 'H.G. Wells');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p8 AND texto = 'George Orwell') WHERE id = @p8;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién pintó "El Guernica"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p9 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p9, 'Salvador Dalí'), (@p9, 'Pablo Picasso'), (@p9, 'Joan Miró'), (@p9, 'Francisco de Goya');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p9 AND texto = 'Pablo Picasso') WHERE id = @p9;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Romeo y Julieta" y "Hamlet"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p10 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p10, 'Christopher Marlowe'), (@p10, 'William Shakespeare'), (@p10, 'Ben Jonson'), (@p10, 'John Milton');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p10 AND texto = 'William Shakespeare') WHERE id = @p10;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué museo se encuentra la Mona Lisa?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p11 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p11, 'Museo del Prado'), (@p11, 'Museo del Louvre'), (@p11, 'Museo Británico'), (@p11, 'Galería Uffizi');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p11 AND texto = 'Museo del Louvre') WHERE id = @p11;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "El Principito"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p12 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p12, 'Victor Hugo'), (@p12, 'Antoine de Saint-Exupéry'), (@p12, 'Albert Camus'), (@p12, 'Jules Verne');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p12 AND texto = 'Antoine de Saint-Exupéry') WHERE id = @p12;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor se cortó una oreja?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p13 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p13, 'Paul Gauguin'), (@p13, 'Vincent van Gogh'), (@p13, 'Edgar Degas'), (@p13, 'Henri Matisse');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p13 AND texto = 'Vincent van Gogh') WHERE id = @p13;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "La Odisea"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p14 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p14, 'Sócrates'), (@p14, 'Homero'), (@p14, 'Platón'), (@p14, 'Virgilio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p14 AND texto = 'Homero') WHERE id = @p14;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor es famoso por sus obras de ninfeas y jardines?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p15 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p15, 'Edgar Degas'), (@p15, 'Claude Monet'), (@p15, 'Pierre-Auguste Renoir'), (@p15, 'Camille Pissarro');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p15 AND texto = 'Claude Monet') WHERE id = @p15;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Romeo y Julieta" inspirado en una historia italiana?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p16 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p16, 'William Shakespeare'), (@p16, 'Dante Alighieri'), (@p16, 'Petrarca'), (@p16, 'Giovanni Boccaccio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p16 AND texto = 'William Shakespeare') WHERE id = @p16;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién pintó el techo de la Capilla Sixtina?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p17 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p17, 'Rafael'), (@p17, 'Miguel Ángel'), (@p17, 'Leonardo da Vinci'), (@p17, 'Tiziano');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p17 AND texto = 'Miguel Ángel') WHERE id = @p17;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Hamlet"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p18 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p18, 'William Shakespeare'), (@p18, 'Geoffrey Chaucer'), (@p18, 'Thomas Hardy'), (@p18, 'Lord Byron');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p18 AND texto = 'William Shakespeare') WHERE id = @p18;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué escritor argentino escribió "Ficciones" y "El Aleph"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p19 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p19, 'Julio Cortázar'), (@p19, 'Jorge Luis Borges'), (@p19, 'Adolfo Bioy Casares'), (@p19, 'Ernesto Sabato');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p19 AND texto = 'Jorge Luis Borges') WHERE id = @p19;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué técnica pictórica usa pequeños puntos de color?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p20 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p20, 'Puntillismo'), (@p20, 'Fauvismo'), (@p20, 'Cubismo'), (@p20, 'Dadaísmo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p20 AND texto = 'Puntillismo') WHERE id = @p20;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor barroco italiano pintó "Judit decapitando a Holofernes"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p21 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p21, 'Artemisia Gentileschi'), (@p21, 'Caravaggio'), (@p21, 'Annibale Carracci'), (@p21, 'Guido Reni');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p21 AND texto = 'Artemisia Gentileschi') WHERE id = @p21;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué novela narra la historia de un hombre obsesionado con una ballena blanca?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p22 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p22, 'La isla del tesoro'), (@p22, 'Moby Dick'), (@p22, '20.000 leguas de viaje submarino'), (@p22, 'El viejo y el mar');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p22 AND texto = 'Moby Dick') WHERE id = @p22;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué escultura griega clásica representa a una mujer sin brazos?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p23 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p23, 'Venus de Willendorf'), (@p23, 'Venus de Milo'), (@p23, 'Victoria de Samotracia'), (@p23, 'Discóbolo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p23 AND texto = 'Venus de Milo') WHERE id = @p23;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Crimen y castigo"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p24 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p24, 'León Tolstói'), (@p24, 'Fiódor Dostoyevski'), (@p24, 'Antón Chéjov'), (@p24, 'Nikolái Gógol');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p24 AND texto = 'Fiódor Dostoyevski') WHERE id = @p24;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor holandés es famoso por "La joven de la perla"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p25 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p25, 'Rembrandt'), (@p25, 'Johannes Vermeer'), (@p25, 'Hieronymus Bosch'), (@p25, 'Jan van Eyck');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p25 AND texto = 'Johannes Vermeer') WHERE id = @p25;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Harry Potter"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p26 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p26, 'J.R.R. Tolkien'), (@p26, 'J.K. Rowling'), (@p26, 'C.S. Lewis'), (@p26, 'Suzanne Collins');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p26 AND texto = 'J.K. Rowling') WHERE id = @p26;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué movimiento artístico fragmenta los objetos en formas geométricas?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p27 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p27, 'Cubismo'), (@p27, 'Romanticismo'), (@p27, 'Barroco'), (@p27, 'Neoclasicismo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p27 AND texto = 'Cubismo') WHERE id = @p27;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Orgullo y prejuicio"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p28 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p28, 'Charlotte Brontë'), (@p28, 'Jane Austen'), (@p28, 'Emily Brontë'), (@p28, 'Virginia Woolf');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p28 AND texto = 'Jane Austen') WHERE id = @p28;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor pintó "El grito"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p29 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p29, 'Edvard Munch'), (@p29, 'Gustav Klimt'), (@p29, 'Egon Schiele'), (@p29, 'Wassily Kandinsky');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p29 AND texto = 'Edvard Munch') WHERE id = @p29;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué poeta chileno ganó el Premio Nobel de Literatura en 1971?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p30 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p30, 'Gabriela Mistral'), (@p30, 'Pablo Neruda'), (@p30, 'Nicanor Parra'), (@p30, 'Vicente Huidobro');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p30 AND texto = 'Pablo Neruda') WHERE id = @p30;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué autor creó al detective Sherlock Holmes?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p31 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p31, 'Agatha Christie'), (@p31, 'Arthur Conan Doyle'), (@p31, 'Edgar Allan Poe'), (@p31, 'Wilkie Collins');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p31 AND texto = 'Arthur Conan Doyle') WHERE id = @p31;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué edificio italiano alberga "El Nacimiento de Venus" de Botticelli?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p32 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p32, 'Museo del Vaticano'), (@p32, 'Galería Uffizi'), (@p32, 'Museo del Louvre'), (@p32, 'Museo del Prado');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p32 AND texto = 'Galería Uffizi') WHERE id = @p32;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "La Divina Comedia"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p33 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p33, 'Petrarca'), (@p33, 'Dante Alighieri'), (@p33, 'Giovanni Boccaccio'), (@p33, 'Torquato Tasso');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p33 AND texto = 'Dante Alighieri') WHERE id = @p33;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor español es conocido por sus obras durante la Guerra Civil?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p34 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p34, 'Joan Miró'), (@p34, 'Pablo Picasso'), (@p34, 'Salvador Dalí'), (@p34, 'Diego Velázquez');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p34 AND texto = 'Pablo Picasso') WHERE id = @p34;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué novela de Mary Shelley narra la historia de un monstruo creado por un científico?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p35 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p35, 'Drácula'), (@p35, 'Frankenstein'), (@p35, 'El extraño caso de Dr. Jekyll y Mr. Hyde'), (@p35, 'El retrato de Dorian Gray');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p35 AND texto = 'Frankenstein') WHERE id = @p35;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor pintó "Las Meninas"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p36 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p36, 'Francisco de Goya'), (@p36, 'Diego Velázquez'), (@p36, 'El Greco'), (@p36, 'Bartolomé Esteban Murillo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p36 AND texto = 'Diego Velázquez') WHERE id = @p36;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Rayuela"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p37 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p37, 'Jorge Luis Borges'), (@p37, 'Julio Cortázar'), (@p37, 'Gabriel García Márquez'), (@p37, 'Mario Vargas Llosa');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p37 AND texto = 'Julio Cortázar') WHERE id = @p37;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué estilo arquitectónico se caracteriza por arcos puntiagudos y vitrales?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p38 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p38, 'Románico'), (@p38, 'Gótico'), (@p38, 'Barroco'), (@p38, 'Renacentista');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p38 AND texto = 'Gótico') WHERE id = @p38;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Los miserables"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p39 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p39, 'Alexandre Dumas'), (@p39, 'Victor Hugo'), (@p39, 'Émile Zola'), (@p39, 'Gustave Flaubert');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p39 AND texto = 'Victor Hugo') WHERE id = @p39;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor mexicano pintó autorretratos famosos con cejas unidas?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p40 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p40, 'Diego Rivera'), (@p40, 'Frida Kahlo'), (@p40, 'Rufino Tamayo'), (@p40, 'José Clemente Orozco');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p40 AND texto = 'Frida Kahlo') WHERE id = @p40;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué autor escribió "El gran Gatsby"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p41 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p41, 'Ernest Hemingway'), (@p41, 'F. Scott Fitzgerald'), (@p41, 'William Faulkner'), (@p41, 'John Steinbeck');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p41 AND texto = 'F. Scott Fitzgerald') WHERE id = @p41;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor austríaco pintó "El beso"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p42 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p42, 'Egon Schiele'), (@p42, 'Gustav Klimt'), (@p42, 'Oskar Kokoschka'), (@p42, 'Friedensreich Hundertwasser');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p42 AND texto = 'Gustav Klimt') WHERE id = @p42;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "La metamorfosis"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p43 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p43, 'Franz Kafka'), (@p43, 'Thomas Mann'), (@p43, 'Hermann Hesse'), (@p43, 'Rainer Maria Rilke');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p43 AND texto = 'Franz Kafka') WHERE id = @p43;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de obra es "La Ilíada"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p44 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p44, 'Novela'), (@p44, 'Poema épico'), (@p44, 'Tragedia'), (@p44, 'Ensayo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p44 AND texto = 'Poema épico') WHERE id = @p44;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué autor uruguayo escribió "Las venas abiertas de América Latina"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p45 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p45, 'Mario Benedetti'), (@p45, 'Eduardo Galeano'), (@p45, 'Juan Carlos Onetti'), (@p45, 'Horacio Quiroga');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p45 AND texto = 'Eduardo Galeano') WHERE id = @p45;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué arquitecto diseñó la Sagrada Familia en Barcelona?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p46 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p46, 'Santiago Calatrava'), (@p46, 'Antoni Gaudí'), (@p46, 'Rafael Moneo'), (@p46, 'Ricardo Bofill');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p46 AND texto = 'Antoni Gaudí') WHERE id = @p46;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Matar a un ruiseñor"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p47 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p47, 'Harper Lee'), (@p47, 'Toni Morrison'), (@p47, 'Truman Capote'), (@p47, 'Flannery O''Connor');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p47 AND texto = 'Harper Lee') WHERE id = @p47;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor neerlandés se cortó la oreja y vivió en pobreza?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p48 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p48, 'Vincent van Gogh'), (@p48, 'Piet Mondrian'), (@p48, 'M.C. Escher'), (@p48, 'Hieronymus Bosch');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p48 AND texto = 'Vincent van Gogh') WHERE id = @p48;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué obra de teatro de Shakespeare trata sobre un rey escocés ambicioso?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p49 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p49, 'Otelo'), (@p49, 'Macbeth'), (@p49, 'El rey Lear'), (@p49, 'Ricardo III');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p49 AND texto = 'Macbeth') WHERE id = @p49;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién esculpió "El pensador"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p50 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p50, 'Auguste Rodin'), (@p50, 'Camille Claudel'), (@p50, 'Constantin Brâncuși'), (@p50, 'Antoine Bourdelle');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p50 AND texto = 'Auguste Rodin') WHERE id = @p50;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué escritor inglés escribió "Oliver Twist"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p51 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p51, 'Charles Dickens'), (@p51, 'Thomas Hardy'), (@p51, 'Wilkie Collins'), (@p51, 'George Eliot');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p51 AND texto = 'Charles Dickens') WHERE id = @p51;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor renacentista pintó "El nacimiento de Venus"?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p52 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p52, 'Sandro Botticelli'), (@p52, 'Leonardo da Vinci'), (@p52, 'Tiziano'), (@p52, 'Rafael');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p52 AND texto = 'Sandro Botticelli') WHERE id = @p52;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "El señor de los anillos"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p53 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p53, 'C.S. Lewis'), (@p53, 'J.R.R. Tolkien'), (@p53, 'George R.R. Martin'), (@p53, 'Terry Pratchett');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p53 AND texto = 'J.R.R. Tolkien') WHERE id = @p53;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor flamenco pintó "El jardín de las delicias"?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p54 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p54, 'Pieter Bruegel'), (@p54, 'Hieronymus Bosch'), (@p54, 'Jan van Eyck'), (@p54, 'Rogier van der Weyden');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p54 AND texto = 'Hieronymus Bosch') WHERE id = @p54;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué escritora creó a Hércules Poirot?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p55 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p55, 'Agatha Christie'), (@p55, 'P.D. James'), (@p55, 'Dorothy Sayers'), (@p55, 'Patricia Highsmith');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p55 AND texto = 'Agatha Christie') WHERE id = @p55;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué movimiento literario representa Edgar Allan Poe con sus cuentos de terror?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p56 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p56, 'Realismo'), (@p56, 'Gótico / Romanticismo oscuro'), (@p56, 'Naturalismo'), (@p56, 'Modernismo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p56 AND texto = 'Gótico / Romanticismo oscuro') WHERE id = @p56;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor impresionista pintó "Impresión, sol naciente" que dio nombre al movimiento?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p57 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p57, 'Édouard Manet'), (@p57, 'Claude Monet'), (@p57, 'Edgar Degas'), (@p57, 'Alfred Sisley');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p57 AND texto = 'Claude Monet') WHERE id = @p57;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió "Los juegos del hambre"?', 'Arte y Literatura', 0.10, 'aprobada');
SET @p58 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p58, 'Veronica Roth'), (@p58, 'Suzanne Collins'), (@p58, 'Stephenie Meyer'), (@p58, 'Cassandra Clare');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p58 AND texto = 'Suzanne Collins') WHERE id = @p58;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pintor mexicano fue famoso por sus murales con temática social?', 'Arte y Literatura', 0.70, 'aprobada');
SET @p59 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p59, 'Frida Kahlo'), (@p59, 'Diego Rivera'), (@p59, 'Rufino Tamayo'), (@p59, 'David Alfaro Siqueiros');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p59 AND texto = 'Diego Rivera') WHERE id = @p59;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué novela narra las aventuras de un niño que vive en un orfanato victoriano inglés?', 'Arte y Literatura', 0.40, 'aprobada');
SET @p60 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p60, 'David Copperfield'), (@p60, 'Oliver Twist'), (@p60, 'Grandes esperanzas'), (@p60, 'Cumbres borrascosas');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p60 AND texto = 'Oliver Twist') WHERE id = @p60;