-- SELECTS Generales
SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;

-- 1. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(codigo_empleado) AS cant_empleados
FROM empleado

-- 2. ¿Cuántos clientes tiene cada país?
SELECT cliente.pais, COUNT(codigo_empleado) AS cant_empleados
FROM empleado
JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
GROUP BY cliente.pais

-- 3. ¿Cuál fue el pago medio en 2009?
SELECT YEAR(fecha_pago) AS año, AVG(total) AS avg_pago
FROM pago
WHERE YEAR(fecha_pago) = 2008
GROUP BY YEAR(fecha_pago)

-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT * FROM pedido

SELECT fecha_pedido, estado, COUNT(codigo_pedido) as cant_pedidos
FROM pedido
GROUP BY estado
ORDER BY cant_pedidos DESC

-- 5. Calcula el precio de venta del producto más caro y barato en una misma consulta.
SELECT MIN(precio_venta) as precio_min, MAX(precio_venta) as precio_max
FROM producto

-- 6. Calcula el número de clientes que tiene la empresa.
SELECT COUNT(codigo_cliente) AS cant_clientes
FROM cliente

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT ciudad, COUNT(codigo_cliente) AS cant_clientes
FROM cliente
WHERE ciudad = 'Madrid'
GROUP BY ciudad

-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
SELECT ciudad, COUNT(codigo_cliente) AS cant_clientes
FROM cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad

-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT empleado.nombre, COUNT(cliente.codigo_cliente) AS cant_clientes
FROM empleado
JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE empleado.puesto = 'Representante Ventas'
GROUP BY empleado.nombre

-- 10. Calcula el número de clientes que no tiene asignado representante de ventas.
SELECT COUNT(cliente.nombre_cliente) AS cant_clientes_sin_rep
FROM cliente
JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE empleado.puesto <> 'Representante Ventas' 

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT cliente.codigo_cliente, cliente.nombre_cliente, MIN(pago.fecha_pago) AS primer_pago, MAX(pago.fecha_pago) AS ultimo_pago
FROM pago
JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY cliente.codigo_cliente, cliente.nombre_cliente

-- 12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT codigo_pedido, COUNT(DISTINCT(codigo_producto)) AS cant_productos_unicos
FROM detalle_pedido
GROUP BY codigo_pedido

-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
SELECT codigo_pedido, COUNT(codigo_producto)
FROM detalle_pedido
GROUP BY codigo_pedido

-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT TOP 20 codigo_producto, COUNT(codigo_pedido) AS cant_pedidos
FROM detalle_pedido
GROUP BY codigo_producto
ORDER BY cant_pedidos DESC

-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21% de la base imponible, y el total es la suma de los dos campos anteriores.
SELECT detalle_pedido.codigo_producto, (producto.precio_proveedor * SUM(detalle_pedido.cantidad)) AS base_imponible, 
	  (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21) AS IVA,
	  ((producto.precio_proveedor * SUM(detalle_pedido.cantidad)) + (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21)) AS total
FROM producto
JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
GROUP BY detalle_pedido.codigo_producto,  producto.precio_proveedor
ORDER BY total DESC

-- 16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
SELECT detalle_pedido.codigo_producto, (producto.precio_proveedor * SUM(detalle_pedido.cantidad)) AS base_imponible, 
	  (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21) AS IVA,
	  ((producto.precio_proveedor * SUM(detalle_pedido.cantidad)) + (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21)) AS total
FROM producto
JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
GROUP BY detalle_pedido.codigo_producto,  producto.precio_proveedor
ORDER BY total DESC

-- 17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
SELECT detalle_pedido.codigo_producto, (producto.precio_proveedor * SUM(detalle_pedido.cantidad)) AS base_imponible, 
	  (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21) AS IVA,
	  ((producto.precio_proveedor * SUM(detalle_pedido.cantidad)) + (producto.precio_proveedor * SUM(detalle_pedido.cantidad) * 0.21)) AS total
FROM producto
JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE producto.codigo_producto LIKE 'OR%'
GROUP BY detalle_pedido.codigo_producto,  producto.precio_proveedor
ORDER BY total DESC

-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
SELECT producto.nombre, COUNT(detalle_pedido.codigo_producto) AS cant_x_prod,
	   (detalle_pedido.cantidad * detalle_pedido.precio_unidad) AS total,
	   (detalle_pedido.cantidad * detalle_pedido.precio_unidad) + ((detalle_pedido.cantidad * detalle_pedido.precio_unidad) * 0.21) as total_con_iva
FROM detalle_pedido
JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE (detalle_pedido.cantidad * detalle_pedido.precio_unidad) > 3000
GROUP BY producto.nombre, detalle_pedido.cantidad, detalle_pedido.precio_unidad

-- 19. Muestra la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
SELECT YEAR(fecha_pago) as anio, SUM(total) as total_pagos
FROM pago
GROUP BY YEAR(fecha_pago)
