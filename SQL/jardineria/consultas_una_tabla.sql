--Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT codigo_oficina, ciudad FROM oficina

--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

SELECT ciudad,telefono FROM oficina WHERE pais="España"

--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT nombre,apellido1,apellido2,email 
FROM  empleado
WHERE codigo_jefe=7

--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT puesto,nombre,apellido1,apellido2,email 
FROM empleado 
WHERE puesto ="Director General"

--Devuelve un listado con el nombre, apellidos y 
--puesto de aquellos empleados que no sean representantes de ventas.

SELECT nombre,apellido1,apellido2,puesto 
FROM empleado
WHERE puesto <> "Representante Ventas"

--Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT * FROM cliente
WHERE pais="Spain"

--Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT DISTINCT(estado) FROM pedido;


--Devuelve un listado con el código de cliente de aquellos clientes que 
--realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
--aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta

SELECT DISTINCT(codigo_cliente) FROM pago
WHERE YEAR(fecha_pago)=2008

SELECT DISTINCT(codigo_cliente) FROM pago
WHERE DATE_FORMAT(fecha_pago,'%Y')=2008

SELECT DISTINCT(codigo_cliente) FROM pago
WHERE SUBSTR(fecha_pago,1,4)=2008

--Devuelve un listado con el código de pedido, código de cliente,
--fecha esperada y fecha de entrega de los pedidos cuya 
--fecha de entrega ha sido al menos dos días antes de la fecha esperada.

SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada,fecha_entrega)>=2;


--Utilizando la función ADDDATE de MySQL.

SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
FROM pedido
WHERE ADDDATE(fecha_entrega, INTERVAL 2 DAY)<=fecha_esperada

--Utilizando la función DATEDIFF de MySQL.

SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
FROM pedido
WHERE DATEDIFF(fecha_esperada,fecha_entrega)>=2


----¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?


SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
FROM pedido
WHERE fecha_entrega+2<=fecha_esperada

SELECT codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
FROM pedido
WHERE  fecha_esperada-2>=fecha_entrega


--Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

SELECT * FROM pedido
WHERE estado="Rechazado" AND YEAR(fecha_pedido)=2009

--Devuelve un listado de todos los pedidos que han
--sido entregados en el mes de enero de cualquier año.

SELECT * FROM pedido
WHERE MONTH(fecha_entrega)=1


--Devuelve un listado con todos los pagos que se realizaron 
--en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

SELECT * FROM pago
WHERE YEAR(fecha_pago)=2008 AND forma_pago="PayPal"
ORDER BY total ASC


--Devuelve un listado con todas las formas de pago que 
--aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

SELECT DISTINCT(forma_pago) FROM pago

--Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y 
--que tienen más de 100 unidades en stock. El listado deberá estar ordenado por 
--su precio de venta, mostrando en primer lugar los de mayor precio.

SELECT * FROM producto
WHERE gama="Ornamentales" AND cantidad_en_stock>100
ORDER BY precio_venta DESC

--Devuelve un listado con todos los clientes que sean de la 
--ciudad de Madrid y cuyo representante de ventas tenga 
--el código de empleado 11 o 30.

SELECT * FROM cliente
WHERE ciudad="Madrid" AND codigo_empleado_rep_ventas IN(11,30)