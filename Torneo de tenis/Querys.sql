USE torneo_tenis;

--1)Contar la cantidad total de participantes
SELECT COUNT(*) AS CANT_PARTICIPANTES
FROM participantes;

--2)Obtener la lista completa de todos los participantes
SELECT apellido, nombre
FROM participantes;

--3)Obtener la lista completa de todas las categorías
SELECT nombre
FROM categorias;

--4)Obtener la cantidad de participantes mujeres (sin importar categoría)
SELECT COUNT(*) AS CANT_MUJERES
FROM participantes
WHERE sexo='F';

--5)Obtener el nombre y apellido de los inscriptos en la categoría "Caballeros B"
--a.con joins explicitos, sin conocer las condiciones que de la categoria Caballeros B
SELECT p.nombre, p.apellido, c.nombre
FROM
	participantes p
	INNER JOIN
	inscripciones i
		ON p.id_participante = i.fk_participante
	INNER JOIN 
	categorias c
		ON i.fk_categoria = c.id_categoria
WHERE c.nombre = 'Caballeros B';

--b.con joins implicitos, sin conocer las condiciones que de la categoria Caballeros B
SELECT p.nombre, p.apellido, c.nombre
FROM participantes p, inscripciones i, categorias c
WHERE
	p.id_participante=i.fk_participante
	AND
	i.fk_categoria=c.id_categoria
	AND
	c.nombre = 'Caballeros B';

--c.conociendo las condiciones de la categoria 
SELECT nombre, apellido
FROM participantes
WHERE sexo = 'M' AND edad>=35;

--d.Obtener los datos de los participantes (de cualquier género) que tengan una edad entre 25 y 37 años
SELECT *
FROM participantes
WHERE edad BETWEEN 25 AND 37;

--6)Obtener la lista completa de inscripciones, especificando nombre y apellido de cada uno de los inscriptos, sin diferenciar categoría
--a.con joins explicitos
SELECT p.nombre, p.apellido, i.num_inscripcion, i.fecha_insc, i.abono_insc
FROM inscripciones i
	 INNER JOIN
	 participantes p
		ON i.fk_participante = p.id_participante;

--b.con joins implicitos
SELECT p.nombre, p.apellido, i.num_inscripcion, i.fecha_insc, i.abono_insc
FROM inscripciones i, participantes p
WHERE i.fk_participante = p.id_participante;