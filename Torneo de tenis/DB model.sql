CREATE DATABASE torneo_tenis;
USE torneo_tenis;

CREATE TABLE categorias
(
id_categoria INT IDENTITY PRIMARY KEY NOT NULL,
nombre VARCHAR (50),
edad_min INT,
edad_max INT,
sexo VARCHAR (1)
);
INSERT INTO categorias (nombre, edad_min, edad_max, sexo)
VALUES ('Damas A', 18, 34, 'F'),
	   ('Damas B', 35, 45, 'F'),
	   ('Damas C', 46, 100, 'F'),
	   ('Caballeros A', 18, 34, 'M'),
	   ('Caballeros B', 35, 50, 'M'),
	   ('Caballeros C', 51, 100, 'M'),
	   ('Juveniles Varones', 13, 17, 'M'),
	   ('Juveniles Mujeres', 13, 17, 'F');

CREATE TABLE participantes
(
id_participante INT IDENTITY PRIMARY KEY NOT NULL,
dni_participante VARCHAR(15),
apellido VARCHAR (50),
nombre VARCHAR (50),
direccion VARCHAR (50),
edad INT,
telefono VARCHAR (15),
sexo VARCHAR (1)
);
INSERT INTO participantes (dni_participante, apellido, nombre, direccion, edad, telefono, sexo)
VALUES
  ('123456789', 'González', 'María', 'Calle 123', 30, '555-1234', 'F'),
  ('987654321', 'Rodríguez', 'Juan', 'Avenida Principal', 25, '555-5678', 'M'),
  ('456789123', 'Martínez', 'Sofía', 'Calle Central', 28, '555-9012', 'F'),
  ('789123456', 'López', 'Pedro', 'Avenida Secundaria', 22, '555-3456', 'M'),
  ('654321987', 'Fernández', 'Laura', 'Calle 456', 35, '555-7890', 'F'),
  ('321987654', 'Gómez', 'Carlos', 'Avenida 789', 40, '555-2345', 'M'),
  ('234567890', 'Pérez', 'Ana', 'Calle 567', 27, '555-6789', 'F'),
  ('567890123', 'Sánchez', 'Luis', 'Avenida 1234', 32, '555-0123', 'M'),
  ('890123456', 'Ramírez', 'Isabel', 'Calle 890', 29, '555-4567', 'F'),
  ('678901234', 'Díaz', 'Diego', 'Avenida 234', 26, '555-8901', 'M'),
  ('345678901', 'Torres', 'Elena', 'Calle 345', 31, '555-2345', 'F'),
  ('456789012', 'Vargas', 'Javier', 'Avenida 456', 24, '555-6789', 'M'),
  ('123012301', 'Rojas', 'Gabriela', 'Calle 1230', 33, '555-0123', 'F'),
  ('789012345', 'Silva', 'Hernán', 'Avenida 7890', 36, '555-4567', 'M'),
  ('567890123', 'Molina', 'Lucía', 'Calle 567', 23, '555-8901', 'F'),
  ('234567890', 'Peralta', 'Raúl', 'Avenida 234', 38, '555-2345', 'M'),
  ('345678901', 'Gutiérrez', 'Carolina', 'Calle 345', 21, '555-6789', 'F'),
  ('456789012', 'Ortega', 'Roberto', 'Avenida 456', 34, '555-0123', 'M'),
  ('123012301', 'Castro', 'Marcela', 'Calle 1230', 37, '555-4567', 'F'),
  ('789012345', 'Figueroa', 'Andrés', 'Avenida 7890', 20, '555-8901', 'M');

CREATE TABLE inscripciones
(
num_inscripcion INT IDENTITY PRIMARY KEY NOT NULL,
fecha_insc DATE,
abono_insc BIT,
fk_categoria INT,
fk_participante INT,
CONSTRAINT FK FOREIGN KEY (fk_categoria)
REFERENCES categorias (id_categoria),
CONSTRAINT FK_2 FOREIGN KEY (fk_participante)
REFERENCES participantes (id_participante)
);
INSERT INTO inscripciones (fecha_insc, abono_insc, fk_categoria, fk_participante)
VALUES
  ('2023-10-15', 1, 1, 1),
  ('2023-10-05', 1, 4, 2),
  ('2023-10-06', 0, 1, 3),
  ('2023-10-25', 1, 4, 4),
  ('2023-10-04', 1, 2, 5),
  ('2023-10-02', 0, 5, 6),
  ('2023-10-21', 1, 1, 7),
  ('2023-10-08', 1, 4, 8),
  ('2023-10-09', 0, 1, 9),
  ('2023-10-02', 1, 4, 10),
  ('2023-10-26', 1, 1, 11),
  ('2023-10-18', 0, 4, 12),
  ('2023-10-14', 1, 1, 13),
  ('2023-10-14', 1, 5, 14),
  ('2023-10-12', 0, 1, 15),
  ('2023-10-15', 1, 5, 16),
  ('2023-10-25', 1, 1, 17),
  ('2023-10-05', 0, 4, 18),
  ('2023-10-02', 1, 2, 19),
  ('2023-10-01', 1, 4, 20);