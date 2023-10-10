-- SELECTS Generales
SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT nombre_cliente AS cliente, empleado.nombre + ' ' + empleado.apellido1 AS representante_ventas
FROM cliente
JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE empleado.puesto = 'Representante Ventas'; 

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT 
  DISTINCT(cliente.nombre_cliente), 
  pago.fecha_pago, 
  empleado.nombre,
  empleado.puesto
FROM 
  cliente
JOIN 
  pago ON pago.codigo_cliente = cliente.codigo_cliente
JOIN 
  empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE 
  empleado.puesto = 'Representante Ventas';

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT 
	DISTINCT(cliente.nombre_cliente), 
	empleado.nombre AS nombre_representante
FROM 
	cliente
LEFT OUTER JOIN 
	pago ON pago.codigo_cliente = cliente.codigo_cliente
JOIN 
	empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE 
	pago.id_transaccion IS NULL AND empleado.puesto = 'Representante Ventas';

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
  DISTINCT(cliente.nombre_cliente), 
  oficina.ciudad AS ciudad_oficina,
  empleado.nombre AS nombre_rep,
  empleado.puesto
FROM 
  cliente
JOIN 
  pago ON pago.codigo_cliente = cliente.codigo_cliente
JOIN 
  empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
JOIN
  oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE 
  empleado.puesto = 'Representante Ventas';

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
	DISTINCT(cliente.nombre_cliente), 
	empleado.nombre AS nombre_representante,
	oficina.ciudad
FROM 
	cliente
LEFT OUTER JOIN 
	pago ON pago.codigo_cliente = cliente.codigo_cliente
JOIN 
	empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
JOIN
    oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE 
	pago.id_transaccion IS NULL AND empleado.puesto = 'Representante Ventas';

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT oficina.codigo_oficina, oficina.linea_direccion1, cliente.nombre_cliente, cliente.ciudad
FROM oficina
JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina
JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.ciudad = 'Fuenlabrada';

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.



-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

-- 9. Devuelve un listado que muestre el nombre de cada empleado, el nombre de su jefe y el nombre del jefe de su jefe.

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
