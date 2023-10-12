use AdventureWorks2019;

/*11.Devolver el FirstName y LastName de Sales.vIndividualCustomer donde el apellido
sea Smith, renombra las columnas en español*/
SELECT
	FirstName AS 'Nombre',
	LastName AS 'Apellido'
FROM Sales.vIndividualCustomer
WHERE LastName='Smith';

/*12.UsANDo Sales.vIndividualCustomer traer a todos los clientes que tengan el
COUNTryRegionCode de Australia ó todos los clientes que tengan un celular (Cell) y
en EmailPromotion sea 0 */
SELECT *
FROM Sales.vIndividualCustomer
WHERE
	CountryRegionName = 'Australia'
	OR
	(PhoneNumberType='cell' AND EmailPromotion=0);

/*13.¿Que tan caro es el producto más caro, por ListPrice, en la tabla
Production.Product? */
SELECT max(ListPrice)
FROM Production.Product;

/*14.¿Cuáles son las ventas por territorio para todas las filas de
Sales.SalesOrderHeader? Traer sólo los territorios que se pasen de
$10 millones en ventas históricas, traer el total de las ventas y el
TerritoryID.*/
SELECT TerritoryID, SUM(TotalDue) AS Ventas
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) > 10000000
ORDER BY Ventas DESC;

/*15.Usando la query anterior, hacer un join hacia Sales.SalesTerritory
y reemplazar el TerritoryID con el nombre del territorio. [NUEVO]*/
SELECT sst.Name, SUM(sso.TotalDue) AS Ventas
FROM
	Sales.SalesOrderHeader AS sso
	INNER JOIN
	Sales.SalesTerritory AS sst
	ON
	sso.TerritoryID = sst.TerritoryID
GROUP BY sst.Name
HAVING SUM(sso.TotalDue) > 10000000
ORDER BY Ventas DESC;

/*16.Traer todos los empleados de HumanResources.vEmployeeDepartment
que sean del departamento de “Executive”, “Tool Design”, y “Engineering”.
Cuáles son las dos formas de hacer esta consulta*/
SELECT FirstName, LastName, Department
FROM HumanResources.vEmployeeDepartment
WHERE
	Department='Executive'
	OR
	Department='Tool Design'
	OR
	Department='Engineering';

/*17.Usando HumanResources.vEmployeeDepartment traer a todos los empleados
que hayan empezado entre el primero de Julio del 2000 y el 30 de Junio del
2002. Hay dos posibilidades para hacer esta consulta. Hacer ambas.*/
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE
	StartDate
	BETWEEN
	'2000-07-01'
	AND
	'2002-06-30';

/*18.Traer todas las filas de Sales.SalesOrderHeader donde exista un vendedor (SalesPersonID)*/
SELECT *
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL;

/*19.¿Cuántas filas en Person.Person no tienen NULL en MiddleName?*/
SELECT COUNT(MiddleName)
FROM Person.Person
WHERE MiddleName IS NOT NULL;

/*20.Traer SalesPersonID y TotalDue de Sales.SalesOrderHeader por todas las ventas que no tienen
valores vacíos en SalesPersonID y TotalDue excede $70000*/
SELECT SalesPersonID, TotalDue AS Total
FROM Sales.SalesOrderHeader
WHERE 
	SalesPersonID IS NOT NULL
	AND
	TotalDue IS NOT NULL
	AND
	TotalDue > 70000
ORDER BY SalesPersonID ASC;