USE Info_Tienda;


-- Obtener la lista completa de todo los productos ordenados por precio (mas barato a mas caro)
SELECT *
FROM Productos
ORDER BY precio ASC;


-- Obtener la lista completa de todo los fabricantes ordenados por nombre (ascendente)
SELECT *
FROM Fabricantes
ORDER BY NOMBRE ASC;


-- Obtener nombre y precio de los productos que valgan mas de 1000
SELECT nombre, precio
FROM Productos
WHERE precio > 1000;


-- Obtener nombre y precio del producto mas barato
SELECT TOP 1 nombre, precio
FROM Productos
ORDER BY precio ASC;