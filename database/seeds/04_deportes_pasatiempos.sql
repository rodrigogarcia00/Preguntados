-- CATEGORIA: Deportes y Pasatiempos

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores tiene un equipo de fútbol en la cancha?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p1 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p1, '9'), (@p1, '10'), (@p1, '11'), (@p1, '12');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p1 AND texto = '11') WHERE id = @p1;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cada cuántos años se celebran los Juegos Olímpicos de verano?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p2 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p2, '2 años'), (@p2, '4 años'), (@p2, '5 años'), (@p2, '6 años');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p2 AND texto = '4 años') WHERE id = @p2;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país ganó el Mundial de fútbol de Qatar 2022?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p3 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p3, 'Francia'), (@p3, 'Argentina'), (@p3, 'Brasil'), (@p3, 'Croacia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p3 AND texto = 'Argentina') WHERE id = @p3;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se usa un "birdie" o pajarito?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p4 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p4, 'Tenis'), (@p4, 'Bádminton'), (@p4, 'Golf'), (@p4, 'Squash');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p4 AND texto = 'Bádminton') WHERE id = @p4;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos puntos vale un touchdown en fútbol americano?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p5 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p5, '3'), (@p5, '6'), (@p5, '7'), (@p5, '10');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p5 AND texto = '6') WHERE id = @p5;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tenista ganó más títulos de Grand Slam en la historia masculina hasta 2024?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p6 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p6, 'Roger Federer'), (@p6, 'Rafael Nadal'), (@p6, 'Novak Djokovic'), (@p6, 'Andy Murray');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p6 AND texto = 'Novak Djokovic') WHERE id = @p6;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos sets como máximo se juegan en un partido de tenis masculino de Grand Slam?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p7 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p7, '3'), (@p7, '5'), (@p7, '7'), (@p7, '9');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p7 AND texto = '5') WHERE id = @p7;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se utiliza un "home run"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p8 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p8, 'Béisbol'), (@p8, 'Cricket'), (@p8, 'Sóftbol'), (@p8, 'Rugby');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p8 AND texto = 'Béisbol') WHERE id = @p8;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué jugador es considerado el máximo goleador histórico de la Champions League?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p9 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p9, 'Lionel Messi'), (@p9, 'Cristiano Ronaldo'), (@p9, 'Robert Lewandowski'), (@p9, 'Karim Benzema');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p9 AND texto = 'Cristiano Ronaldo') WHERE id = @p9;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos aros tiene el símbolo olímpico?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p10 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p10, '4'), (@p10, '5'), (@p10, '6'), (@p10, '7');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p10 AND texto = '5') WHERE id = @p10;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué país se originó el judo?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p11 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p11, 'China'), (@p11, 'Japón'), (@p11, 'Corea del Sur'), (@p11, 'Tailandia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p11 AND texto = 'Japón') WHERE id = @p11;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores forman un equipo de básquetbol en la cancha?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p12 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p12, '4'), (@p12, '5'), (@p12, '6'), (@p12, '7');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p12 AND texto = '5') WHERE id = @p12;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué equipo ha ganado más veces la Champions League?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p13 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p13, 'Barcelona'), (@p13, 'Real Madrid'), (@p13, 'AC Milan'), (@p13, 'Liverpool');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p13 AND texto = 'Real Madrid') WHERE id = @p13;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se usa el término "jaque mate"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p14 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p14, 'Damas'), (@p14, 'Ajedrez'), (@p14, 'Backgammon'), (@p14, 'Go');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p14 AND texto = 'Ajedrez') WHERE id = @p14;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos hoyos tiene una vuelta completa de golf?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p15 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p15, '9'), (@p15, '18'), (@p15, '21'), (@p15, '27');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p15 AND texto = '18') WHERE id = @p15;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país ganó más Copas del Mundo de fútbol en la historia?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p16 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p16, 'Argentina'), (@p16, 'Brasil'), (@p16, 'Alemania'), (@p16, 'Italia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p16 AND texto = 'Brasil') WHERE id = @p16;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se compite en una piscina con estilo mariposa?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p17 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p17, 'Buceo'), (@p17, 'Natación'), (@p17, 'Polo acuático'), (@p17, 'Surf');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p17 AND texto = 'Natación') WHERE id = @p17;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué boxeador es conocido como "El más grande" (The Greatest)?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p18 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p18, 'Mike Tyson'), (@p18, 'Muhammad Ali'), (@p18, 'Floyd Mayweather'), (@p18, 'George Foreman');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p18 AND texto = 'Muhammad Ali') WHERE id = @p18;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos sets se necesitan para ganar un partido de vóley?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p19 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p19, '2'), (@p19, '3'), (@p19, '4'), (@p19, '5');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p19 AND texto = '3') WHERE id = @p19;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué piloto ganó más campeonatos mundiales de Fórmula 1?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p20 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p20, 'Ayrton Senna'), (@p20, 'Michael Schumacher'), (@p20, 'Lewis Hamilton'), (@p20, 'Max Verstappen');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p20 AND texto = 'Lewis Hamilton') WHERE id = @p20;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué juego de mesa se usan fichas llamadas "peones, torres, alfiles"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p21 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p21, 'Damas'), (@p21, 'Ajedrez'), (@p21, 'Monopoly'), (@p21, 'Risk');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p21 AND texto = 'Ajedrez') WHERE id = @p21;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país organizó los Juegos Olímpicos de 2024?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p22 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p22, 'Japón'), (@p22, 'Francia'), (@p22, 'Estados Unidos'), (@p22, 'China');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p22 AND texto = 'Francia') WHERE id = @p22;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores tiene un equipo de rugby en el campo?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p23 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p23, '11'), (@p23, '13'), (@p23, '15'), (@p23, '17');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p23 AND texto = '15') WHERE id = @p23;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte se juega en Wimbledon?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p24 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p24, 'Golf'), (@p24, 'Tenis'), (@p24, 'Críquet'), (@p24, 'Bádminton');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p24 AND texto = 'Tenis') WHERE id = @p24;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué nadador ganó 8 medallas de oro en una sola edición olímpica (Pekín 2008)?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p25 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p25, 'Ian Thorpe'), (@p25, 'Michael Phelps'), (@p25, 'Ryan Lochte'), (@p25, 'Caeleb Dressel');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p25 AND texto = 'Michael Phelps') WHERE id = @p25;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se utiliza el término "knockout"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p26 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p26, 'Lucha libre'), (@p26, 'Boxeo'), (@p26, 'Karate'), (@p26, 'Esgrima');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p26 AND texto = 'Boxeo') WHERE id = @p26;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos puntos vale un gol de campo en básquet desde fuera de la línea de 3?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p27 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p27, '1'), (@p27, '2'), (@p27, '3'), (@p27, '4');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p27 AND texto = '3') WHERE id = @p27;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué equipo de la NBA ganó más campeonatos en la historia?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p28 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p28, 'Los Angeles Lakers'), (@p28, 'Boston Celtics'), (@p28, 'Chicago Bulls'), (@p28, 'Golden State Warriors');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p28 AND texto = 'Boston Celtics') WHERE id = @p28;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte se practica en una pista helada con patines y un disco?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p29 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p29, 'Curling'), (@p29, 'Hockey sobre hielo'), (@p29, 'Patinaje artístico'), (@p29, 'Bobsleigh');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p29 AND texto = 'Hockey sobre hielo') WHERE id = @p29;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué país se inventó el fútbol moderno con reglas escritas?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p30 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p30, 'España'), (@p30, 'Inglaterra'), (@p30, 'Brasil'), (@p30, 'Italia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p30 AND texto = 'Inglaterra') WHERE id = @p30;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué jugador es conocido como "La Pulga" en el fútbol?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p31 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p31, 'Cristiano Ronaldo'), (@p31, 'Lionel Messi'), (@p31, 'Neymar'), (@p31, 'Kylian Mbappé');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p31 AND texto = 'Lionel Messi') WHERE id = @p31;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos minutos dura un partido de fútbol (tiempo reglamentario)?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p32 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p32, '60'), (@p32, '90'), (@p32, '100'), (@p32, '120');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p32 AND texto = '90') WHERE id = @p32;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte de raqueta se juega con una pelota pequeña en una mesa?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p33 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p33, 'Squash'), (@p33, 'Tenis de mesa'), (@p33, 'Pádel'), (@p33, 'Frontón');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p33 AND texto = 'Tenis de mesa') WHERE id = @p33;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país ha ganado más medallas olímpicas en la historia?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p34 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p34, 'Rusia'), (@p34, 'Estados Unidos'), (@p34, 'China'), (@p34, 'Alemania');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p34 AND texto = 'Estados Unidos') WHERE id = @p34;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se usa el término "ace"?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p35 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p35, 'Vóley'), (@p35, 'Tenis'), (@p35, 'Golf'), (@p35, 'Bádminton');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p35 AND texto = 'Tenis') WHERE id = @p35;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores hay en un equipo de béisbol en el campo?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p36 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p36, '7'), (@p36, '9'), (@p36, '11'), (@p36, '13');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p36 AND texto = '9') WHERE id = @p36;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué ciclista ganó más Tours de Francia antes de ser descalificado por dopaje?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p37 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p37, 'Eddy Merckx'), (@p37, 'Lance Armstrong'), (@p37, 'Miguel Indurain'), (@p37, 'Chris Froome');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p37 AND texto = 'Lance Armstrong') WHERE id = @p37;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte se asocia con el término "hoyo en uno"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p38 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p38, 'Tenis'), (@p38, 'Golf'), (@p38, 'Billar'), (@p38, 'Bowling');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p38 AND texto = 'Golf') WHERE id = @p38;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué ciudad se disputó la primera Copa del Mundo de fútbol en 1930?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p39 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p39, 'Buenos Aires'), (@p39, 'Montevideo'), (@p39, 'Río de Janeiro'), (@p39, 'Santiago');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p39 AND texto = 'Montevideo') WHERE id = @p39;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores integran un equipo de vóley en cancha?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p40 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p40, '5'), (@p40, '6'), (@p40, '7'), (@p40, '8');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p40 AND texto = '6') WHERE id = @p40;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte practicaba el "Death Race" o carrera de la muerte en la antigua Roma?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p41 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p41, 'Lucha de gladiadores'), (@p41, 'Carreras de cuadrigas'), (@p41, 'Juegos olímpicos griegos'), (@p41, 'Combate naval');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p41 AND texto = 'Carreras de cuadrigas') WHERE id = @p41;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué selección de fútbol es conocida como "la Albiceleste"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p42 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p42, 'Uruguay'), (@p42, 'Argentina'), (@p42, 'Chile'), (@p42, 'Paraguay');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p42 AND texto = 'Argentina') WHERE id = @p42;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué número usa tradicionalmente el arquero en el fútbol?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p43 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p43, '1'), (@p43, '5'), (@p43, '9'), (@p43, '10');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p43 AND texto = '1') WHERE id = @p43;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte se juega en Roland Garros?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p44 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p44, 'Golf'), (@p44, 'Tenis'), (@p44, 'Fútbol'), (@p44, 'Rugby');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p44 AND texto = 'Tenis') WHERE id = @p44;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos anillos olímpicos representan los continentes participantes?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p45 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p45, '4'), (@p45, '5'), (@p45, '6'), (@p45, '7');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p45 AND texto = '5') WHERE id = @p45;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué jugador de básquet es apodado "Air Jordan"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p46 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p46, 'Kobe Bryant'), (@p46, 'Michael Jordan'), (@p46, 'LeBron James'), (@p46, 'Magic Johnson');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p46 AND texto = 'Michael Jordan') WHERE id = @p46;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿En qué deporte se usa el término "strike"?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p47 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p47, 'Bowling'), (@p47, 'Tenis'), (@p47, 'Golf'), (@p47, 'Fútbol');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p47 AND texto = 'Bowling') WHERE id = @p47;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país es conocido por dominar el rugby con el equipo "Los Pumas"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p48 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p48, 'Chile'), (@p48, 'Argentina'), (@p48, 'Uruguay'), (@p48, 'Brasil');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p48 AND texto = 'Argentina') WHERE id = @p48;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Cuántos jugadores tiene un equipo de hockey sobre hielo en pista?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p49 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p49, '5'), (@p49, '6'), (@p49, '7'), (@p49, '8');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p49 AND texto = '6') WHERE id = @p49;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué jugador de fútbol fue apodado "El Pibe de Oro"?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p50 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p50, 'Lionel Messi'), (@p50, 'Diego Maradona'), (@p50, 'Pelé'), (@p50, 'Gabriel Batistuta');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p50 AND texto = 'Diego Maradona') WHERE id = @p50;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué tipo de pieza de ajedrez puede moverse en forma de "L"?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p51 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p51, 'Torre'), (@p51, 'Caballo'), (@p51, 'Alfil'), (@p51, 'Reina');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p51 AND texto = 'Caballo') WHERE id = @p51;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué país ganó la última Copa Mundial de Rugby antes de 2024 (2023)?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p52 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p52, 'Nueva Zelanda'), (@p52, 'Sudáfrica'), (@p52, 'Inglaterra'), (@p52, 'Francia');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p52 AND texto = 'Sudáfrica') WHERE id = @p52;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte combina natación, ciclismo y carrera a pie?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p53 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p53, 'Decatlón'), (@p53, 'Triatlón'), (@p53, 'Pentatlón'), (@p53, 'Heptatlón');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p53 AND texto = 'Triatlón') WHERE id = @p53;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué cantidad de jugadores se necesitan para iniciar un partido de pádel?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p54 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p54, '2'), (@p54, '3'), (@p54, '4'), (@p54, '6');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p54 AND texto = '4') WHERE id = @p54;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué corredor jamaiquino es el hombre más rápido de la historia en 100 metros?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p55 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p55, 'Usain Bolt'), (@p55, 'Tyson Gay'), (@p55, 'Yohan Blake'), (@p55, 'Justin Gatlin');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p55 AND texto = 'Usain Bolt') WHERE id = @p55;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué se utiliza para anotar puntos en el cricket?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p56 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p56, 'Goles'), (@p56, 'Runs (carreras)'), (@p56, 'Sets'), (@p56, 'Innings completos');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p56 AND texto = 'Runs (carreras)') WHERE id = @p56;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué club brasileño es el club con más títulos de Copa Libertadores junto a otros?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p57 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p57, 'Flamengo'), (@p57, 'São Paulo'), (@p57, 'Boca Juniors'), (@p57, 'Independiente');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p57 AND texto = 'Independiente') WHERE id = @p57;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué pasatiempo consiste en armar piezas pequeñas para formar una imagen?', 'Deportes y Pasatiempos', 0.10, 'aprobada');
SET @p58 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p58, 'Sudoku'), (@p58, 'Rompecabezas (puzzle)'), (@p58, 'Crucigrama'), (@p58, 'Solitario');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p58 AND texto = 'Rompecabezas (puzzle)') WHERE id = @p58;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué deporte de combate japonés se centra en lanzamientos y técnicas de suelo?', 'Deportes y Pasatiempos', 0.70, 'aprobada');
SET @p59 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p59, 'Karate'), (@p59, 'Judo'), (@p59, 'Kendo'), (@p59, 'Sumo');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p59 AND texto = 'Judo') WHERE id = @p59;

INSERT INTO preguntas (enunciado, categoria, nivel, estado) VALUES ('¿Qué número de camiseta usó habitualmente Pelé?', 'Deportes y Pasatiempos', 0.40, 'aprobada');
SET @p60 = LAST_INSERT_ID();
INSERT INTO respuestas (pregunta_id, texto) VALUES (@p60, '7'), (@p60, '9'), (@p60, '10'), (@p60, '11');
UPDATE preguntas SET respuesta_correcta_id = (SELECT id FROM respuestas WHERE pregunta_id = @p60 AND texto = '10') WHERE id = @p60;