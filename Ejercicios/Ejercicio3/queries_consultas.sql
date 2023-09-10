-- 1) Obtener todos los detalles de todos los art�culos de CACERES.
SELECT * FROM ARTICULOS WHERE CIUDAD = 'CACERES';

-- 2) Obtener todos los valores de P# para los proveedores que abastecen el art�culo T1.


-- 3) Obtener la lista de pares de atributos (COLOR, CIUDAD) de la tabla componentes eliminando los pares duplicados.

-- 4) Obtener los valores de P# para los proveedores que suministran para el art�culo T1 el componente C1.

-- 5) Obtener los valores de TNOMBRE en orden alfab�tico para los art�culos abastecidos por el proveedor P1.

-- 6) Obtener los valores de C# para los componentes suministrados para cualquier art�culo de MADRID.

-- 7) Obtener todos los valores de C# de los componentes tales que ning�n otro componente tenga un valor de peso inferior.

-- 8) Obtener los valores de P# para los proveedores que suministren los art�culos T1 y T2.

-- 9) Obtener los valores de P# para los proveedores que suministran para un art�culo de SEVILLA o MADRID un componente ROJO.

-- 10) Obtener, mediante subconsultas, los valores de C# para los componentes suministrados para alg�n art�culo de SEVILLA por un proveedor de SEVILLA.

-- 11) Obtener los valores de T# para los art�culos que usan al menos un componente que se puede obtener con el proveedor P1.

-- 12) Obtener todas las ternas (CIUDAD, C#, CIUDAD) tales que un proveedor de la primera ciudad suministre el componente especificado para un art�culo montado en la segunda ciudad.

-- 13) Repetir el ejercicio anterior pero sin recuperar las ternas en los que los dos valores de ciudad sean los mismos.

-- 14) Obtener el n�mero de suministros, el de art�culos distintos suministrados y la cantidad total de art�culos suministrados por el proveedor P2.

-- 15) Para cada art�culo y componente suministrado obtener los valores de C#, T# y la cantidad total correspondiente.

-- 16) Obtener los valores de T# de los art�culos abastecidos al menos por un proveedor que no viva en MADRID y que no est� en la misma ciudad en la que se monta el art�culo.

-- 17) Obtener los valores de P# para los proveedores que suministran al menos un componente suministrado al menos por un proveedor que suministra al menos un componente ROJO.

-- 18) Obtener los identificadores de art�culos, T#, para los que se ha suministrado alg�n componente del que se haya suministrado una media superior a 320 art�culos.

-- 19) Seleccionar los identificadores de proveedores que hayan realizado alg�n env�o con cantidad mayor que la media de los env�os realizados para el componente a que corresponda dicho env�o.

-- 20) Seleccionar los identificadores de componentes suministrados para el art�culo 'T2' por el proveedor 'P2'.

-- 21) Seleccionar todos los datos de los env�os realizados de componentes cuyo color no sea 'ROJO'.

-- 22) Seleccionar los identificadores de componentes que se suministren para los art�culos 'T1' y 'T2'.

-- 23) Seleccionar el identificador de proveedor y el n�mero de env�os de componentes de color 'ROJO' llevados a cabo por cada proveedor.

-- 24) Seleccionar los colores de componentes suministrados por el proveedor 'P1'.

-- 25) Seleccionar los datos de env�o y nombre de ciudad de aquellos env�os que cumplan que el art�culo, proveedor y componente son de la misma ciudad.

-- 26) Seleccionar los nombres de los componentes que son suministrados en una cantidad total superior a 500.

-- 27) Seleccionar los identificadores de proveedores que residan en Sevilla y no suministren m�s de dos art�culos distintos.

-- 28) Seleccionar los identificadores de art�culos para los cuales todos sus componentes se fabriquen en una misma ciudad.

-- 29) Seleccionar los identificadores de art�culos para los que se provean env�os de todos los componentes existentes en la base de datos.

-- 30) Seleccionar los c�digos de proveedor que suministran al menos dos componentes de color 'ROJO'.
