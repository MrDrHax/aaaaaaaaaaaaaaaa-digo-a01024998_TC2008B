-- Active: 1681846904940@@127.0.0.1@3306@Tarea2

-- Si existe la BD se elimina
DROP DATABASE IF EXISTS Tarea2;

-- Se crea la base de datos
CREATE DATABASE Tarea2
    DEFAULT CHARACTER SET = 'utf16';

USE Tarea2;

-- Se definen las tablas
CREATE TABLE PAIS
(
    id INT NOT NUll AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(3) NOT NULL,
    numParticipantes int NOT NULL,
    numMedallas int NOT NULL
) ENGINE = InnoDB;

CREATE TABLE DEPORTISTA
(
    matricula VARCHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    idPais INT NOT NULL,
    FOREIGN KEY (idPais) REFERENCES PAIS(id)
) ENGINE=InnoDB;

CREATE TABLE DISCIPLINA
(
    id INT NOT NUll AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    diciplina VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE PRUEBA
(
    id INT NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idDisiplina INT NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(50) NOT NULL,
    numeroDeportistasInscritos INT NOT NULL,
    naturaleza VARCHAR(10) NOT NULL,
    FOREIGN KEY (idDisiplina) REFERENCES DISCIPLINA(id)
) ENGINE=InnoDB;

CREATE TABLE CLASIFICACION
(
    id INT NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idPrueba INT NOT NULL,
    idDeportista varchar(5) NOT NULL,
    rango INT NOT NULL,
    FOREIGN KEY (idPrueba) REFERENCES PRUEBA(id),
    FOREIGN KEY (idDeportista) REFERENCES DEPORTISTA(matricula)
) ENGINE=InnoDB;

CREATE TABLE RESULTADO
(
    id INT NOT NUll AUTO_INCREMENT PRIMARY KEY,
    idDisiplina INT NOT NULL,
    idDeportistaOro VARCHAR(5) NOT NULL,
    idDeportistaPlata VARCHAR(5) NOT NULL,
    idDeportistaBronce VARCHAR(5) NOT NULL,
    FOREIGN KEY (idDisiplina) REFERENCES DISCIPLINA(id),
    FOREIGN KEY (idDeportistaOro) REFERENCES DEPORTISTA(matricula),
    FOREIGN KEY (idDeportistaPlata) REFERENCES DEPORTISTA(matricula),
    FOREIGN KEY (idDeportistaBronce) REFERENCES DEPORTISTA(matricula)
) ENGINE=InnoDB;

-- llenado paises

INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('MEX', 3, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('USA', 2, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('CAN', 4, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('ARG', 9, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('PER', 1, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('GER', 3, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('FRA', 6, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('BRZ', 9, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('YNC', 7, -1);
INSERT INTO PAIS (nombre, numParticipantes, numMedallas) VALUES ('CHI', 1, -1);

-- llenado deportistas
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('MEX01', 'Juan Perez', 'M', 1);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('MEX02', 'Maria Lopez', 'F', 1);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('MEX03', 'Pedro Sanchez', 'M', 1);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('USA01', 'John Smith', 'M', 2);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('USA02', 'Jane Doe', 'F', 2);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('CAN01', 'Jean Tremblay', 'M', 3);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('CAN02', 'Marie Tremblay', 'F', 3);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('CAN03', 'Pierre Tremblay', 'M', 3);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('CAN04', 'Paul Tremblay', 'M', 3);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG01', 'Juan Perez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG02', 'Maria Lopez', 'F', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG03', 'Pedro Sanchez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG04', 'Juan Perez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG05', 'Maria Lopez', 'F', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG06', 'Pedro Sanchez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG07', 'Juan Perez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG08', 'Maria Lopez', 'F', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('ARG09', 'Pedro Sanchez', 'M', 4);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('PER01', 'Juan Perez', 'M', 5);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('GER01', 'Maria Lopez', 'F', 6);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('GER02', 'Pedro Sanchez', 'M', 6);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('GER03', 'Juan Perez', 'M', 6);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA01', 'Maria Lopez', 'F', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA02', 'Pedro Sanchez', 'M', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA03', 'Juan Perez', 'M', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA04', 'Maria Lopez', 'F', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA05', 'Pedro Sanchez', 'M', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('FRA07', 'Juan Perez', 'M', 7);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ01', 'Maria Lopez', 'F', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ02', 'Pedro Sanchez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ03', 'Juan Perez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ04', 'Maria Lopez', 'F', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ05', 'Pedro Sanchez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ06', 'Juan Perez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ07', 'Maria Lopez', 'F', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ08', 'Pedro Sanchez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('BRZ09', 'Juan Perez', 'M', 8);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC01', 'Juan Perez', 'M', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC02', 'Maria Lopez', 'F', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC03', 'Pedro Sanchez', 'M', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC04', 'Juan Perez', 'M', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC05', 'Maria Lopez', 'F', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC06', 'Pedro Sanchez', 'M', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('YNC07', 'Juan Perez', 'M', 9);
INSERT INTO DEPORTISTA (matricula, nombre, sexo, idPais) VALUES ('CHI01', 'Maria Lopez', 'F', 10);

-- llenado diciplina
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Atletismo', 'Prueba salto largo');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Atletismo', 'Prueba salto corto');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Atletismo', 'Prueba sprint 100m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Natación', 'Prueba sprint 100m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Natación', 'Prueba sprint 200m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Natación', 'Prueba sprint 300m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Salto', 'Prueba 4m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Salto', 'Prueba 6m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Salto', 'Prueba 8m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Salto', 'Prueba 10m');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Baile', 'Vallet');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Baile', 'Danza aerea');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Gimnasia', 'Belleza');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Gimnasia', 'Barras');
INSERT INTO DISCIPLINA (nombre, diciplina) VALUES ('Gimnasia', 'Libre');

-- llenado de prueba
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (1, '2023-6-1', 'gym 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (1, '2023-6-1', 'gym 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (1, '2023-6-1', 'gym 3', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (1, '2023-6-2', 'gym 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (2, '2023-6-2', 'gym 2', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (2, '2023-6-2', 'gym 3', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (2, '2023-6-2', 'gym 1', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (2, '2023-6-3', 'gym 2', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (3, '2023-6-3', 'gym 3', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (3, '2023-6-3', 'gym 1', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (3, '2023-6-3', 'gym 2', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (3, '2023-6-4', 'gym 3', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (4, '2023-6-1', 'pool 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (4, '2023-6-1', 'pool 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (4, '2023-6-1', 'pool 3', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (4, '2023-6-2', 'pool 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (5, '2023-6-2', 'pool 2', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (5, '2023-6-2', 'pool 3', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (5, '2023-6-2', 'pool 1', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (5, '2023-6-3', 'pool 2', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (6, '2023-6-3', 'pool 3', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (6, '2023-6-3', 'pool 1', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (6, '2023-6-3', 'pool 2', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (6, '2023-6-4', 'pool 3', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (7, '2023-6-1', 'aire 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (7, '2023-6-1', 'aire 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (7, '2023-6-1', 'aire 3', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (7, '2023-6-2', 'aire 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (8, '2023-6-2', 'aire 2', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (8, '2023-6-2', 'aire 3', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (8, '2023-6-2', 'aire 1', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (8, '2023-6-3', 'aire 2', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (9, '2023-6-3', 'aire 3', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (9, '2023-6-3', 'aire 1', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (9, '2023-6-3', 'aire 2', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (9, '2023-6-4', 'aire 3', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (10, '2023-6-4', 'tierra 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (10, '2023-6-4', 'tierra 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (10, '2023-6-5', 'tierra 3', -1, 'elimina003');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (10, '2023-6-5', 'tierra 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (11, '2023-6-5', 'salon 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (11, '2023-6-5', 'salon 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (11, '2023-6-6', 'salon 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (12, '2023-6-5', 'salon 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (12, '2023-6-5', 'salon 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (12, '2023-6-6', 'salon 2', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (13, '2023-6-6', 'GYM 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (13, '2023-6-6', 'GYM 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (13, '2023-6-7', 'GYM 1', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (14, '2023-6-6', 'GYM 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (14, '2023-6-6', 'GYM 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (14, '2023-6-7', 'GYM 2', -1, 'final');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (15, '2023-6-7', 'GYM 1', -1, 'elimina001');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (15, '2023-6-7', 'GYM 2', -1, 'elimina002');
INSERT INTO PRUEBA (idDisiplina, fecha, lugar, numeroDeportistasInscritos, naturaleza) VALUES (15, '2023-6-8', 'GYM 1', -1, 'final');

-- ya me canse, las ultimas 2:

-- CLASIFICACION table
INSERT INTO CLASIFICACION (idPrueba, idDeportista, rango)
SELECT PRUEBA.id, matricula, ROUND(RAND() * 10) + 1
FROM `PRUEBA` CROSS JOIN `DEPORTISTA`
WHERE PRUEBA.naturaleza like 'final'
ORDER BY RAND() LIMIT 400;

-- RESULTADO table
INSERT INTO RESULTADO (idDisiplina, idDeportistaOro, idDeportistaPlata, idDeportistaBronce)
SELECT idDisiplina,
    (SELECT matricula FROM DEPORTISTA ORDER BY RAND() LIMIT 1),
    (SELECT matricula FROM DEPORTISTA ORDER BY RAND() LIMIT 1),
    (SELECT matricula FROM DEPORTISTA ORDER BY RAND() LIMIT 1)
FROM PRUEBA, DISCIPLINA, DEPORTISTA
WHERE PRUEBA.idDisiplina = DISCIPLINA.id
    AND PRUEBA.naturaleza = 'final'
ORDER BY PRUEBA.id;

