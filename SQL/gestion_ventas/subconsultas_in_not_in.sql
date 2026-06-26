--Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM cliente
WHERE id NOT IN (SELECT id_cliente FROM pedido)

--Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT * FROM comercial
WHERE id NOT IN (SELECT id_comercial FROM pedido)