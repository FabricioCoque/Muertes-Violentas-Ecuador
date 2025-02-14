---�Cu�l es el n�mero total de muertes violentas por a�o?
SELECT A�o, COUNT(*) AS Total_Casos
FROM Registro_Muertes
GROUP BY A�o
ORDER BY A�o

--�Cu�l es el n�mero total de muertes violentas por tipo de delito?
SELECT Delito, COUNT(*) AS Total_Casos
FROM Registro_Muertes RM
JOIN  Tipo_Delito TD ON RM.Id_Delito=TD.Id_Delito
GROUP BY Delito
ORDER BY Total_Casos DESC

--�Cu�les son los 5 a�os con m�s muertes violentas?
SELECT TOP 5 A�o, COUNT(*) AS Total_Casos
FROM Registro_Muertes
GROUP BY A�o
ORDER BY Total_Casos DESC 

--�Cual es el TOP 3 de las armas mas usadas en el cometimiento del delito 

SELECT TOP 3 Nombre_Tipo, COUNT(*) AS Total_Casos 
FROM Registro_Muertes RM
JOIN Arma AR ON RM.Id_Arma =ar.Id_Arma
GROUP BY Nombre_Tipo

--�Cu�les son  las 10  provincias  con m�s muertes violentas registradas? 

SELECT TOP 10 Provincia, COUNT(*) AS Total_Casos
FROM Registro_Muertes RM
JOIN Provincia PR ON RM.Id_Provincia = PR.Id_Provincia
GROUP BY Provincia
ORDER BY Total_Casos DESC 

--� Cual es el promedio Mensual de Muertes VIolentas  por a�o ?

SELECT A�o,AVG(Total_Casos) as Promedio_Mensual
FROM (
	  SELECT A�o,Mes,COUNT(*) as Total_Casos
	  FROM Registro_Muertes
	  GROUP BY A�o,Mes
) as Subconsulta
GROUP BY  A�o

--�Cual es la principal Presunta Motivacion de las Muertes Violentas ?
SELECT  Motivacion, COUNT(*) as Total_Casos
FROM Registro_Muertes RM
JOIN Presunto_Motivo PM ON RM.Id_Motivacion =PM.Id_Motivacion 
GROUP BY Motivacion
ORDER BY Total_Casos DESC 