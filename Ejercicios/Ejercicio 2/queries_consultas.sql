-- 1) Listado de todos los lugares para viajar registrados en la base de datos.
SELECT l_nombre FROM Lugar;

-- 2) Listado con el nombre y apellido de todos los pasajeros.
SELECT p_nombre, p_apellido FROM Pasajero;

-- 3) Seleccionar el nombre y el clima de todos los lugares.
SELECT * FROM Lugar;
SELECT l_nombre, l_clima FROM Lugar;

-- 4) Mostrar el nombre, total de habitantes de todos los lugares, además, suponer un incremento de la población de cada lugar en 100000 habitantes.
SELECT l_nombre, l_total_habitantes FROM Lugar;
UPDATE Lugar
SET l_total_habitantes += 100000;

-- 5) Mostrar el nombre, tipo de lugar y el número de habitantes de cada lugar si su población se doblara. Nombrar la columna como "Doble_de_habitantes".
ALTER TABLE Lugar 
ADD Doble_de_habitantes bigint;

UPDATE Lugar
SET Doble_de_habitantes = l_total_habitantes * 2;

SELECT l_nombre, Doble_de_habitantes FROM Lugar;

-- 6) Listar los diferentes climas de los lugares.
SELECT DISTINCT(l_clima) FROM Lugar;

-- 7) Listar los diferentes perfiles de los pasajeros.
SELECT * FROM Pasajero;

SELECT DISTINCT(p_perfil)
FROM Pasajero;

-- 8) Listado de los diferentes apellidos y perfiles de los pasajeros.
SELECT DISTINCT(p_apellido)
FROM Pasajero
UNION
SELECT DISTINCT(p_perfil)
FROM Pasajero;

-- 9) Seleccionar el nombre y el apellido de todos los pasajeros de clase turista (perfil).
SELECT p_nombre, p_apellido FROM Pasajero WHERE p_perfil = 'Tourist Class';
SELECT * FROM Pasajero;

-- 10) Listado de todos los lugares con clima tropical.
SELECT * FROM Lugar WHERE l_clima = 'Tropical'; 

-- 11) Listar todos los países con un total de habitantes que supere los 10 millones.
SELECT * FROM Lugar WHERE l_total_habitantes > 10000000;

-- 12) Mostrar todos los pasajeros nacidos entre el 1970 y 1980.
SELECT * FROM Pasajero WHERE DATEPART(year, p_fecha_de_nacimiento) BETWEEN 1970 AND 1980;

-- 13) Mostrar nombre y fecha de nacimiento de los pasajeros de clase business y primera clase. Etiquetar la fecha de nacimiento como "Nacido_el".
SELECT p_nombre, p_fecha_de_nacimiento FROM Pasajero WHERE p_perfil IN ('Business', 'First Class');

-- 14) Mostrar todos los lugares que no tengan clima Mediterráneo.
SELECT * FROM Lugar WHERE l_clima != 'Mediterraneo';

-- 15) Listado de todos los pasajeros cuyo nombre empiece por la letra F.
SELECT * FROM Pasajero WHERE p_nombre LIKE 'F%';

-- 16) Listado de todos los lugares cuyo nombre tenga una letra A.
SELECT * FROM Lugar WHERE l_nombre LIKE '%A%';

-- 17) Listar los diferentes apellidos de los pasajeros que empiecen por la letra M y terminen en EZ.
SELECT DISTINCT(p_apellido) FROM Pasajero WHERE p_apellido LIKE 'M%EZ';

-- 18) Mostrar todos los lugares que tengan clima registrado.
SELECT * FROM Lugar WHERE l_clima IS NOT NULL;

-- 19) Mostrar los pasajeros que no tengan perfil de pasajero registrado.
SELECT * FROM Pasajero WHERE p_perfil IS NULL;

-- 20) Listado de todos los pasajeros que contengan la letra “Y” en su nombre y que hayan nacido entre el año 1975 y el 1985.
SELECT * FROM Pasajero
WHERE p_nombre LIKE '%Y%' AND
DATENAME(year, p_fecha_de_nacimiento) BETWEEN 1975 AND 1985;

-- 21) Listado viajeros que tienen el perfil LOW_COST y tengan apellido Ruiz.
SELECT * FROM Pasajero WHERE p_perfil = 'Low Cost' AND p_apellido = 'Ruiz';

-- 22) Listado de los lugares que tengan informado el número total de habitantes, su nombre empiece por E, con clima desconocido o Mediterráneo.
SELECT * FROM Lugar
WHERE (l_total_habitantes IS NOT NULL) AND
(l_nombre LIKE 'E%') AND
(l_clima IS NULL OR l_clima = 'Mediterraneo');

-- 23) Listado con los lugares de clima desconocido y que tengan la palabra ciudad en su nombre o que el total de sus habitantes sea inferior a 5 millones.
SELECT * FROM Lugar
WHERE (l_clima IS NULL) AND
(l_nombre LIKE '%ciudad%' OR l_total_habitantes < 5000000);

-- 24) Listar los pasajeros nacidos después de 1970 que viajen con el perfil business class y que tenga una G en su nombre.
CREATE VIEW pasajeros_despues_1970 AS
SELECT * FROM Pasajero
WHERE DATENAME(year, p_fecha_de_nacimiento) > 1970;

SELECT * FROM pasajeros_despues_1970
WHERE p_perfil = 'Business' AND
p_nombre LIKE '%g%';

-- 25) Listado de países ordenados por su total de habitantes de mayor a menor.
SELECT * FROM Lugar
ORDEr BY l_total_habitantes DESC;

-- 26) Listar los pasajeros por orden alfabético de su apellido, mostrarlos de la forma Apellido, Nombre y etiquetar la columna como Nombre y Apellido.
SELECT CONCAT(p_apellido, ' ', p_nombre) AS Nombre_y_Apellido
FROM Pasajero
ORDER BY Nombre_y_Apellido;

-- 27) Mostrar los países con clima Tropical ordenados alfabéticamente.
SELECT * FROM Lugar 
WHERE l_clima = 'Tropical'
ORDER BY l_nombre;

-- 28) Mostrar los viajeros ordenados por su fecha de nacimiento (de más joven a menos) y por su apellido de forma inversa.
SELECT * FROM Pasajero
ORDER BY
  p_fecha_de_nacimiento ASC,  
  p_apellido DESC;

-- 29) Seleccionar todos aquellos pasajeros que no usen clase BUSINESS ordenados por su número de teléfono y apellido.
SELECT * FROM Pasajero
WHERE p_perfil != 'Business'
ORDER BY 
	p_num_telefonico,
	p_apellido;

-- 30) Listar todos los lugares con más de 10000 habitantes, de clima conocido y con las palabras "UBICADA" y "SUR" ordenados por su nombre y su número de habitantes, de menor a mayor.
SELECT * FROM Lugar
WHERE l_total_habitantes > 10000
	AND l_clima IS NOT NULL 
	AND l_nombre LIKE '&ubicada&'
	AND l_nombre LIKE '&sur&'
ORDER BY
	l_nombre,
	l_total_habitantes;