--Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

SELECT c.nombre_cliente,CONCAT(e.nombre," ",e.apellido1) AS "Nombre del representante"
FROM cliente c
     JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas


--Muestra el nombre de los clientes que hayan realizado 
--pagos junto con el nombre de sus representantes de ventas.

SELECT DISTINCT(c.nombre_cliente),CONCAT(e.nombre," ",e.apellido1) AS "Representante"  
FROM cliente c
     JOIN pago p ON p.codigo_cliente=c.codigo_cliente
     JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
                
--Muestra el nombre de los clientes que no hayan realizado 
--pagos junto con el nombre de sus representantes de ventas.

SELECT c.nombre_cliente,CONCAT(e.nombre," ",e.apellido1) AS "Representante"  
FROM cliente c
     JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)



--Devuelve el nombre de los clientes que han hecho pagos y el nombre de
--sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT DISTINCT(c.nombre_cliente),CONCAT(e.nombre," ",e.apellido1) AS "Representante",o.ciudad  
FROM cliente c
     JOIN pago p ON p.codigo_cliente=c.codigo_cliente
     JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
     JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
     

--Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de
--sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT c.nombre_cliente,CONCAT(e.nombre," ",e.apellido1) AS "Representante", o.ciudad
FROM cliente c
     JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
     JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)


--Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT DISTINCT(o.linea_direccion1) FROM oficina o
                                    JOIN empleado e ON e.codigo_oficina=o.codigo_oficina
                                    JOIN cliente c ON c.codigo_empleado_rep_ventas=e.codigo_empleado
WHERE c.ciudad="Fuenlabrada"


----Devuelve el nombre de los clientes y el nombre de sus representantes
--junto con la ciudad de la oficina a la que pertenece el representante.

SELECT c.nombre_cliente,e.nombre,o.ciudad FROM cliente c
                                          JOIN empleado e ON e.codigo_empleado=c.codigo_empleado_rep_ventas
                                          JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
                            

--Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT
e.nombre,
(SELECT nombre FROM empleado WHERE codigo_empleado=e.codigo_jefe) AS "Jefe"
FROM empleado e

--Devuelve un listado que muestre el nombre de cada empleados, 
--el nombre de su jefe y el nombre del jefe de sus jefe.

SELECT
e.nombre AS "Empleado",
(SELECT em.nombre FROM empleado em WHERE em.codigo_empleado=e.codigo_jefe) AS "Jefe",
(SELECT emp.nombre FROM empleado emp WHERE emp.codigo_empleado=(SELECT em.codigo_jefe FROM empleado em WHERE em.codigo_empleado=e.codigo_jefe)) AS "Jefe del jefe"
FROM empleado e

--Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT DISTINCT(c.nombre_cliente) FROM cliente c
                                  JOIN pedido p ON p.codigo_cliente=c.codigo_cliente
WHERE p.fecha_entrega>p.fecha_esperada;


--Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT DISTINCT(p.gama),CONCAT(c.nombre_cliente," ",c.apellido_contacto) AS "Cliente" 
FROM producto p
     JOIN detalle_pedido dp ON dp.codigo_producto=p.codigo_producto
     JOIN pedido pe ON pe.codigo_pedido=dp.codigo_pedido
     JOIN cliente c ON c.codigo_cliente=pe.codigo_cliente;



 
                                
