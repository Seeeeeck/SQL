--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

--evalua que el cliente no exista en el pedido y muestra los clientes sin pedido
SELECT * FROM cliente c
WHERE NOT EXISTS(
      SELECT 1 FROM pedido
      WHERE pedido.id_cliente=c.id
      )

--

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT * FROM comercial c
WHERE NOT EXISTS(
      SELECT 1 FROM pedido
      WHERE pedido.id_comercial=c.id
      )