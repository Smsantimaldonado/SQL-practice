use AdventureWorks2019;

/*1.Traer el FirstName y LastName de Person.Person cuANDo el FirstName sea Mark.*/
SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName = 'Mark';

/*2.¿Cuántas filas hay dentro de Person.Person?*/
SELECT COUNT(BusinessEntityID)
FROM Person.Person;

/*3.Traer las 100 primeras filas de Production.Product donde el ListPrice
no es 0*/
SELECT TOP 100 ListPrice
FROM Production.Product
WHERE ListPrice != 0;

/*4.Traer todas las filas de de HumanResources.vEmployee donde los apellidos
de los empleados empiecen con una letra inferior a “D”*/
SELECT LastName
FROM HumanResources.vEmployee
WHERE LastName like '[ABC]%';

/*5.¿Cuál es el promedio de StANDardCost para cada producto donde StANDardCost
es mayor a $0.00? (Production.Product)*/
SELECT DISTINCT(Name), AVG(StANDardCost) as 'AVG'
FROM Production.Product
WHERE StANDardCost > 0.00
GROUP BY Name;

/*6.En la tabla Person.Person ¿cuántas personas están asociadas con cada
tipo de persona (PersonType)? */
SELECT PersonType, COUNT(PersonType) as 'COUNT'
FROM Person.Person
GROUP BY PersonType;

/*7.Traer todas las filas y columnas de Person.StateProvince donde el
COUNTryRegionCode sea CA. */
SELECT *
FROM Person.StateProvince
WHERE COUNTryRegionCode = 'CA';

/*8.¿Cuántos productos en Production.Product hay que son rojos (red) y cuántos
que son negros (black)?*/
SELECT Color, COUNT(Color) as 'Cantidad'
FROM Production.Product
WHERE Color = 'red' or Color = 'black'
GROUP BY Color;

/*9.¿Cuál es el valor promedio de Freight por cada venta?
(Sales.SalesOrderHeader) donde la venta se dio en el TerriotryID 4?*/
SELECT
	SalesOrderID,
	SUM(Freight) as 'Sumatoria'
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4
GROUP BY SalesOrderID;

/*10.Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido sea
Lopez, Martin o Wood, y sus nombres empiecen con cualquier letra entre la C y la L.*/
SELECT FirstName, LastName
FROM Sales.vIndividualCustomer
WHERE
	(LastName='Lopez' or LastName='Martin' or LastName='Wood')
	AND
	(FirstName like '[CDEFGHIJKL]%');