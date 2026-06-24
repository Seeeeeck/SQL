--Devuelve un listado con todos los clientes junto con los datos 
--de los pedidos que han realizado. Este listado también debe 
--incluir los clientes que no han realizado ningún pedido.
--El listado debe estar ordenado alfabéticamente por
--el primer apellido, segundo apellido y nombre de los clientes.

SELECT * FROM cliente c
         LEFT JOIN pedido p ON p.id_cliente=c.id
ORDER BY c.apellido1 ASC, c.apellido2 ASC, c.nombre ASC


--Devuelve un listado con todos los comerciales junto con los datos
--de los pedidos que han realizado. Este listado también debe incluir
--los comerciales que no han realizado ningún pedido. El listado debe
--estar ordenado alfabéticamente por el primer apellido, 
--segundo apellido y nombre de los comerciales.

SELECT * FROM comercial c
         LEFT JOIN pedido p ON p.id_comercial=c.id
ORDER BY c.apellido1 ASC, c.apellido2 ASC , c.nombre ASC


--Devuelve un listado que solamente muestre
--los clientes que no han realizado ningún pedido.

SELECT c.* FROM cliente c
         LEFT OUTER JOIN pedido p ON p.id_cliente=c.id
WHERE p.id IS NULL


--Devuelve un listado que solamente muestre
--los comerciales que no han realizado ningún pedido.

SELECT c.* FROM comercial c
           LEFT JOIN pedido p on p.id_comercial=c.id
WHERE p.id IS NULL

--Devuelve un listado con los clientes que no han 
--realizado ningún pedido y de los comerciales que no han
--participado en ningún pedido. Ordene el listado alfabéticamente
--por los apellidos y el nombre. En en listado
--deberá diferenciar de algún modo los clientes y los comerciales.

SELECT "Cliente",c.nombre,c.apellido1,c.apellido2   FROM cliente c
         LEFT OUTER JOIN pedido p ON p.id_cliente=c.id
WHERE p.id IS NULL 
UNION
SELECT "Comercial",co.nombre,co.apellido1,co.apellido2 FROM comercial co
                          LEFT JOIN pedido pe ON pe.id_comercial=co.id
WHERE pe.id_comercial IS NULL


--¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.

--NATURAL JOIN solo se debe usar si existen las mismas columnas, pero no se recomienda porque puede relacionar datos sin querer.