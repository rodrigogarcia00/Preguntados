-- CATEGORIA: Geografia e Historia

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Australia?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p1, 'Sídney'), (@p1, 'Canberra'), (@p1, 'Melbourne'), (@p1, 'Brisbane');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p1 AND texto = 'Canberra') WHERE id = @p1;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué año cayó el Muro de Berlín?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p2, '1987'), (@p2, '1989'), (@p2, '1991'), (@p2, '1993');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p2 AND texto = '1989') WHERE id = @p2;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el río más largo del mundo?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p3, 'Río Nilo'), (@p3, 'Río Amazonas'), (@p3, 'Río Yangtsé'), (@p3, 'Río Misisipi');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p3 AND texto = 'Río Amazonas') WHERE id = @p3;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué imperio construyó Machu Picchu?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p4 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p4, 'Imperio Azteca'), (@p4, 'Imperio Inca'), (@p4, 'Imperio Maya'), (@p4, 'Imperio Tolteca');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p4 AND texto = 'Imperio Inca') WHERE id = @p4;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el país más grande del mundo por superficie?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p5, 'China'), (@p5, 'Canadá'), (@p5, 'Rusia'), (@p5, 'Estados Unidos');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p5 AND texto = 'Rusia') WHERE id = @p5;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién fue el primer emperador romano?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p6, 'Julio César'), (@p6, 'Augusto'), (@p6, 'Nerón'), (@p6, 'Trajano');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p6 AND texto = 'Augusto') WHERE id = @p6;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el desierto más grande del mundo?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p7 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p7, 'Desierto del Sahara'), (@p7, 'Desierto de Gobi'), (@p7, 'Antártida'), (@p7, 'Desierto de Atacama');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p7 AND texto = 'Antártida') WHERE id = @p7;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué continente se encuentra Egipto?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p8 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p8, 'Asia'), (@p8, 'África'), (@p8, 'Europa'), (@p8, 'Oceanía');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p8 AND texto = 'África') WHERE id = @p8;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué revolución comenzó en 1789?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p9 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p9, 'Revolución Industrial'), (@p9, 'Revolución Francesa'), (@p9, 'Revolución Rusa'), (@p9, 'Revolución Mexicana');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p9 AND texto = 'Revolución Francesa') WHERE id = @p9;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la montaña más alta del mundo?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p10 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p10, 'K2'), (@p10, 'Monte Everest'), (@p10, 'Monte Kilimanjaro'), (@p10, 'Aconcagua');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p10 AND texto = 'Monte Everest') WHERE id = @p10;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tratado puso fin a la Primera Guerra Mundial?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p11 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p11, 'Tratado de Versalles'), (@p11, 'Tratado de Westfalia'), (@p11, 'Tratado de Utrecht'), (@p11, 'Tratado de Tordesillas');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p11 AND texto = 'Tratado de Versalles') WHERE id = @p11;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Canadá?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p12 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p12, 'Toronto'), (@p12, 'Vancouver'), (@p12, 'Ottawa'), (@p12, 'Montreal');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p12 AND texto = 'Ottawa') WHERE id = @p12;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué civilización antigua construyó las pirámides de Giza?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p13 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p13, 'Los egipcios'), (@p13, 'Los romanos'), (@p13, 'Los griegos'), (@p13, 'Los persas');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p13 AND texto = 'Los egipcios') WHERE id = @p13;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país tiene forma de bota en un mapa?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p14 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p14, 'España'), (@p14, 'Italia'), (@p14, 'Grecia'), (@p14, 'Portugal');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p14 AND texto = 'Italia') WHERE id = @p14;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién fue el líder de la independencia de la India?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p15 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p15, 'Gandhi'), (@p15, 'Nehru'), (@p15, 'Bose'), (@p15, 'Patel');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p15 AND texto = 'Gandhi') WHERE id = @p15;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el océano más grande del mundo?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p16 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p16, 'Océano Atlántico'), (@p16, 'Océano Índico'), (@p16, 'Océano Pacífico'), (@p16, 'Océano Ártico');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p16 AND texto = 'Océano Pacífico') WHERE id = @p16;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué muralla fue construida para proteger China de invasiones?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p17 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p17, 'Muralla de Adriano'), (@p17, 'Gran Muralla China'), (@p17, 'Muro de Berlín'), (@p17, 'Muralla de Constantinopla');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p17 AND texto = 'Gran Muralla China') WHERE id = @p17;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué año comenzó la Segunda Guerra Mundial?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p18 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p18, '1937'), (@p18, '1939'), (@p18, '1941'), (@p18, '1945');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p18 AND texto = '1939') WHERE id = @p18;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el país más poblado del mundo?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p19 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p19, 'Estados Unidos'), (@p19, 'India'), (@p19, 'China'), (@p19, 'Indonesia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p19 AND texto = 'India') WHERE id = @p19;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué faraón es famoso por su máscara funeraria de oro descubierta en 1922?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p20 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p20, 'Ramsés II'), (@p20, 'Tutankamón'), (@p20, 'Akenatón'), (@p20, 'Keops');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p20 AND texto = 'Tutankamón') WHERE id = @p20;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Francia?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p21 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p21, 'Lyon'), (@p21, 'Marsella'), (@p21, 'París'), (@p21, 'Niza');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p21 AND texto = 'París') WHERE id = @p21;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué explorador llegó a América en 1492?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p22 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p22, 'Hernán Cortés'), (@p22, 'Cristóbal Colón'), (@p22, 'Vasco da Gama'), (@p22, 'Fernando de Magallanes');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p22 AND texto = 'Cristóbal Colón') WHERE id = @p22;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el continente más pequeño del mundo?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p23 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p23, 'Europa'), (@p23, 'Oceanía'), (@p23, 'Antártida'), (@p23, 'América del Sur');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p23 AND texto = 'Oceanía') WHERE id = @p23;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién pintó la independencia y lideró la liberación de varios países sudamericanos junto a San Martín?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p24 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p24, 'Simón Bolívar'), (@p24, 'Bernardo O''Higgins'), (@p24, 'Antonio José de Sucre'), (@p24, 'José de San Martín');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p24 AND texto = 'Simón Bolívar') WHERE id = @p24;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué país se encuentra la Torre Eiffel?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p25 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p25, 'Italia'), (@p25, 'España'), (@p25, 'Francia'), (@p25, 'Alemania');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p25 AND texto = 'Francia') WHERE id = @p25;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué evento marcó el inicio de la Edad Media?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p26 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p26, 'La caída del Imperio Romano de Occidente'), (@p26, 'El descubrimiento de América'), (@p26, 'La caída de Constantinopla'), (@p26, 'El nacimiento de Jesucristo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p26 AND texto = 'La caída del Imperio Romano de Occidente') WHERE id = @p26;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el lago más grande del mundo?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p27 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p27, 'Lago Superior'), (@p27, 'Mar Caspio'), (@p27, 'Lago Victoria'), (@p27, 'Lago Baikal');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p27 AND texto = 'Mar Caspio') WHERE id = @p27;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién fue el primer hombre en llegar a la Luna?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p28 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p28, 'Buzz Aldrin'), (@p28, 'Neil Armstrong'), (@p28, 'Yuri Gagarin'), (@p28, 'John Glenn');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p28 AND texto = 'Neil Armstrong') WHERE id = @p28;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país europeo tiene más islas?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p29 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p29, 'Grecia'), (@p29, 'Noruega'), (@p29, 'Suecia'), (@p29, 'Croacia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p29 AND texto = 'Noruega') WHERE id = @p29;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué imperio gobernó Constantinopla hasta 1453?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p30 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p30, 'Imperio Otomano'), (@p30, 'Imperio Bizantino'), (@p30, 'Imperio Persa'), (@p30, 'Imperio Romano de Occidente');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p30 AND texto = 'Imperio Bizantino') WHERE id = @p30;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Japón?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p31 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p31, 'Osaka'), (@p31, 'Kioto'), (@p31, 'Tokio'), (@p31, 'Yokohama');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p31 AND texto = 'Tokio') WHERE id = @p31;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país fue dividido por el Muro de Berlín?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p32 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p32, 'Polonia'), (@p32, 'Alemania'), (@p32, 'Austria'), (@p32, 'Hungría');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p32 AND texto = 'Alemania') WHERE id = @p32;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el estrecho que separa España de África?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p33 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p33, 'Estrecho de Magallanes'), (@p33, 'Estrecho de Gibraltar'), (@p33, 'Estrecho de Bering'), (@p33, 'Estrecho de Ormuz');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p33 AND texto = 'Estrecho de Gibraltar') WHERE id = @p33;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién escribió la "Declaración de Independencia" de Estados Unidos?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p34 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p34, 'George Washington'), (@p34, 'Thomas Jefferson'), (@p34, 'Benjamin Franklin'), (@p34, 'John Adams');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p34 AND texto = 'Thomas Jefferson') WHERE id = @p34;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país tiene la mayor cantidad de husos horarios?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p35 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p35, 'Rusia'), (@p35, 'Estados Unidos'), (@p35, 'Francia'), (@p35, 'China');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p35 AND texto = 'Francia') WHERE id = @p35;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué país se ubica la Gran Barrera de Coral?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p36 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p36, 'Filipinas'), (@p36, 'Australia'), (@p36, 'Indonesia'), (@p36, 'Tailandia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p36 AND texto = 'Australia') WHERE id = @p36;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué dinastía gobernó China durante la construcción del Ejército de Terracota?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p37 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p37, 'Dinastía Ming'), (@p37, 'Dinastía Qin'), (@p37, 'Dinastía Han'), (@p37, 'Dinastía Tang');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p37 AND texto = 'Dinastía Qin') WHERE id = @p37;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Brasil?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p38 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p38, 'Río de Janeiro'), (@p38, 'São Paulo'), (@p38, 'Brasilia'), (@p38, 'Salvador');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p38 AND texto = 'Brasilia') WHERE id = @p38;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país fue conocido como "la Persia antigua"?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p39 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p39, 'Irak'), (@p39, 'Irán'), (@p39, 'Turquía'), (@p39, 'Afganistán');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p39 AND texto = 'Irán') WHERE id = @p39;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el país más pequeño del mundo?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p40 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p40, 'Mónaco'), (@p40, 'San Marino'), (@p40, 'Ciudad del Vaticano'), (@p40, 'Liechtenstein');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p40 AND texto = 'Ciudad del Vaticano') WHERE id = @p40;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién fue el general cartaginés que cruzó los Alpes con elefantes?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p41 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p41, 'Aníbal'), (@p41, 'Escipión'), (@p41, 'Pirro'), (@p41, 'Asdrúbal');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p41 AND texto = 'Aníbal') WHERE id = @p41;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cordillera recorre toda Sudamérica?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p42 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p42, 'Montes Urales'), (@p42, 'Cordillera de los Andes'), (@p42, 'Montes Apalaches'), (@p42, 'Alpes');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p42 AND texto = 'Cordillera de los Andes') WHERE id = @p42;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué año se independizó Argentina?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p43 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p43, '1810'), (@p43, '1816'), (@p43, '1820'), (@p43, '1825');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p43 AND texto = '1816') WHERE id = @p43;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué reina gobernó Inglaterra durante 63 años en el siglo XIX?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p44 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p44, 'Isabel I'), (@p44, 'Victoria'), (@p44, 'Ana'), (@p44, 'María I');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p44 AND texto = 'Victoria') WHERE id = @p44;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Egipto?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p45 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p45, 'Alejandría'), (@p45, 'El Cairo'), (@p45, 'Luxor'), (@p45, 'Giza');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p45 AND texto = 'El Cairo') WHERE id = @p45;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué península comparten España y Portugal?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p46 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p46, 'Península Itálica'), (@p46, 'Península Ibérica'), (@p46, 'Península Balcánica'), (@p46, 'Península Escandinava');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p46 AND texto = 'Península Ibérica') WHERE id = @p46;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país construyó el Coliseo Romano?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p47 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p47, 'Grecia'), (@p47, 'Italia (Imperio Romano)'), (@p47, 'España'), (@p47, 'Egipto');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p47 AND texto = 'Italia (Imperio Romano)') WHERE id = @p47;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el río que atraviesa Egipto?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p48 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p48, 'Río Tigris'), (@p48, 'Río Nilo'), (@p48, 'Río Éufrates'), (@p48, 'Río Jordán');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p48 AND texto = 'Río Nilo') WHERE id = @p48;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién fue el dictador de Alemania durante la Segunda Guerra Mundial?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p49 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p49, 'Benito Mussolini'), (@p49, 'Adolf Hitler'), (@p49, 'Joseph Stalin'), (@p49, 'Francisco Franco');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p49 AND texto = 'Adolf Hitler') WHERE id = @p49;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Rusia?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p50 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p50, 'San Petersburgo'), (@p50, 'Moscú'), (@p50, 'Sochi'), (@p50, 'Kazán');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p50 AND texto = 'Moscú') WHERE id = @p50;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país es conocido como "la tierra del sol naciente"?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p51 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p51, 'China'), (@p51, 'Japón'), (@p51, 'Corea del Sur'), (@p51, 'Tailandia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p51 AND texto = 'Japón') WHERE id = @p51;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué imperio fue gobernado por Moctezuma?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p52 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p52, 'Imperio Inca'), (@p52, 'Imperio Maya'), (@p52, 'Imperio Azteca'), (@p52, 'Imperio Tolteca');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p52 AND texto = 'Imperio Azteca') WHERE id = @p52;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el país con más husos horarios después de Francia?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p53 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p53, 'Rusia'), (@p53, 'Estados Unidos'), (@p53, 'Reino Unido'), (@p53, 'Australia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p53 AND texto = 'Rusia') WHERE id = @p53;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué país nació la democracia como sistema político?', 'Geografía e Historia', 0.40, 'aprobada');
SET @p54 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p54, 'Roma'), (@p54, 'Grecia'), (@p54, 'Egipto'), (@p54, 'Persia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p54 AND texto = 'Grecia') WHERE id = @p54;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de México?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p55 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p55, 'Guadalajara'), (@p55, 'Ciudad de México'), (@p55, 'Cancún'), (@p55, 'Monterrey');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p55 AND texto = 'Ciudad de México') WHERE id = @p55;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué famoso barco se hundió en 1912?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p56 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p56, 'Lusitania'), (@p56, 'Titanic'), (@p56, 'Bismarck'), (@p56, 'Britannic');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p56 AND texto = 'Titanic') WHERE id = @p56;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país tiene la bandera con la hoja de arce?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p57 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p57, 'Estados Unidos'), (@p57, 'Canadá'), (@p57, 'Reino Unido'), (@p57, 'Australia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p57 AND texto = 'Canadá') WHERE id = @p57;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué muro separaba Berlín Este de Berlín Oeste?', 'Geografía e Historia', 0.10, 'aprobada');
SET @p58 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p58, 'Muralla China'), (@p58, 'Muro de Berlín'), (@p58, 'Línea Maginot'), (@p58, 'Muro de Adriano');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p58 AND texto = 'Muro de Berlín') WHERE id = @p58;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué reino unificó España en 1492 tras la conquista de Granada?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p59 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p59, 'Reino de Castilla y Aragón'), (@p59, 'Reino de Navarra'), (@p59, 'Reino de Portugal'), (@p59, 'Reino de León');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p59 AND texto = 'Reino de Castilla y Aragón') WHERE id = @p59;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capital de Sudáfrica administrativa?', 'Geografía e Historia', 0.70, 'aprobada');
SET @p60 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p60, 'Johannesburgo'), (@p60, 'Pretoria'), (@p60, 'Ciudad del Cabo'), (@p60, 'Durban');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p60 AND texto = 'Pretoria') WHERE id = @p60;