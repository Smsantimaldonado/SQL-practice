CREATE DATABASE Club_de_deportes;
USE Club_de_deportes;

CREATE TABLE deportes
(
codigo INT PRIMARY KEY NOT NULL,
nombre VARCHAR (30),
es_grupal BIT
);

ALTER TABLE deportes
ALTER COLUMN nombre
VARCHAR (25);

INSERT INTO deportes (codigo, nombre, es_grupal)
VALUES (1, 'TENIS', 0), (2, 'BASQUET', 1), (3, 'FUTBOL', 1);


CREATE TABLE socios
(
num_socio INT PRIMARY KEY NOT NULL,
nombre VARCHAR (45),
apellido VARCHAR (45),
dni VARCHAR (15),
deporte INT,
CONSTRAINT FK FOREIGN KEY (deporte)
REFERENCES deportes (codigo)
);

INSERT INTO socios (num_socio, nombre, apellido, dni, deporte)
VALUES (1, 'Lusina', 'TodoCode', '12345678', 1),
	   (2, 'Santiago', 'Maldonado', '32165487', 2),
	   (3, 'Zlatan', 'Ibrahimovic', '12369874', 3),
	   (4, 'Cristiano', 'Ronaldo', '20333698', 3),
	   (5, 'Raul', 'Gonzalez', '22000102', 3),
	   (6, 'Lebron', 'James', '12456789', 2),
	   (7, 'Michael', 'Jordan', '10444548', 2),
	   (8, 'Novak', 'Djokovic', '32556987', 1),
	   (9, 'Rafael', 'Nadal', '35669853', 1),
	   (10, 'Roger', 'Federer', '34827930', 1);