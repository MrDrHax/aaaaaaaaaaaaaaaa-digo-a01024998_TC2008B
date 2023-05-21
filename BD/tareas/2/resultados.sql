-- Active: 1681846904940@@127.0.0.1@3306@Tarea2


-- Apellidos y nombre de los participantes de nacionalidad mexicana.

SELECT nombre FROM `DEPORTISTA`
WHERE `idPais` = (SELECT id FROM `PAIS` WHERE PAIS.nombre LIKE "MEX" limit 1);

-- Apellidos, nombre y puntos acumulados de los participantes de USA.

SELECT D.nombre, SUM(C.rango) AS PUNTOS_ACUMULADOS
FROM DEPORTISTA AS D
JOIN CLASIFICACION AS C ON C.idDeportista = D.matricula
WHERE D.idPais = (SELECT id FROM PAIS WHERE nombre LIKE 'USA' LIMIT 1)
GROUP BY D.matricula;

-- Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.

SELECT DISTINCT nombre FROM `DEPORTISTA` WHERE matricula IN (SELECT DISTINCT `idDeportistaOro` FROM `RESULTADO` );

-- Nombre de las competencias en las que intervinieron los participantes mexicanos.

SELECT diciplina AS COMPETENCIAS_PARTICIPANTES FROM `DISCIPLINA` WHERE id IN
    (SELECT DISTINCT `idDisiplina` FROM `PRUEBA` WHERE id IN
        (SELECT DISTINCT `idPrueba` FROM `CLASIFICACION` where `idDeportista` IN
            (SELECT matricula FROM `DEPORTISTA` WHERE `idPais` = 
                (SELECT id FROM `PAIS` WHERE PAIS.nombre LIKE "MEX" limit 1))));

-- Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.

SELECT DISTINCT nombre FROM `DEPORTISTA` WHERE matricula NOT IN (SELECT DISTINCT `idDeportistaOro` FROM `RESULTADO` );
-- NOTA: parece ser que tengo tantas disciplinas que es muy posible que todos ganen sin querer uno... 

-- Apellidos y nombre de los participantes siempre se clasificaron en alguna competencia.

SELECT DISTINCT nombre FROM `DEPORTISTA` WHERE matricula IN (SELECT DISTINCT `idDeportistaOro` FROM `RESULTADO` ) OR 
matricula IN (SELECT DISTINCT `idDeportistaPlata` FROM `RESULTADO` ) OR
matricula IN (SELECT DISTINCT `idDeportistaBronce` FROM `RESULTADO` );


-- Nombre de la competencia que aporta el máximo de puntos. 

SELECT D.diciplina AS MAXIMOS_PUNTOS from `DISCIPLINA` AS D
where id IN (
    SELECT `idDisiplina` FROM `PRUEBA`
    WHERE id IN (
        SELECT `idPrueba` FROM `CLASIFICACION` AS C2 where C2.rango = (
            SELECT MAX(C.rango) FROM `CLASIFICACION` AS C LIMIT 1) 
        )
    );

-- Países (nacionalidades) que participaron en todas las competencias.

SELECT PP.nombre
FROM (
    SELECT mix, id
    FROM (
        SELECT CONCAT(P.id, ',', PR.idDisiplina) AS mix, P.id, PR.idDisiplina
        FROM CLASIFICACION AS C
        INNER JOIN DEPORTISTA AS D ON D.matricula = C.idDeportista
        INNER JOIN PAIS AS P ON D.idPais = P.id
        INNER JOIN PRUEBA AS PR ON C.idPrueba = PR.id
    ) AS A
    GROUP BY mix, id
) AS AA
INNER JOIN PAIS AS PP ON AA.id = PP.id
GROUP BY AA.id
HAVING COUNT(*) >= (SELECT COUNT(DISTINCT diciplina) FROM DISCIPLINA);

-- Porpongan una consulta que involucre una sola tabla con alguna funcion como MIN, AVG --- Nueva consulta

-- El usuario que consigue los minimos puntos lugar XD 

SELECT nombre AS PERDEDOR
FROM (
    SELECT D.nombre, SUM(C.rango) AS PUNTOS_ACUMULADOS
    FROM DEPORTISTA AS D
    JOIN CLASIFICACION AS C ON C.idDeportista = D.matricula
    GROUP BY D.matricula
) AS R
WHERE PUNTOS_ACUMULADOS = (
    SELECT MIN(PUNTOS_ACUMULADOS)
    FROM (
        SELECT SUM(C.rango) AS PUNTOS_ACUMULADOS
        FROM DEPORTISTA AS D
        JOIN CLASIFICACION AS C ON C.idDeportista = D.matricula
        GROUP BY D.matricula
    ) AS subquery
);

-- Porpongan una consulta que involucre dos tabla con GROUP BY --- Nueva consulta

-- La lista de participantes por país (nota que este puede ser un store procedure para actualizar la cantidad, solo falta un where)

SELECT DISTINCT P.nombre, COUNT(D.matricula) FROM `DEPORTISTA` AS D LEFT JOIN `PAIS` AS P ON P.id = D.`idPais`
GROUP BY P.id;

-- Porpongan una consulta que involucre tres tablas con las sentencias LEFT JOIN, ORDER BY, GROUP BY Y LIMIT--- Nueva consulta

-- La lista de los primeros 3 lugares que consiguieron el mayor numero de puntos
SELECT DISTINCT P.nombre, COUNT(D.matricula) FROM `DEPORTISTA` AS D LEFT JOIN `PAIS` AS P ON P.id = D.`idPais`
GROUP BY P.id;

-- Porpongan una consulta que involucre tres tablas con las sentencias INNER JOIN y LIKE

-- los deportistas que llegaron a las pruebas finales y donde y cuando compiten
SELECT nombre, fecha, lugar FROM `CLASIFICACION` AS C
INNER JOIN `DEPORTISTA` AS D ON `idDeportista` LIKE matricula
INNER JOIN `PRUEBA` AS P ON `idPrueba` = P.id
WHERE P.naturaleza LIKE 'final'