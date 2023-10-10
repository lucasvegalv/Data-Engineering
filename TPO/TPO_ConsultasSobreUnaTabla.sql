-- SELECTS Generales
SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;


-- Consignas TP Formativo
-- 1. Devuelve un listado con el c�digo de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad
FROM oficina
WHERE codigo_oficina IS NOT NULL;

-- 2. Devuelve un listado con la ciudad y el tel�fono de las oficinas de Espa�a.
SELECT ciudad, telefono 
FROM oficina
WHERE pais = 'Espa�a';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un c�digo de jefe igual a 7.
SELECT nombre, apellido1, apellido2, email 
FROM empleado
WHERE codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto, nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe IS NULL;

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto 
FROM empleado 
WHERE puesto <> 'Representante Ventas';

-- 6. Devuelve un listado con el nombre de todos los clientes espa�oles.
SELECT nombre_cliente 
FROM cliente 
WHERE pais = 'Spain';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT(estado) 
FROM pedido;

-- 8. Devuelve un listado con el c�digo de cliente de aquellos clientes que realizaron alg�n pago en 2008, eliminando duplicados.
   -- Utilizando la funci�n YEAR.
   SELECT DISTINCT(codigo_cliente) 
   FROM pago
   WHERE YEAR(fecha_pago) = 2008;

   -- Utilizando la funci�n DATE_FORMAT.
	SELECT DISTINCT codigo_cliente
	FROM pago
	WHERE FORMAT(fecha_pago, 'yyyy') = '2008';

   -- Sin utilizar ninguna de las funciones anteriores.
   	SELECT DISTINCT codigo_cliente
	FROM pago
	WHERE LEFT(fecha_pago, 4) = '2008';

-- 9. Devuelve un listado con el c�digo de pedido, c�digo de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
   -- Utilizando la funci�n ADDDATE.
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
   FROM pedido
   WHERE DATEADD(DAY, 0, fecha_entrega) > fecha_esperada;

   -- Utilizando la funci�n DATEDIFF.
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
   FROM pedido
   WHERE DATEDIFF(DAY, fecha_entrega, fecha_esperada) < fecha_esperada;

-- 10. Devuelve un listado con el c�digo de pedido, c�digo de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos d�as antes de la fecha esperada.
   -- Utilizando la funci�n ADDDATE.
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
   FROM pedido
   WHERE DATEADD(DAY, -2, fecha_esperada) >= fecha_entrega;

   -- Utilizando la funci�n DATEDIFF.
   SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
   FROM pedido
   WHERE DATEDIFF(DAY, fecha_entrega, fecha_esperada) >= 2

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT * 
FROM pedido
WHERE estado = 'Rechazado' AND YEAR(fecha_pedido) = 2009;

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier a�o.
SELECT * 
FROM pedido
WHERE estado = 'Entregado' AND MONTH(fecha_pedido) = 01;

-- 13. Devuelve un listado con todos los pagos que se realizaron en el a�o 2008 mediante Paypal. Ordene el resultado de mayor a menor.
SELECT *
FROM pago
WHERE (YEAR(fecha_pago) = 2008) AND forma_pago = 'PayPal'
ORDER BY codigo_cliente DESC;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Ten en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT forma_pago
FROM pago;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen m�s de 100 unidades en stock. El listado deber� estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT * 
FROM producto
WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
ORDER BY precio_venta DESC;

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el c�digo de empleado 11 o 30.
SELECT * 
FROM cliente
WHERE ciudad = 'Madrid' AND codigo_empleado_rep_ventas IN (11, 30);
