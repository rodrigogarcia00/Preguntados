-- CATEGORIA: Ciencia y Naturaleza

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el planeta más cercano al Sol?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p1, 'Venus'), (@p1, 'Mercurio'), (@p1, 'Tierra'), (@p1, 'Marte');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p1 AND texto = 'Mercurio') WHERE id = @p1;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el órgano más grande del cuerpo humano?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p2, 'El corazón'), (@p2, 'El hígado'), (@p2, 'La piel'), (@p2, 'Los pulmones');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p2 AND texto = 'La piel') WHERE id = @p2;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué gas necesitan las plantas para hacer fotosíntesis?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p3, 'Oxígeno'), (@p3, 'Dióxido de carbono'), (@p3, 'Nitrógeno'), (@p3, 'Hidrógeno');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p3 AND texto = 'Dióxido de carbono') WHERE id = @p3;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el animal terrestre más grande del mundo?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p4 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p4, 'Rinoceronte'), (@p4, 'Elefante africano'), (@p4, 'Hipopótamo'), (@p4, 'Jirafa');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p4 AND texto = 'Elefante africano') WHERE id = @p4;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos huesos tiene el cuerpo humano adulto?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p5, '186'), (@p5, '206'), (@p5, '226'), (@p5, '246');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p5 AND texto = '206') WHERE id = @p5;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué elemento químico tiene el símbolo "O"?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p6, 'Oro'), (@p6, 'Oxígeno'), (@p6, 'Osmio'), (@p6, 'Ozono');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p6 AND texto = 'Oxígeno') WHERE id = @p6;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién propuso la teoría de la evolución por selección natural?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p7 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p7, 'Gregor Mendel'), (@p7, 'Charles Darwin'), (@p7, 'Louis Pasteur'), (@p7, 'Carl Linneo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p7 AND texto = 'Charles Darwin') WHERE id = @p7;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el planeta más grande del sistema solar?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p8 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p8, 'Saturno'), (@p8, 'Júpiter'), (@p8, 'Neptuno'), (@p8, 'Urano');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p8 AND texto = 'Júpiter') WHERE id = @p8;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué parte de la célula contiene el material genético?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p9 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p9, 'Mitocondria'), (@p9, 'Núcleo'), (@p9, 'Ribosoma'), (@p9, 'Citoplasma');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p9 AND texto = 'Núcleo') WHERE id = @p9;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la velocidad de la luz aproximadamente?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p10 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p10, '300.000 km/s'), (@p10, '150.000 km/s'), (@p10, '500.000 km/s'), (@p10, '1.000.000 km/s');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p10 AND texto = '300.000 km/s') WHERE id = @p10;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal es conocido como el "rey de la selva"?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p11 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p11, 'Tigre'), (@p11, 'León'), (@p11, 'Leopardo'), (@p11, 'Jaguar');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p11 AND texto = 'León') WHERE id = @p11;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué científico desarrolló la teoría de la relatividad?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p12 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p12, 'Isaac Newton'), (@p12, 'Albert Einstein'), (@p12, 'Niels Bohr'), (@p12, 'Stephen Hawking');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p12 AND texto = 'Albert Einstein') WHERE id = @p12;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos planetas tiene el sistema solar?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p13 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p13, '7'), (@p13, '8'), (@p13, '9'), (@p13, '10');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p13 AND texto = '8') WHERE id = @p13;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de animal es una ballena?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p14 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p14, 'Pez'), (@p14, 'Mamífero'), (@p14, 'Reptil'), (@p14, 'Anfibio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p14 AND texto = 'Mamífero') WHERE id = @p14;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué proceso permite a las plantas convertir la luz en energía?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p15 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p15, 'Respiración'), (@p15, 'Fotosíntesis'), (@p15, 'Transpiración'), (@p15, 'Fermentación');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p15 AND texto = 'Fotosíntesis') WHERE id = @p15;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el hueso más largo del cuerpo humano?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p16 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p16, 'Húmero'), (@p16, 'Fémur'), (@p16, 'Tibia'), (@p16, 'Radio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p16 AND texto = 'Fémur') WHERE id = @p16;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué planeta es conocido como el "planeta rojo"?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p17 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p17, 'Venus'), (@p17, 'Marte'), (@p17, 'Júpiter'), (@p17, 'Mercurio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p17 AND texto = 'Marte') WHERE id = @p17;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la unidad básica de la vida?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p18 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p18, 'El átomo'), (@p18, 'La célula'), (@p18, 'La molécula'), (@p18, 'El tejido');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p18 AND texto = 'La célula') WHERE id = @p18;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué fuerza mantiene a los planetas girando alrededor del Sol?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p19 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p19, 'Magnetismo'), (@p19, 'Gravedad'), (@p19, 'Fricción'), (@p19, 'Electricidad');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p19 AND texto = 'Gravedad') WHERE id = @p19;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el metal líquido a temperatura ambiente?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p20 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p20, 'Plomo'), (@p20, 'Mercurio'), (@p20, 'Estaño'), (@p20, 'Galio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p20 AND texto = 'Mercurio') WHERE id = @p20;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal puede regenerar sus extremidades?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p21 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p21, 'Lagartija'), (@p21, 'Estrella de mar'), (@p21, 'Salamandra'), (@p21, 'Todas las anteriores');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p21 AND texto = 'Todas las anteriores') WHERE id = @p21;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el gas más abundante en la atmósfera terrestre?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p22 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p22, 'Oxígeno'), (@p22, 'Nitrógeno'), (@p22, 'Dióxido de carbono'), (@p22, 'Hidrógeno');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p22 AND texto = 'Nitrógeno') WHERE id = @p22;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué órgano bombea la sangre en el cuerpo humano?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p23 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p23, 'Hígado'), (@p23, 'Corazón'), (@p23, 'Riñón'), (@p23, 'Pulmón');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p23 AND texto = 'Corazón') WHERE id = @p23;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién descubrió la penicilina?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p24 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p24, 'Louis Pasteur'), (@p24, 'Alexander Fleming'), (@p24, 'Robert Koch'), (@p24, 'Edward Jenner');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p24 AND texto = 'Alexander Fleming') WHERE id = @p24;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el animal más rápido del mundo en tierra?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p25 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p25, 'León'), (@p25, 'Guepardo'), (@p25, 'Caballo'), (@p25, 'Antílope');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p25 AND texto = 'Guepardo') WHERE id = @p25;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué capa de la Tierra es la más interna?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p26 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p26, 'Corteza'), (@p26, 'Manto'), (@p26, 'Núcleo'), (@p26, 'Litosfera');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p26 AND texto = 'Núcleo') WHERE id = @p26;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué vitamina se obtiene principalmente del sol?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p27 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p27, 'Vitamina A'), (@p27, 'Vitamina D'), (@p27, 'Vitamina C'), (@p27, 'Vitamina K');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p27 AND texto = 'Vitamina D') WHERE id = @p27;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el insecto que produce miel?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p28 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p28, 'Avispa'), (@p28, 'Abeja'), (@p28, 'Hormiga'), (@p28, 'Mariposa');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p28 AND texto = 'Abeja') WHERE id = @p28;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué científico formuló las leyes del movimiento y la gravedad universal?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p29 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p29, 'Galileo Galilei'), (@p29, 'Isaac Newton'), (@p29, 'Johannes Kepler'), (@p29, 'Nicolás Copérnico');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p29 AND texto = 'Isaac Newton') WHERE id = @p29;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el proceso por el cual el agua pasa de líquido a gas?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p30 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p30, 'Condensación'), (@p30, 'Evaporación'), (@p30, 'Solidificación'), (@p30, 'Sublimación');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p30 AND texto = 'Evaporación') WHERE id = @p30;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal es el más grande del océano?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p31 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p31, 'Tiburón blanco'), (@p31, 'Ballena azul'), (@p31, 'Calamar gigante'), (@p31, 'Orca');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p31 AND texto = 'Ballena azul') WHERE id = @p31;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué parte del cerebro controla el equilibrio?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p32 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p32, 'Cerebelo'), (@p32, 'Corteza cerebral'), (@p32, 'Hipotálamo'), (@p32, 'Bulbo raquídeo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p32 AND texto = 'Cerebelo') WHERE id = @p32;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el ave que no puede volar y es la más grande del mundo?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p33 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p33, 'Pingüino'), (@p33, 'Avestruz'), (@p33, 'Emú'), (@p33, 'Kiwi');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p33 AND texto = 'Avestruz') WHERE id = @p33;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué elemento es el más abundante en el universo?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p34 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p34, 'Oxígeno'), (@p34, 'Hidrógeno'), (@p34, 'Carbono'), (@p34, 'Helio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p34 AND texto = 'Hidrógeno') WHERE id = @p34;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de animal es un delfín?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p35 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p35, 'Pez'), (@p35, 'Mamífero'), (@p35, 'Reptil'), (@p35, 'Anfibio');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p35 AND texto = 'Mamífero') WHERE id = @p35;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos corazones tiene un pulpo?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p36 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p36, '1'), (@p36, '2'), (@p36, '3'), (@p36, '4');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p36 AND texto = '3') WHERE id = @p36;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué es el ADN?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p37 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p37, 'Una proteína'), (@p37, 'Material genético'), (@p37, 'Un tipo de célula'), (@p37, 'Una hormona');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p37 AND texto = 'Material genético') WHERE id = @p37;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la estrella más cercana a la Tierra?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p38 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p38, 'Alfa Centauri'), (@p38, 'El Sol'), (@p38, 'Sirio'), (@p38, 'Próxima Centauri');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p38 AND texto = 'El Sol') WHERE id = @p38;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de roca se forma a partir del enfriamiento de la lava?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p39 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p39, 'Sedimentaria'), (@p39, 'Ígnea'), (@p39, 'Metamórfica'), (@p39, 'Caliza');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p39 AND texto = 'Ígnea') WHERE id = @p39;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal cambia de color para camuflarse?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p40 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p40, 'Camaleón'), (@p40, 'Iguana'), (@p40, 'Cocodrilo'), (@p40, 'Serpiente');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p40 AND texto = 'Camaleón') WHERE id = @p40;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué glándula regula el metabolismo del cuerpo?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p41 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p41, 'Tiroides'), (@p41, 'Páncreas'), (@p41, 'Suprarrenal'), (@p41, 'Pituitaria');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p41 AND texto = 'Tiroides') WHERE id = @p41;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el satélite natural de la Tierra?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p42 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p42, 'Marte'), (@p42, 'La Luna'), (@p42, 'Venus'), (@p42, 'Titán');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p42 AND texto = 'La Luna') WHERE id = @p42;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué proceso usan las bacterias para reproducirse?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p43 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p43, 'Reproducción sexual'), (@p43, 'Fisión binaria'), (@p43, 'Meiosis'), (@p43, 'Gemación');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p43 AND texto = 'Fisión binaria') WHERE id = @p43;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el animal con el período de gestación más largo?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p44 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p44, 'Ballena azul'), (@p44, 'Elefante africano'), (@p44, 'Jirafa'), (@p44, 'Rinoceronte');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p44 AND texto = 'Elefante africano') WHERE id = @p44;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de energía produce un panel solar?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p45 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p45, 'Energía eólica'), (@p45, 'Energía solar (eléctrica)'), (@p45, 'Energía hidráulica'), (@p45, 'Energía geotérmica');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p45 AND texto = 'Energía solar (eléctrica)') WHERE id = @p45;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el pH del agua pura?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p46 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p46, '5'), (@p46, '7'), (@p46, '9'), (@p46, '12');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p46 AND texto = '7') WHERE id = @p46;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal es el símbolo de Australia junto con el koala?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p47 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p47, 'Canguro'), (@p47, 'Ornitorrinco'), (@p47, 'Dingo'), (@p47, 'Wombat');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p47 AND texto = 'Canguro') WHERE id = @p47;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué parte de la planta absorbe agua y nutrientes del suelo?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p48 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p48, 'Hojas'), (@p48, 'Raíces'), (@p48, 'Tallo'), (@p48, 'Flores');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p48 AND texto = 'Raíces') WHERE id = @p48;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Quién formuló la tabla periódica de los elementos?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p49 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p49, 'Antoine Lavoisier'), (@p49, 'Dmitri Mendeléiev'), (@p49, 'Marie Curie'), (@p49, 'John Dalton');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p49 AND texto = 'Dmitri Mendeléiev') WHERE id = @p49;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el reptil más grande del mundo?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p50 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p50, 'Cocodrilo marino'), (@p50, 'Anaconda'), (@p50, 'Komodo'), (@p50, 'Tortuga laúd');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p50 AND texto = 'Cocodrilo marino') WHERE id = @p50;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de estrella es el Sol?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p51 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p51, 'Gigante roja'), (@p51, 'Enana amarilla'), (@p51, 'Enana blanca'), (@p51, 'Supergigante azul');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p51 AND texto = 'Enana amarilla') WHERE id = @p51;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es el continente con más biodiversidad de animales?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p52 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p52, 'Asia'), (@p52, 'América del Sur'), (@p52, 'África'), (@p52, 'Oceanía');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p52 AND texto = 'América del Sur') WHERE id = @p52;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué órgano produce la insulina?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p53 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p53, 'Hígado'), (@p53, 'Páncreas'), (@p53, 'Riñón'), (@p53, 'Bazo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p53 AND texto = 'Páncreas') WHERE id = @p53;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal puede dormir con los ojos abiertos?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p54 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p54, 'Delfín'), (@p54, 'León'), (@p54, 'Pez'), (@p54, 'Caballo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p54 AND texto = 'Pez') WHERE id = @p54;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la capa de la atmósfera donde vivimos?', 'Ciencia y Naturaleza', 0.70, 'aprobada');
SET @p55 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p55, 'Estratosfera'), (@p55, 'Troposfera'), (@p55, 'Mesosfera'), (@p55, 'Termosfera');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p55 AND texto = 'Troposfera') WHERE id = @p55;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal tiene el cuello más largo en proporción a su cuerpo?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p56 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p56, 'Avestruz'), (@p56, 'Jirafa'), (@p56, 'Flamenco'), (@p56, 'Cisne');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p56 AND texto = 'Jirafa') WHERE id = @p56;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué es un eclipse solar?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p57 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p57, 'La Tierra se interpone entre el Sol y la Luna'), (@p57, 'La Luna se interpone entre el Sol y la Tierra'), (@p57, 'El Sol se apaga temporalmente'), (@p57, 'Un cometa pasa frente al Sol');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p57 AND texto = 'La Luna se interpone entre el Sol y la Tierra') WHERE id = @p57;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de planta es el cactus, adaptada a climas secos?', 'Ciencia y Naturaleza', 0.40, 'aprobada');
SET @p58 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p58, 'Suculenta'), (@p58, 'Coníferas'), (@p58, 'Helecho'), (@p58, 'Musgo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p58 AND texto = 'Suculenta') WHERE id = @p58;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuál es la temperatura de congelación del agua en grados Celsius?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p59 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p59, '0°C'), (@p59, '32°C'), (@p59, '-10°C'), (@p59, '100°C');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p59 AND texto = '0°C') WHERE id = @p59;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué animal es conocido por hibernar durante el invierno?', 'Ciencia y Naturaleza', 0.10, 'aprobada');
SET @p60 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p60, 'Oso'), (@p60, 'Lobo'), (@p60, 'Zorro'), (@p60, 'Ciervo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p60 AND texto = 'Oso') WHERE id = @p60;