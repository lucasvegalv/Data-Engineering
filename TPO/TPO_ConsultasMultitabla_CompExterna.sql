-- SELECTS Generales
SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;

-- 1. Devuelve un listado que muestre solo los clientes que no han realizado ning�n pago.
SELECT cliente.nombre_cliente
FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

-- 2. Devuelve un listado que muestre solo los clientes que no han realizado ning�n pedido.
SELECT cliente.nombre_cliente
FROM cliente
LEFT JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;

-- 3. Devuelve un listado que muestre los clientes que no han realizado ning�n pago y los que no han realizado ning�n pedido.
SELECT cliente.nombre_cliente
FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
LEFT JOIN pedido ON pedido.codigo_cliente = pago.codigo_cliente
WHERE pedido.codigo_cliente IS NULL AND pago.codigo_cliente IS NULL;

-- 4. Devuelve un listado que muestre solo los empleados que no tienen una oficina asociada.
SELECT * 
FROM empleado
WHERE codigo_oficina IS NULL;

-- 5. Devuelve un listado que muestre solo los empleados que no tienen un cliente asociado.
SELECT *
FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventas IS NULL;

-- 6. Devuelve un listado que muestre solo los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
SELECT * FROM cliente;
SELECT * FROM oficina;
SELECT * FROM empleado;

SELECT empleado.nombre, cliente.codigo_cliente, oficina.codigo_oficina, oficina.pais, oficina.ciudad
FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE cliente.codigo_cliente IS NULL;

-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
SELECT empleado.nombre
FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE oficina.codigo_oficina IS NULL AND cliente.codigo_cliente IS NULL

-- 8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT DISTINCT(producto.nombre)
FROM producto
LEFT JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
LEFT JOIN pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
WHERE pedido.codigo_pedido IS NULL;

-- 9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripci�n y la imagen del producto.
SELECT * FROM gama_producto

SELECT DISTINCT(CAST(producto.nombre AS varchar)) AS nombre, CAST(producto.descripcion AS varchar) AS description, gama_producto.imagen
FROM producto
LEFT JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
LEFT JOIN pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
LEFT JOIN gama_producto ON gama_producto.gama = producto.gama
WHERE pedido.codigo_pedido IS NULL;

-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de alg�n cliente que haya realizado la compra de alg�n producto de la gama Frutales.



-- 11. Devuelve un listado con los clientes que han realizado alg�n pedido, pero no han realizado ning�n pago.


-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
