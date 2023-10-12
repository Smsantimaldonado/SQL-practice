CREATE DATABASE Info_Tienda;

USE Info_Tienda;


CREATE TABLE Fabricantes
(
codigo INT PRIMARY KEY NOT NULL,
nombre VARCHAR (50),
direccion VARCHAR (50)
);

INSERT INTO Fabricantes (codigo, nombre, direccion)
VALUES (123, 'TECH', 'Av. Argentina 1025'),
	   (456, 'FOOD', 'Marin 26'),
	   (789, 'OTHER', 'Macarena 411');


CREATE TABLE Productos
(
codigo INT PRIMARY KEY NOT NULL,
nombre VARCHAR (50),
precio DECIMAL(10,3),
cod_fabricante INT,
CONSTRAINT FK FOREIGN KEY (cod_fabricante)
REFERENCES Fabricantes (codigo)
);

INSERT INTO Productos (codigo, nombre, precio, cod_fabricante)
VALUES (1, 'Celular', 1799.5, 123),
	   (2, 'Cafe', 154, 456),
	   (3, 'Billetera',326.25, 789),
	   (4, 'Botella', 112.5, 123),
	   (5, 'Lapicera', 10.49, 456),
	   (6, 'Mouse', 325, 789),
	   (7, 'Laptop', 2350.21, 123),
	   (8, 'Monitor', 1299.5, 456),
	   (9, 'Llave', 32.99, 789),
	   (10, 'Adorno', 19.99, 123);