-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. 
--    Ten en cuenta que pueden existir clientes que no hayan realizado ningún pedido.
--    (Consulta con LEFT JOIN y GROUP BY)
SELECT cliente.codigo_cliente, cliente.nombre_cliente, COUNT(pedido.codigo_cliente) as cant_pedidos
FROM pedido
LEFT JOIN cliente ON cliente.codigo_cliente = pedido.codigo_cliente
GROUP BY cliente.nombre_cliente, cliente.codigo_cliente
ORDER BY cliente.codigo_cliente


-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. 
--    Ten en cuenta que pueden existir clientes que no hayan realizado ningún pago.
--    (Consulta con LEFT JOIN y GROUP BY)
SELECT cliente.nombre_cliente, SUM(pago.total) AS total_pagado
FROM pago
LEFT JOIN cliente ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY cliente.nombre_cliente

-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008, ordenados alfabéticamente de menor a mayor.
--    (Consulta con JOIN, WHERE y ORDER BY)
SELECT DISTINCT(cliente.nombre_cliente)
FROM cliente
JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE YEAR(pedido.fecha_pedido) = 2008
ORDER BY cliente.nombre_cliente

-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono
--    de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
--    (Consulta con LEFT JOIN, WHERE y SELECT)


-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas
--    y la ciudad donde está su oficina.
--    (Consulta con JOIN y SELECT)

-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representantes de ventas de ningún cliente.
--    (Consulta con LEFT JOIN, WHERE y SELECT)

-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
--    (Consulta con JOIN y GROUP BY)
