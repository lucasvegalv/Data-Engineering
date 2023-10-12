-- SELECTS Generales
SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;

-- Subconsultas con operadores básicos de comparación
-- 1. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente)

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto)

-- 3. Devuelve el nombre del producto del cual se han vendido más unidades.
SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto)

-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que hayan realizado (Sin utilizar INNER JOIN).
SELECT * FROM pago;
SELECT * FROM cliente;

SELECT cliente.codigo_cliente, cliente.nombre_cliente, cliente.limite_credito
FROM cliente
WHERE limite_credito > (SELECT sum(total) as total_pagos FROM pago WHERE cliente.codigo_cliente = pago.codigo_cliente)

-- 5. Devuelve el producto que más unidades tiene en stock.
SELECT codigo_producto, nombre, cantidad_en_stock
FROM producto
WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) AS stock FROM producto)

-- 6. Devuelve el producto que menos unidades tiene en stock.
SELECT codigo_producto, nombre, cantidad_en_stock
FROM producto
WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) AS stock FROM producto)

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
SELECT nombre, apellido1, apellido2, email
FROM empleado
WHERE codigo_jefe = (SELECT codigo_empleado FROM empleado WHERE codigo_empleado = 3)

-- Subconsultas con ALL y ANY
-- 8. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente
FROM cliente
WHERE limite_credito >= ALL (SELECT limite_credito FROM cliente)

-- 9. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre
FROM producto
WHERE precio_venta >= ALL (SELECT precio_venta FROM producto)

-- 10. Devuelve el producto que menos unidades tiene en stock.
SELECT nombre
FROM producto
WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock FROM producto)

-- Subconsultas con IN y NOT IN
-- 11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
SELECT nombre, apellido1, puesto
FROM empleado
WHERE codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente)

-- 12. Devuelve un listado que muestre solo los clientes que no han realizado ningún pago.
SELECT codigo_cliente, nombre_cliente
FROM cliente
WHERE codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)

-- 13. Devuelve un listado que muestre solo los clientes que sí han realizado algún pago.
SELECT codigo_cliente, nombre_cliente
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente FROM pago)

-- 14. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT * FROM producto
SELECT * FROM detalle_pedido

SELECT codigo_producto, nombre
FROM producto
WHERE codigo_producto NOT IN (SELECT codigo_producto FROM detalle_pedido)

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representantes de ventas de ningún cliente.
SELECT empleado.nombre + ' ' + empleado.apellido1 AS nombre_apellido, empleado.puesto, oficina.codigo_oficina, oficina.telefono AS telefono_oficina
FROM empleado, oficina
WHERE empleado.codigo_empleado NOT IN (SELECT codigo_empleado_rep_ventas FROM cliente) AND
	  oficina.codigo_oficina = empleado.codigo_oficina

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
SELECT codigo_oficina
FROM oficina
WHERE codigo_oficina NOT IN (
	SELECT codigo_oficina FROM empleado WHERE puesto = 'Representante Ventas' AND codigo_empleado NOT IN (
		SELECT codigo_empleado_rep_ventas from cliente WHERE codigo_cliente IN (
			SELECT codigo_cliente FROM pedido WHERE codigo_pedido IN (
				SELECT CONVERT(VARCHAR(50), codigo_producto) FROM detalle_pedido WHERE codigo_producto IN (
					SELECT codigo_producto FROM producto WHERE gama = 'Frutales'
					)
				)	
			)
		)
	)

-- 17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT *
FROM cliente
WHERE codigo_cliente IN (SELECT codigo_cliente FROM pedido) AND
	  codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)

-- Subconsultas con EXISTS y NOT EXISTS
-- 18. Devuelve un listado que muestre solo los clientes que no han realizado ningún pago.
SELECT *
FROM cliente
WHERE NOT EXISTS (SELECT * FROM pago WHERE cliente.codigo_cliente = pago.codigo_cliente)

-- 19. Devuelve un listado que muestre solo los clientes que sí han realizado algún pago.
SELECT *
FROM cliente
WHERE EXISTS (SELECT * FROM pago WHERE cliente.codigo_cliente = pago.codigo_cliente)

-- 20. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT * FROM cliente
SELECT * FROM pago
SELECT * FROM detalle_pedido
SELECT * FROM producto

SELECT *
FROM producto
WHERE NOT EXISTS (SELECT * FROM detalle_pedido WHERE producto.codigo_producto = detalle_pedido.codigo_producto)

-- 21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
SELECT *
FROM producto
WHERE EXISTS (SELECT * FROM detalle_pedido WHERE producto.codigo_producto = detalle_pedido.codigo_producto)