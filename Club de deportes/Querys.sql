USE Club_de_deportes;

-- Obtener la lista completa de todos los socios
SELECT *
FROM socios;


-- Obtener la lista completa de todos los deportes
SELECT *
FROM deportes;


-- Obtener la lista de socios que practiquen tenis
SELECT *
FROM socios
WHERE deporte IN
			   (SELECT codigo
			    FROM deportes
				WHERE nombre='TENIS');


-- Obtener la cantidad de socios que practiquen futbol
SELECT COUNT(num_socio) AS CANT_FUTBOLISTAS
FROM socios
WHERE deporte IN
			   (SELECT codigo
			    FROM deportes
				WHERE nombre='FUTBOL');