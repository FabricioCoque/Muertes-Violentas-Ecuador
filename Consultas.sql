---¿Cuál es el número total de muertes violentas por año?
SELECT Año, COUNT(*) AS Total_Casos
FROM Registro_Muertes
GROUP BY Año
ORDER BY Año

--¿Cuál es el número total de muertes violentas por tipo de delito?
SELECT Delito, COUNT(*) AS Total_Casos
FROM Registro_Muertes RM
JOIN  Tipo_Delito TD ON RM.Id_Delito=TD.Id_Delito
GROUP BY Delito
ORDER BY Total_Casos DESC

--¿Cuáles son los 5 años con más muertes violentas?
SELECT TOP 5 Año, COUNT(*) AS Total_Casos
FROM Registro_Muertes
GROUP BY Año
ORDER BY Total_Casos DESC 

--¿Cual es el TOP 3 de las armas mas usadas en el cometimiento del delito 

SELECT TOP 3 Nombre_Tipo, COUNT(*) AS Total_Casos 
FROM Registro_Muertes RM
JOIN Arma AR ON RM.Id_Arma =ar.Id_Arma
GROUP BY Nombre_Tipo

--¿Cuáles son  las 10  provincias  con más muertes violentas registradas? 

SELECT TOP 10 Provincia, COUNT(*) AS Total_Casos
FROM Registro_Muertes RM
JOIN Provincia PR ON RM.Id_Provincia = PR.Id_Provincia
GROUP BY Provincia
ORDER BY Total_Casos DESC 

--¿ Cual es el promedio Mensual de Muertes VIolentas  por año ?

SELECT Año,AVG(Total_Casos) as Promedio_Mensual
FROM (
	  SELECT Año,Mes,COUNT(*) as Total_Casos
	  FROM Registro_Muertes
	  GROUP BY Año,Mes
) as Subconsulta
GROUP BY  Año

--¿Cual es la principal Presunta Motivacion de las Muertes Violentas ?
SELECT  Motivacion, COUNT(*) as Total_Casos
FROM Registro_Muertes RM
JOIN Presunto_Motivo PM ON RM.Id_Motivacion =PM.Id_Motivacion 
GROUP BY Motivacion
ORDER BY Total_Casos DESC 