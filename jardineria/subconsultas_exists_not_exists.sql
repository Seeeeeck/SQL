--Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
--Donde codigo_cliente no exista en pago

SELECT * FROM cliente c
WHERE NOT EXISTS(
      SELECT 1 FROM pago p
               WHERE p.codigo_cliente=c.codigo_cliente 
)


--Devuelve un listado que muestre solamente los clientes que
--sí han realizado algún pago.

SELECT * FROM cliente c
WHERE  EXISTS(
      SELECT 1 FROM pago p
               WHERE p.codigo_cliente=c.codigo_cliente 
)

--Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT * FROM producto p
WHERE NOT EXISTS(
      SELECT 1 FROM detalle_pedido dp
      WHERE dp.codigo_producto=p.codigo_producto
)


--Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

SELECT * FROM producto p
WHERE EXISTS(
      SELECT 1 FROM detalle_pedido dp
      WHERE dp.codigo_producto=p.codigo_producto
)