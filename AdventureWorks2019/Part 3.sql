--21.Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido empiece con R
SELECT DISTINCT(LastName)
FROM Sales.vIndividualCustomer
WHERE LastName LIKE 'R%';

--22.Traer a todos los clientes de Sales.vIndividualCustomer cuyo apellido termine con R
SELECT DISTINCT(LastName)
FROM Sales.vIndividualCustomer
WHERE LastName LIKE '%R';

/*23.Usando Production.Product encontrar cuántos productos están asociados con cada
color. Ignorar las filas donde el color no tenga datos (NULL). Luego de agruparlos,
devolver sólo los colores que tienen al menos 20 productos en ese color*/
SELECT Color, COUNT(ProductID) AS Cantidad
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(ProductID) > 20
ORDER BY Cantidad DESC;

/*24.Hacer un join entre Production.Product y Production.ProductInventory sólo
cuando los productos aparecen en ambas tablas. Hacerlo sobre el ProductID.
Production.ProductInventory tiene la cantidad de cada producto, si se vende
cada producto con un ListPrice mayor a cero, ¿cuánto dinero se ganaría?*/
SELECT
	pp.ProductID,
	ppi.Quantity AS Quantity,
	pp.ListPrice AS Price,
	(ppi.Quantity * pp.ListPrice) AS Income
FROM
	Production.Product pp
	INNER JOIN
	(SELECT ProductID, SUM(Quantity) AS Quantity
	 FROM Production.ProductInventory
	 GROUP BY ProductID) AS ppi
		ON pp.ProductID = ppi.ProductID
WHERE pp.ListPrice > 0
GROUP BY
	ppi.Quantity,
	pp.ListPrice,
	pp.ProductID
ORDER BY pp.ProductID DESC;

/*25.Traer FirstName y LastName de Person.Person. Crear una tercera columna donde
se lea “Promo 1” si el EmailPromotion es 0, “Promo 2” si el valor es 1 o
“Promo 3” si el valor es 2*/
SELECT
	FirstName,
	LastName,
	CASE
		WHEN EmailPromotion = 0 THEN 'Promo 1'
		WHEN EmailPromotion = 1 THEN 'Promo 2'
		WHEN EmailPromotion = 2 THEN 'Promo 3'
	END AS Prom
FROM
	Person.Person;

/*26.Traer el BusinessEntityID y SalesYTD de Sales.SalesPerson, juntarla con
Sales.SalesTerritory de tal manera que Sales.SalesPerson devuelva valores aunque
no tenga asignado un territorio. Traes el nombre de Sales.SalesTerritory*/
SELECT
	ssp.BusinessEntityID,
	ssp.SalesYTD,
	sst.Name
FROM
	Sales.SalesPerson AS ssp
	LEFT JOIN
	Sales.SalesTerritory AS sst
		ON ssp.TerritoryID = sst.TerritoryID;

/*27.Usando el ejemplo anterior, vamos a hacerlo un poco más complejo. Unir
Person.Person para traer también el nombre y apellido. Sólo traer las filas cuyo
territorio sea “Northeast” o “Central”*/
SELECT
	ssp.BusinessEntityID,
	ssp.SalesYTD,
	sst.Name,
	pp.FirstName,
	pp.LastName
FROM
	Sales.SalesPerson AS ssp
	LEFT JOIN
	(SELECT Name, TerritoryID
	 FROM Sales.SalesTerritory) AS sst
		ON ssp.TerritoryID = sst.TerritoryID
	INNER JOIN
	Person.Person as pp
		ON pp.BusinessEntityID = ssp.BusinessEntityID
WHERE sst.Name='Northeast' OR sst.Name='Central';

--28.Usando Person.Person y Person.Password hacer un INNER JOIN trayendo FirstName, LastName y PasswordHash
SELECT
	ppe.FirstName,
	ppe.LastName,
	ppa.PasswordHash
FROM
	Person.Person AS ppe
	INNER JOIN
	Person.Password AS ppa
		ON ppE.BusinessEntityID = ppa.BusinessEntityID;

--29.Traer el título de Person.Person. Si es NULL devolver “No hay título”
SELECT
	Title,
	CASE
		WHEN Title IS NULL THEN 'No hay titulo'
		ELSE Title
	END AS Title_2
FROM
	Person.Person;

/*30.Si MiddleName es NULL devolver FirstName y LastName concatenados, con un
espacio de por medio. Si MiddeName no es NULL devolver FirstName, MiddleName
y LastName concatenados, con espacios de por medio*/
SELECT
	FirstName,
	MiddleName,
	LastName,
	CASE
		WHEN MiddleName IS NULL THEN CONCAT(FirstName, ' ', LastName)
		WHEN MiddleName IS NOT NULL THEN CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
	END AS Full_Name
FROM
	Person.Person;

--31.Usando Production.Product si las columnas MakeFlag y FinishedGoodsFlag son iguales, que devuelva NULL
SELECT
	MakeFlag,
	FinishedGoodsFlag,
	CASE
		WHEN MakeFlag = FinishedGoodsFlag THEN NULL
		ELSE 'no son iguales'
	END AS Equal_Flag_V
FROM
	Production.Product;

/*32.Usando Production.Product si el valor en color no es NULL devolver
“Sin color”. Si el color sí está, devolver el color*/
SELECT
	Color,
	CASE
		WHEN Color IS NULL THEN 'No color'
		WHEN Color IS NOT NULL THEN Color
	END AS Color_Y_N
FROM
	Production.Product;