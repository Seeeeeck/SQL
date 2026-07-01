--Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

SELECT nombre,apellido1,puesto 
FROM empleado
WHERE codigo_empleado NOT IN (
      SELECT codigo_empleado_rep_ventas FROM cliente
)

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT * FROM cliente
WHERE codigo_cliente NOT IN(
      SELECT codigo_cliente FROM pago
)

--Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

SELECT * FROM cliente
WHERE codigo_cliente IN(
      SELECT codigo_cliente FROM pago
)


--Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT * FROM producto
WHERE codigo_producto NOT IN (
      SELECT codigo_producto FROM detalle_pedido
)

--Devuelve el nombre, apellidos, puesto y teléfono de la oficina 
--de aquellos empleados que no sean representante de ventas de ningún cliente.

SELECT 
e.nombre ,e.apellido1,e.apellido2 ,e.puesto,o.telefono
FROM  empleado e
      JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
WHERE e.codigo_empleado NOT IN(
      SELECT codigo_empleado_rep_ventas FROM cliente
)


--Devuelve las oficinas donde no trabajan ninguno de los empleados 
--que hayan sido los representantes de ventas de algún cliente que 
--haya realizado la compra de algún producto de la gama Frutales.

SELECT codigo_oficina FROM oficina
WHERE codigo_oficina NOT IN ( 
      SELECT DISTINCT(codigo_oficina) FROM empleado
      WHERE puesto="Representante Ventas" AND codigo_empleado = ANY ( 
                                              SELECT codigo_empleado_rep_ventas FROM cliente
                                              WHERE codigo_cliente = ANY (
                                                    SELECT codigo_cliente FROM pedido
                                                    WHERE codigo_pedido = ANY(
                                                           SELECT codigo_pedido FROM detalle_pedido
                                                           WHERE codigo_producto = ANY (
                                                                 SELECT codigo_producto FROM producto
                                                                 WHERE gama="Frutales"
                                                           )
                                                    )
                                              )
                                              )
                                            
)


--Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

SELECT * FROM cliente
WHERE codigo_cliente =ANY (
      SELECT codigo_cliente FROM pedido
      WHERE codigo_cliente NOT IN (
            SELECT codigo_cliente FROM pago
      )
)