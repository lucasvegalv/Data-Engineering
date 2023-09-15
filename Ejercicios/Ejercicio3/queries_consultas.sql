SELECT * FROM PROVEEDORES;
SELECT * FROM ENVIOS;
SELECT * FROM COMPONENTES;
SELECT * FROM ARTICULOS;


-- 1) Obtener todos los detalles de todos los artículos de CACERES.
SELECT * FROM ARTICULOS WHERE CIUDAD = 'CACERES';

-- 2) Obtener todos los valores de P# para los proveedores que abastecen el artículo T1.
SELECT P# FROM ENVIOS WHERE T# = 'T1'; 

-- 3) Obtener la lista de pares de atributos (COLOR, CIUDAD) de la tabla componentes eliminando los pares duplicados.
SELECT DISTINCT CIUDAD, COLOR FROM COMPONENTES;

-- 4) Obtener los valores de P# para los proveedores que suministran para el artículo T1 el componente C1.
SELECT * FROM ENVIOS WHERE T# = 'T1' AND C# = 'C1';

-- 5) Obtener los valores de TNOMBRE en orden alfabético para los artículos abastecidos por el proveedor P1.
CREATE VIEW Art_Proveedor1 as
SELECT * FROM ENVIOS WHERE P# = 'P1';

SELECT TNOMBRE 
FROM ARTICULOS
INNER JOIN Art_Proveedor1 on ARTICULOS.T# = Art_Proveedor1.T#
ORDER BY TNOMBRE;

-- 6) Obtener los valores de C# para los componentes suministrados para cualquier artículo de MADRID.
SELECT C# FROM ARTICULOS JOIN ENVIOS on ARTICULOS.T# = ENVIOS.T# WHERE CIUDAD = 'MADRID';

-- 7) Obtener todos los valores de C# de los componentes tales que ningún otro componente tenga un valor de peso inferior.
SELECT * FROM COMPONENTES WHERE PESO = (SELECT MIN(PESO) FROM COMPONENTES);

-- 8) Obtener los valores de P# para los proveedores que suministren los artículos T1 y T2.
SELECT * FROM ENVIOS WHERE T# IN ('T1', 'T2');

-- 9) Obtener los valores de P# para los proveedores que suministran para un artículo de SEVILLA o MADRID un componente ROJO.
SELECT PROVEEDORES.P#, PNOMBRE AS NOMBRE_PROOVEDOR, ARTICULOS.TNOMBRE AS NOMBRE_ARTICULO, COMPONENTES.COLOR AS COLOR_COMPONENTE, ARTICULOS.CIUDAD FROM PROVEEDORES 
JOIN ENVIOS ON PROVEEDORES.P# = ENVIOS.P# 
JOIN COMPONENTES ON ENVIOS.C# = COMPONENTES.C# 
JOIN ARTICULOS ON ENVIOS.T# = ARTICULOS.T#
WHERE ARTICULOS.CIUDAD IN ('SEVILLA', 'MADRID') AND COMPONENTES.COLOR = 'ROJO';

-- TO DO
-- 10) Obtener, mediante subconsultas, los valores de C# para los componentes suministrados para algún artículo de SEVILLA por un proveedor de SEVILLA.
SELECT * FROM COMPONENTES 
WHERE EXISTS (SELECT * FROM ENVIOS WHERE COMPONENTES.C# = ENVIOS.C#)


--------------------------------------------------------- to do ------------------------------------------------




-- 11) Obtener los valores de T# para los artículos que usan al menos un componente que se puede obtener con el proveedor P1.
SELECT * FROM ARTICULOS 
JOIN ENVIOS ON ARTICULOS.T# = ENVIOS.T# 
JOIN PROVEEDORES ON ENVIOS.P# = PROVEEDORES.P#
WHERE PROVEEDORES.P# = 'P1';

-- 12) Obtener todas las ternas (CIUDAD, C#, CIUDAD) tales que un proveedor de la primera ciudad suministre el componente especificado para un artículo montado en la segunda ciudad.
SELECT DISTINCT PROVEEDORES.CIUDAD AS PROV_CIUDAD, COMPONENTES.C# AS COMPONENTE, ARTICULOS.CIUDAD AS ART_CIUDAD FROM ARTICULOS 
JOIN ENVIOS ON ARTICULOS.T# = ENVIOS.T# 
JOIN COMPONENTES ON ENVIOS.C# = COMPONENTES.C#
JOIN PROVEEDORES ON ENVIOS.P# = PROVEEDORES.P#

-- 13) Repetir el ejercicio anterior pero sin recuperar las ternas en los que los dos valores de ciudad sean los mismos.
SELECT DISTINCT PROVEEDORES.CIUDAD AS PROV_CIUDAD, COMPONENTES.C# AS COMPONENTE, ARTICULOS.CIUDAD AS ART_CIUDAD FROM ARTICULOS 
JOIN ENVIOS ON ARTICULOS.T# = ENVIOS.T# 
JOIN COMPONENTES ON ENVIOS.C# = COMPONENTES.C#
JOIN PROVEEDORES ON ENVIOS.P# = PROVEEDORES.P#
WHERE PROVEEDORES.CIUDAD = ARTICULOS.CIUDAD;

-- 14) Obtener el número de suministros, el de artículos distintos suministrados y la cantidad total de artículos suministrados por el proveedor P2.
SELECT COUNT(*) AS 'Numero de Suministrros', 
	   COUNT(DISTINCT T#) AS 'Articulos Unicos Suministrados',
	   SUM(CANTIDAD) AS 'Total Articulos Suministrados'
FROM ENVIOS
WHERE P# = 'P2';

-- 15) Para cada artículo y componente suministrado obtener los valores de C#, T# y la cantidad total correspondiente.
SELECT T#, C#, SUM(CANTIDAD) AS 'Cantidad Total'
FROM ENVIOS
GROUP BY T#, C#;

-- 16) Obtener los valores de T# de los artículos abastecidos al menos por un proveedor que no viva en MADRID y que no esté en la misma ciudad en la que se monta el artículo.
SELECT DISTINCT(ARTICULOS.T#) FROM ARTICULOS 
JOIN ENVIOS ON ARTICULOS.T# = ENVIOS.T# 
JOIN PROVEEDORES ON ENVIOS.P# = PROVEEDORES.P#
WHERE PROVEEDORES.CIUDAD != 'MADRID' AND PROVEEDORES.CIUDAD != ARTICULOS.CIUDAD;

-- 17) Obtener los valores de P# para los proveedores que suministran al menos un componente suministrado al menos por un proveedor que suministra al menos un componente ROJO.

-- 18) Obtener los identificadores de artículos, T#, para los que se ha suministrado algún componente del que se haya suministrado una media superior a 320 artículos.

-- 19) Seleccionar los identificadores de proveedores que hayan realizado algún envío con cantidad mayor que la media de los envíos realizados para el componente a que corresponda dicho envío.

-- 20) Seleccionar los identificadores de componentes suministrados para el artículo 'T2' por el proveedor 'P2'.

-- 21) Seleccionar todos los datos de los envíos realizados de componentes cuyo color no sea 'ROJO'.

-- 22) Seleccionar los identificadores de componentes que se suministren para los artículos 'T1' y 'T2'.

-- 23) Seleccionar el identificador de proveedor y el número de envíos de componentes de color 'ROJO' llevados a cabo por cada proveedor.

-- 24) Seleccionar los colores de componentes suministrados por el proveedor 'P1'.

-- 25) Seleccionar los datos de envío y nombre de ciudad de aquellos envíos que cumplan que el artículo, proveedor y componente son de la misma ciudad.

-- 26) Seleccionar los nombres de los componentes que son suministrados en una cantidad total superior a 500.

-- 27) Seleccionar los identificadores de proveedores que residan en Sevilla y no suministren más de dos artículos distintos.

-- 28) Seleccionar los identificadores de artículos para los cuales todos sus componentes se fabriquen en una misma ciudad.

-- 29) Seleccionar los identificadores de artículos para los que se provean envíos de todos los componentes existentes en la base de datos.

-- 30) Seleccionar los códigos de proveedor que suministran al menos dos componentes de color 'ROJO'.
