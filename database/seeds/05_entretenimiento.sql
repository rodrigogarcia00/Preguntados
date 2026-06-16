-- CATEGORIA: Entretenimiento

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién dirigió la trilogía original de "El Señor de los Anillos"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p1, 'James Cameron'), (@p1, 'Peter Jackson'), (@p1, 'Steven Spielberg'), (@p1, 'Christopher Nolan');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p1 AND texto = 'Peter Jackson') WHERE id = @p1;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor interpretó a Iron Man en el universo cinematográfico de Marvel?', 'Entretenimiento', 0.10, 'aprobada');
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p2, 'Chris Evans'), (@p2, 'Robert Downey Jr.'), (@p2, 'Chris Hemsworth'), (@p2, 'Mark Ruffalo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p2 AND texto = 'Robert Downey Jr.') WHERE id = @p2;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué banda lanzó el álbum "Abbey Road"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p3, 'The Rolling Stones'), (@p3, 'The Beatles'), (@p3, 'Pink Floyd'), (@p3, 'Led Zeppelin');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p3 AND texto = 'The Beatles') WHERE id = @p3;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de televisión es famosa por la frase "Winter is coming"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p4 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p4, 'Vikingos'), (@p4, 'Juego de Tronos'), (@p4, 'The Witcher'), (@p4, 'Outlander');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p4 AND texto = 'Juego de Tronos') WHERE id = @p4;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién interpretó al personaje de Jack Sparrow en "Piratas del Caribe"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p5, 'Orlando Bloom'), (@p5, 'Johnny Depp'), (@p5, 'Geoffrey Rush'), (@p5, 'Javier Bardem');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p5 AND texto = 'Johnny Depp') WHERE id = @p5;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película ganó el Óscar a Mejor Película en 2020 siendo la primera de habla no inglesa en lograrlo?', 'Entretenimiento', 0.70, 'aprobada');
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p6, '1917'), (@p6, 'Parásitos'), (@p6, 'Joker'), (@p6, 'Once Upon a Time in Hollywood');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p6 AND texto = 'Parásitos') WHERE id = @p6;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante es conocido como "El Rey del Pop"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p7 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p7, 'Elvis Presley'), (@p7, 'Michael Jackson'), (@p7, 'Prince'), (@p7, 'Freddie Mercury');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p7 AND texto = 'Michael Jackson') WHERE id = @p7;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué saga de películas presenta a "Darth Vader"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p8 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p8, 'Star Trek'), (@p8, 'Star Wars'), (@p8, 'Guardianes de la Galaxia'), (@p8, 'Dune');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p8 AND texto = 'Star Wars') WHERE id = @p8;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actriz interpretó a Hermione Granger en la saga "Harry Potter"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p9 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p9, 'Bonnie Wright'), (@p9, 'Emma Watson'), (@p9, 'Evanna Lynch'), (@p9, 'Katie Leung');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p9 AND texto = 'Emma Watson') WHERE id = @p9;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué banda de rock británica lanzó "The Dark Side of the Moon"?', 'Entretenimiento', 0.70, 'aprobada');
SET @p10 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p10, 'Queen'), (@p10, 'Pink Floyd'), (@p10, 'Deep Purple'), (@p10, 'Black Sabbath');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p10 AND texto = 'Pink Floyd') WHERE id = @p10;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué director es conocido por películas como "Tiburón" y "Jurassic Park"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p11 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p11, 'George Lucas'), (@p11, 'Steven Spielberg'), (@p11, 'James Cameron'), (@p11, 'Ridley Scott');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p11 AND texto = 'Steven Spielberg') WHERE id = @p11;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie animada presenta a la familia Simpson en Springfield?', 'Entretenimiento', 0.10, 'aprobada');
SET @p12 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p12, 'Padre de Familia'), (@p12, 'Los Simpson'), (@p12, 'Bob Esponja'), (@p12, 'South Park');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p12 AND texto = 'Los Simpson') WHERE id = @p12;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante colombiana interpreta "Hips Don''t Lie"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p13 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p13, 'Karol G'), (@p13, 'Shakira'), (@p13, 'J Balvin'), (@p13, 'Maluma');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p13 AND texto = 'Shakira') WHERE id = @p13;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película de Disney presenta a una princesa que se transforma en oso?', 'Entretenimiento', 0.70, 'aprobada');
SET @p14 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p14, 'Brave (Valiente)'), (@p14, 'Mulan'), (@p14, 'Moana'), (@p14, 'Frozen');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p14 AND texto = 'Brave (Valiente)') WHERE id = @p14;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién interpretó a Forrest Gump?', 'Entretenimiento', 0.40, 'aprobada');
SET @p15 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p15, 'Robin Williams'), (@p15, 'Tom Hanks'), (@p15, 'Kevin Costner'), (@p15, 'Bill Murray');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p15 AND texto = 'Tom Hanks') WHERE id = @p15;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué videojuego presenta a un fontanero llamado Mario?', 'Entretenimiento', 0.10, 'aprobada');
SET @p16 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p16, 'Sonic'), (@p16, 'Super Mario'), (@p16, 'Zelda'), (@p16, 'Crash Bandicoot');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p16 AND texto = 'Super Mario') WHERE id = @p16;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué banda de rock tenía como vocalista a Freddie Mercury?', 'Entretenimiento', 0.10, 'aprobada');
SET @p17 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p17, 'The Who'), (@p17, 'Queen'), (@p17, 'Genesis'), (@p17, 'Yes');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p17 AND texto = 'Queen') WHERE id = @p17;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor interpretó al Joker en "The Dark Knight" (2008)?', 'Entretenimiento', 0.40, 'aprobada');
SET @p18 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p18, 'Jared Leto'), (@p18, 'Heath Ledger'), (@p18, 'Joaquin Phoenix'), (@p18, 'Jack Nicholson');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p18 AND texto = 'Heath Ledger') WHERE id = @p18;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué plataforma de streaming produjo "Stranger Things"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p19 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p19, 'Disney+'), (@p19, 'Netflix'), (@p19, 'HBO Max'), (@p19, 'Amazon Prime Video');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p19 AND texto = 'Netflix') WHERE id = @p19;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actriz protagonizó "Los juegos del hambre" como Katniss Everdeen?', 'Entretenimiento', 0.40, 'aprobada');
SET @p20 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p20, 'Emma Stone'), (@p20, 'Jennifer Lawrence'), (@p20, 'Kristen Stewart'), (@p20, 'Shailene Woodley');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p20 AND texto = 'Jennifer Lawrence') WHERE id = @p20;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué grupo de K-pop es conocido por canciones como "Dynamite" y "Butter"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p21 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p21, 'BLACKPINK'), (@p21, 'BTS'), (@p21, 'EXO'), (@p21, 'TWICE');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p21 AND texto = 'BTS') WHERE id = @p21;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película de animación de Pixar trata sobre los juguetes de un niño llamado Andy?', 'Entretenimiento', 0.10, 'aprobada');
SET @p22 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p22, 'Up'), (@p22, 'Toy Story'), (@p22, 'Coco'), (@p22, 'Cars');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p22 AND texto = 'Toy Story') WHERE id = @p22;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor interpretó a Neo en "The Matrix"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p23 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p23, 'Brad Pitt'), (@p23, 'Keanu Reeves'), (@p23, 'Will Smith'), (@p23, 'Tom Cruise');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p23 AND texto = 'Keanu Reeves') WHERE id = @p23;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante puertorriqueño es conocido como "El Conejo Malo"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p24 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p24, 'Ozuna'), (@p24, 'Bad Bunny'), (@p24, 'Daddy Yankee'), (@p24, 'Anuel AA');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p24 AND texto = 'Bad Bunny') WHERE id = @p24;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de TV sigue a un profesor de química que se vuelve fabricante de drogas?', 'Entretenimiento', 0.40, 'aprobada');
SET @p25 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p25, 'Better Call Saul'), (@p25, 'Breaking Bad'), (@p25, 'Narcos'), (@p25, 'Ozark');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p25 AND texto = 'Breaking Bad') WHERE id = @p25;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor da voz a "Woody" en la versión original de Toy Story?', 'Entretenimiento', 0.70, 'aprobada');
SET @p26 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p26, 'Tim Allen'), (@p26, 'Tom Hanks'), (@p26, 'Billy Crystal'), (@p26, 'John Ratzenberger');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p26 AND texto = 'Tom Hanks') WHERE id = @p26;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante británica lanzó el álbum "21" con el éxito "Rolling in the Deep"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p27 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p27, 'Amy Winehouse'), (@p27, 'Adele'), (@p27, 'Florence Welch'), (@p27, 'Dua Lipa');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p27 AND texto = 'Adele') WHERE id = @p27;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película narra el hundimiento de un transatlántico en 1912, con Leonardo DiCaprio?', 'Entretenimiento', 0.10, 'aprobada');
SET @p28 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p28, 'Avatar'), (@p28, 'Titanic'), (@p28, 'El gran Gatsby'), (@p28, 'Náufrago');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p28 AND texto = 'Titanic') WHERE id = @p28;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué presentador conduce el late night show "The Tonight Show" en EE.UU. desde 2014?', 'Entretenimiento', 0.70, 'aprobada');
SET @p29 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p29, 'Jimmy Kimmel'), (@p29, 'Jimmy Fallon'), (@p29, 'Conan O''Brien'), (@p29, 'Stephen Colbert');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p29 AND texto = 'Jimmy Fallon') WHERE id = @p29;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué superhéroe de Marvel lleva un escudo como arma principal?', 'Entretenimiento', 0.10, 'aprobada');
SET @p30 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p30, 'Thor'), (@p30, 'Capitán América'), (@p30, 'Iron Man'), (@p30, 'Hulk');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p30 AND texto = 'Capitán América') WHERE id = @p30;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué director es famoso por películas como "Inception" y "Interstellar"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p31 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p31, 'Denis Villeneuve'), (@p31, 'Christopher Nolan'), (@p31, 'David Fincher'), (@p31, 'Ridley Scott');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p31 AND texto = 'Christopher Nolan') WHERE id = @p31;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante argentina interpreta "Te Felicito" junto a Shakira?', 'Entretenimiento', 0.40, 'aprobada');
SET @p32 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p32, 'Tini Stoessel'), (@p32, 'Rauw Alejandro'), (@p32, 'María Becerra'), (@p32, 'Nicki Nicole');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p32 AND texto = 'Rauw Alejandro') WHERE id = @p32;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie animada japonesa presenta a un niño llamado Goku?', 'Entretenimiento', 0.10, 'aprobada');
SET @p33 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p33, 'Naruto'), (@p33, 'Dragon Ball'), (@p33, 'One Piece'), (@p33, 'Bleach');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p33 AND texto = 'Dragon Ball') WHERE id = @p33;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor protagoniza la saga "John Wick"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p34 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p34, 'Jason Statham'), (@p34, 'Keanu Reeves'), (@p34, 'Liam Neeson'), (@p34, 'Vin Diesel');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p34 AND texto = 'Keanu Reeves') WHERE id = @p34;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué banda de rock argentino interpretó "De Música Ligera"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p35 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p35, 'Soda Stereo'), (@p35, 'Los Redonditos de Ricota'), (@p35, 'Sumo'), (@p35, 'Divididos');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p35 AND texto = 'Soda Stereo') WHERE id = @p35;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actriz interpretó a la Reina de Corazones en "Alicia en el país de las maravillas" (2010)?', 'Entretenimiento', 0.70, 'aprobada');
SET @p36 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p36, 'Helena Bonham Carter'), (@p36, 'Anne Hathaway'), (@p36, 'Mia Wasikowska'), (@p36, 'Cate Blanchett');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p36 AND texto = 'Helena Bonham Carter') WHERE id = @p36;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de Netflix está ambientada en una casa de moneda y un robo histórico en España?', 'Entretenimiento', 0.40, 'aprobada');
SET @p37 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p37, 'Élite'), (@p37, 'La Casa de Papel'), (@p37, 'Vis a Vis'), (@p37, 'Las chicas del cable');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p37 AND texto = 'La Casa de Papel') WHERE id = @p37;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor protagonizó "El Padrino" como Michael Corleone?', 'Entretenimiento', 0.70, 'aprobada');
SET @p38 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p38, 'Marlon Brando'), (@p38, 'Al Pacino'), (@p38, 'Robert De Niro'), (@p38, 'James Caan');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p38 AND texto = 'Al Pacino') WHERE id = @p38;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué videojuego de mundo abierto presenta a un protagonista llamado Link?', 'Entretenimiento', 0.40, 'aprobada');
SET @p39 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p39, 'Final Fantasy'), (@p39, 'The Legend of Zelda'), (@p39, 'Kingdom Hearts'), (@p39, 'Fire Emblem');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p39 AND texto = 'The Legend of Zelda') WHERE id = @p39;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante mexicana es conocida como "La Reina del Pop Latino"?', 'Entretenimiento', 0.70, 'aprobada');
SET @p40 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p40, 'Paulina Rubio'), (@p40, 'Thalía'), (@p40, 'Gloria Trevi'), (@p40, 'Ana Gabriel');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p40 AND texto = 'Thalía') WHERE id = @p40;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película de terror presenta a un payaso llamado Pennywise?', 'Entretenimiento', 0.40, 'aprobada');
SET @p41 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p41, 'El Conjuro'), (@p41, 'It (Eso)'), (@p41, 'Annabelle'), (@p41, 'Insidious');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p41 AND texto = 'It (Eso)') WHERE id = @p41;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor protagonizó "Titanic" junto a Kate Winslet?', 'Entretenimiento', 0.10, 'aprobada');
SET @p42 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p42, 'Brad Pitt'), (@p42, 'Leonardo DiCaprio'), (@p42, 'Matt Damon'), (@p42, 'Ben Affleck');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p42 AND texto = 'Leonardo DiCaprio') WHERE id = @p42;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de anime presenta a piratas en busca del "One Piece"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p43 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p43, 'Naruto'), (@p43, 'One Piece'), (@p43, 'Bleach'), (@p43, 'Fairy Tail');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p43 AND texto = 'One Piece') WHERE id = @p43;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué músico es conocido como "The Boss" en el rock estadounidense?', 'Entretenimiento', 0.70, 'aprobada');
SET @p44 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p44, 'Bruce Springsteen'), (@p44, 'Bob Dylan'), (@p44, 'Bono'), (@p44, 'Neil Young');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p44 AND texto = 'Bruce Springsteen') WHERE id = @p44;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película presenta a un grupo de superhéroes llamados "Guardianes de la Galaxia"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p45 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p45, 'DC Comics'), (@p45, 'Marvel'), (@p45, 'Image Comics'), (@p45, 'Dark Horse');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p45 AND texto = 'Marvel') WHERE id = @p45;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante interpretó "Despacito" junto a Daddy Yankee?', 'Entretenimiento', 0.10, 'aprobada');
SET @p46 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p46, 'Maluma'), (@p46, 'Luis Fonsi'), (@p46, 'Nicky Jam'), (@p46, 'J Balvin');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p46 AND texto = 'Luis Fonsi') WHERE id = @p46;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de TV narra la vida de químicos en Albuquerque y deriva en spin-off de abogados?', 'Entretenimiento', 0.70, 'aprobada');
SET @p47 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p47, 'Breaking Bad / Better Call Saul'), (@p47, 'Dexter'), (@p47, 'The Wire'), (@p47, 'Fargo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p47 AND texto = 'Breaking Bad / Better Call Saul') WHERE id = @p47;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cómico y presentador conduce "Saturday Night Live" como creador desde 1975?', 'Entretenimiento', 0.70, 'aprobada');
SET @p48 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p48, 'David Letterman'), (@p48, 'Lorne Michaels'), (@p48, 'Johnny Carson'), (@p48, 'Conan O''Brien');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p48 AND texto = 'Lorne Michaels') WHERE id = @p48;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor da vida a Batman en "The Batman" (2022)?', 'Entretenimiento', 0.40, 'aprobada');
SET @p49 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p49, 'Christian Bale'), (@p49, 'Robert Pattinson'), (@p49, 'Ben Affleck'), (@p49, 'George Clooney');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p49 AND texto = 'Robert Pattinson') WHERE id = @p49;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué videojuego de battle royale presenta una isla con construcción de estructuras?', 'Entretenimiento', 0.10, 'aprobada');
SET @p50 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p50, 'PUBG'), (@p50, 'Fortnite'), (@p50, 'Apex Legends'), (@p50, 'Warzone');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p50 AND texto = 'Fortnite') WHERE id = @p50;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actriz interpretó a Wonder Woman en el DCEU?', 'Entretenimiento', 0.10, 'aprobada');
SET @p51 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p51, 'Margot Robbie'), (@p51, 'Gal Gadot'), (@p51, 'Scarlett Johansson'), (@p51, 'Brie Larson');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p51 AND texto = 'Gal Gadot') WHERE id = @p51;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante británico es conocido por "Shape of You" y "Perfect"?', 'Entretenimiento', 0.10, 'aprobada');
SET @p52 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p52, 'Ed Sheeran'), (@p52, 'Sam Smith'), (@p52, 'Harry Styles'), (@p52, 'James Arthur');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p52 AND texto = 'Ed Sheeran') WHERE id = @p52;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película de Pixar trata sobre las emociones dentro de la mente de una niña?', 'Entretenimiento', 0.40, 'aprobada');
SET @p53 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p53, 'Intensamente (Inside Out)'), (@p53, 'Soul'), (@p53, 'Onward'), (@p53, 'Luca');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p53 AND texto = 'Intensamente (Inside Out)') WHERE id = @p53;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor protagoniza la saga "Misión Imposible" como Ethan Hunt?', 'Entretenimiento', 0.40, 'aprobada');
SET @p54 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p54, 'Matt Damon'), (@p54, 'Tom Cruise'), (@p54, 'Mark Wahlberg'), (@p54, 'Liam Neeson');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p54 AND texto = 'Tom Cruise') WHERE id = @p54;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante venezolana es conocida como reina del pop latino con "Devorame Otra Vez"?', 'Entretenimiento', 0.70, 'aprobada');
SET @p55 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p55, 'Lila Downs'), (@p55, 'Lila Morillo'), (@p55, 'Yolandita Monge'), (@p55, 'Daniela Romo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p55 AND texto = 'Lila Morillo') WHERE id = @p55;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué serie de HBO está ambientada en un parque temático de robots con consciencia?', 'Entretenimiento', 0.70, 'aprobada');
SET @p56 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p56, 'Black Mirror'), (@p56, 'Westworld'), (@p56, 'Devs'), (@p56, 'Altered Carbon');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p56 AND texto = 'Westworld') WHERE id = @p56;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor interpretó a Wolverine en la saga X-Men durante casi 20 años?', 'Entretenimiento', 0.40, 'aprobada');
SET @p57 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p57, 'Hugh Jackman'), (@p57, 'Patrick Stewart'), (@p57, 'Ian McKellen'), (@p57, 'James McAvoy');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p57 AND texto = 'Hugh Jackman') WHERE id = @p57;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantante es conocida como "Queen Bey" o "La Reina"?', 'Entretenimiento', 0.40, 'aprobada');
SET @p58 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p58, 'Rihanna'), (@p58, 'Beyoncé'), (@p58, 'Alicia Keys'), (@p58, 'Mariah Carey');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p58 AND texto = 'Beyoncé') WHERE id = @p58;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué película de animación presenta a un pez payaso buscando a su hijo perdido?', 'Entretenimiento', 0.10, 'aprobada');
SET @p59 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p59, 'La Sirenita'), (@p59, 'Buscando a Nemo'), (@p59, 'Shark Tale'), (@p59, 'Ponyo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p59 AND texto = 'Buscando a Nemo') WHERE id = @p59;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué actor protagonizó "Avatar" de James Cameron en el rol principal?', 'Entretenimiento', 0.70, 'aprobada');
SET @p60 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p60, 'Sam Worthington'), (@p60, 'Joe Manganiello'), (@p60, 'Chris Pratt'), (@p60, 'Channing Tatum');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p60 AND texto = 'Sam Worthington') WHERE id = @p60;