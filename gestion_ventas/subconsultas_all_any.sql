--Devuelve el pedido más caro que existe en 
--la tabla pedido sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT * FROM pedido p
WHERE p.total>= ALL(SELECT total FROM pedido)

--Devuelve un listado de los clientes que no 
--han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT * FROM cliente c
WHERE c.id<> ALL (SELECT p.id_cliente FROM pedido p)

--Devuelve un listado de los comerciales que no 
--han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT * FROM comercial c
WHERE c.id<>ALL(SELECT id_comercial FROM pedido)