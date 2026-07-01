--¿Cuántos empleados hay en la compañía?

SELECT COUNT(codigo_empleado) AS "Cantidad de empleados " FROM empleado;

--¿Cuántos clientes tiene cada país?

SELECT pais,COUNT(codigo_cliente) AS "Cantidad de clientes"
FROM cliente
GROUP BY pais;

--¿Cuál fue el pago medio en 2009?

SELECT AVG(total) AS "Pago medio" FROM pago
WHERE YEAR(fecha_pago)=2009;


--¿Cuántos pedidos hay en cada estado? Ordena el resultado
--de forma descendente por el número de pedidos.

SELECT estado, COUNT(codigo_pedido) AS "Pedidos" 
FROM pedido
GROUP BY estado
ORDER BY 2 DESC;

--Calcula el precio de venta del producto más caro y más barato en una misma consulta.

SELECT MAX(precio_venta),MIN(precio_venta) 
FROM producto;

--Calcula el número de clientes que tiene la empresa.

SELECT COUNT(codigo_cliente) FROM cliente;

--Calcula el número de clientes que tiene la empresa.

SELECT COUNT(codigo_cliente) AS "Número de clientes" FROM cliente;

--¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

SELECT COUNT(codigo_cliente) AS "Clientes con domicilio en la ciudad de madrid"
FROM cliente 
WHERE ciudad="Madrid";

----¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

SELECT ciudad, COUNT(codigo_cliente) AS "Clientes"
FROM cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad

--Devuelve el nombre de los representantes de ventas 
--y el número de clientes al que atiende cada uno.

SELECT 
CONCAT(e.nombre," ",e.apellido1," ",e.apellido2) AS "Representante de ventas",
COUNT(c.codigo_cliente) AS "Número de clientes"
FROM empleado e
     JOIN  cliente c ON c.codigo_empleado_rep_ventas=e.codigo_empleado
WHERE e.puesto="Representante Ventas"
GROUP BY e.codigo_empleado;


--Calcula el número de clientes que no tiene asignado representante de ventas.

SELECT COUNT(c.codigo_cliente) 
FROM cliente c
WHERE c.codigo_empleado_rep_ventas IS NULL

--Calcula la fecha del primer y último pago realizado por cada
--uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

SELECT 
MIN(p.fecha_pago) AS "Primer pago",
MAX(p.fecha_pago) AS "Último pago",
c.nombre_cliente
FROM pago p
     JOIN cliente c ON c.codigo_cliente=p.codigo_cliente
GROUP BY c.codigo_cliente

--Calcula el número de productos diferentes que hay en cada uno de los pedidos.

SELECT codigo_pedido, COUNT(DISTINCT(codigo_producto)) as cantidad_productos_diferentes
FROM detalle_pedido
GROUP BY codigo_pedido

--Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

SELECT codigo_pedido, SUM(cantidad) as cantidad_total
FROM detalle_pedido
GROUP BY codigo_pedido

--Devuelve un listado de los 20 productos más vendidos y el número total de 
--unidades que se han vendido de cada uno. El listado deberá estar ordenado
--por el número total de unidades vendidas.

SELECT
p.codigo_producto,
p.nombre AS nombre_producto,
COUNT(dp.codigo_producto) AS total_unidades
FROM producto p
     JOIN detalle_pedido dp ON dp.codigo_producto=p.codigo_producto
GROUP BY p.codigo_producto
ORDER BY 3 DESC;

--La facturación que ha tenido la empresa en toda la historia, indicando la
--base imponible, el IVA y el total facturado. La base imponible se calcula
--sumando el coste del producto por el número de unidades vendidas de la tabla
--detalle_pedido. El IVA es el 21 % de la base imponible, 
--y el total la suma de los dos campos anteriores.


SELECT 
SUM(cantidad*precio_unidad) AS base_imponible ,
SUM(cantidad*precio_unidad)*0.21 AS iva ,
SUM(cantidad*precio_unidad)+SUM(cantidad*precio_unidad)*0.21 AS total
FROM detalle_pedido

--La misma información que en la pregunta anterior, pero agrupada por código de producto.

SELECT 
SUM(cantidad*precio_unidad) AS base_imponible ,
SUM(cantidad*precio_unidad)*0.21 AS iva ,
SUM(cantidad*precio_unidad)+SUM(cantidad*precio_unidad)*0.21 AS total
FROM detalle_pedido
GROUP BY codigo_producto


--La misma información que en la pregunta anterior, pero 
--agrupada por código de producto filtrada por los códigos que empiecen por OR.

SELECT 
codigo_producto,
SUM(cantidad*precio_unidad) AS base_imponible ,
SUM(cantidad*precio_unidad)*0.21 AS iva ,
SUM(cantidad*precio_unidad)+SUM(cantidad*precio_unidad)*0.21 AS total
FROM detalle_pedido
WHERE codigo_producto LIKE 'OR%'
GROUP BY codigo_producto

--Lista las ventas totales de los productos que hayan facturado
--más de 3000 euros. Se mostrará el nombre, unidades vendidas, 
--total facturado y total facturado con impuestos (21% IVA).

SELECT 
dp.codigo_producto,
p.nombre,
SUM(dp.cantidad) AS unidades_vendidas,
SUM(dp.cantidad*dp.precio_unidad) AS ventas_totales,
SUM(dp.cantidad*dp.precio_unidad)+SUM(dp.cantidad*dp.precio_unidad)*0.21 AS total_facturado
FROM detalle_pedido dp
     JOIN producto p ON p.codigo_producto=dp.codigo_producto
GROUP BY dp.codigo_producto
HAVING SUM(dp.cantidad*dp.precio_unidad)>3000;

--Muestre la suma total de todos los pagos que se realizaron
--para cada uno de los años que aparecen en la tabla pagos.

SELECT 
DISTINCT(YEAR(fecha_pago)) AS año,
SUM(total) AS total
FROM pago
GROUP BY YEAR(fecha_pago)


