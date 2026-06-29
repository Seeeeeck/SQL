--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT c.* FROM cliente c
                LEFT JOIN pago p ON c.codigo_cliente=p.codigo_cliente
WHERE p.id_transaccion IS NULL;

--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

SELECT c.* FROM cliente c
              LEFT JOIN pedido p ON p.codigo_cliente=c.codigo_cliente
WHERE p.codigo_cliente IS NULL

--Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

SELECT c.nombre_cliente
FROM cliente c
      LEFT JOIN pedido p ON p.codigo_cliente=c.codigo_cliente
      LEFT JOIN pago pa ON pa.codigo_cliente=c.codigo_cliente
WHERE p.codigo_cliente IS NULL AND pa.codigo_cliente IS NULL


--Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

SELECT * FROM empleado e
              LEFT JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
WHERE o.codigo_oficina IS NULL   

--Devuelve un listado que muestre solamente los empleados que no tienen 
--un cliente asociado junto con los datos de la oficina donde trabajan.

SELECT e.nombre ,e.apellido1 ,e.apellido2,o.telefono FROM empleado e 
               LEFT JOIN cliente cli ON e.codigo_empleado=cli.codigo_empleado_rep_ventas
               LEFT JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
WHERE cli.codigo_cliente IS NULL


--Devuelve un listado que muestre los empleados que no tienen
--una oficina asociada y los que no tienen un cliente asociado.

SELECT e.nombre,e.apellido1 ,e.apellido2  FROM empleado e
              LEFT JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
WHERE o.codigo_oficina IS NULL 
UNION 
SELECT e.nombre,e.apellido1 ,e.apellido2  FROM empleado e
              LEFT JOIN cliente c ON c.codigo_empleado_rep_ventas=e.codigo_empleado
WHERE c.codigo_cliente IS NULL

--Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT p.* ,dp.* FROM producto p
               LEFT JOIN detalle_pedido dp ON dp.codigo_producto=p.codigo_producto
WHERE dp.codigo_pedido IS NULL

--Devuelve un listado de los productos que nunca han aparecido en 
--un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

SELECT p.nombre,p.descripcion,"" AS "Imagen" FROM producto p
               LEFT JOIN detalle_pedido dp ON dp.codigo_producto=p.codigo_producto
WHERE dp.codigo_pedido IS NULL

--Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
--representantes de ventas de algún cliente que haya 
--realizado la compra de algún producto de la gama Frutales.

SELECT * FROM oficina ofi
WHERE ofi.codigo_oficina NOT IN(
           SELECT DISTINCT(o.codigo_oficina) FROM oficina o
           LEFT JOIN empleado e ON e.codigo_oficina=o.codigo_oficina
           JOIN cliente c ON c.codigo_empleado_rep_ventas=e.codigo_empleado
           JOIN pedido p ON p.codigo_cliente=c.codigo_cliente
           JOIN detalle_pedido dp ON dp.codigo_pedido=p.codigo_pedido
           JOIN producto pro ON pro.codigo_producto=dp.codigo_producto
           WHERE pro.gama="Frutales"
)

--Devuelve un listado con los clientes que han
--realizado algún pedido pero no han realizado ningún pago.

SELECT DISTINCT c.* FROM cliente c
                     JOIN pedido p ON p.codigo_cliente=c.codigo_cliente
                     LEFT JOIN pago pa ON pa.codigo_cliente=c.codigo_cliente
WHERE pa.codigo_cliente IS NULL


--Devuelve un listado con los datos de los empleados 
--que no tienen clientes asociados y el nombre de su jefe asociado.

SELECT 
e.*,
(SELECT ej.nombre FROM empleado ej WHERE ej.codigo_empleado=e.codigo_jefe) AS "Nombre del jefe"
FROM empleado e
                LEFT JOIN cliente c ON c.codigo_empleado_rep_ventas=e.codigo_empleado
WHERE c.codigo_cliente IS NULL
                
          


