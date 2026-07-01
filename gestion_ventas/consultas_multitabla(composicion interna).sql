--Devuelve un listado con el identificador, nombre y 
--los apellidos de todos los clientes que han
--realizado algún pedido. El listado debe estar ordenado
--alfabéticamente y se deben eliminar los elementos repetidos.


SELECT DISTINCT(c.id),c.nombre,c.apellido1,c.apellido2 FROM cliente c
                                                       JOIN pedido p ON p.id_cliente=c.id
ORDER BY c.nombre ASC,c.apellido1 ASC,c.apellido2 ASC


--Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
--El resultado debe mostrar todos los datos de los pedidos y del cliente. 
--El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT * FROM pedido p
         JOIN cliente c ON p.id_cliente=c.id
ORDER BY c.nombre ASC


--Devuelve un listado que muestre todos los clientes, con todos
--los pedidos que han realizado y con los datos de los
--comerciales asociados a cada pedido.

SELECT * FROM cliente c
         JOIN pedido p ON p.id_cliente=c.id
         JOIN comercial co ON co.id=p.id_comercial

--Devuelve un listado de todos los clientes que realizaron 
--un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

SELECT * FROM cliente c
         JOIN pedido p ON p.id_cliente=c.id
WHERE YEAR(p.fecha)=2017 AND p.total BETWEEN 300 AND 1000


--Devuelve el nombre y los apellidos de todos los comerciales 
--que ha participado en algún pedido realizado por María Santana Moreno.                                             

SELECT c.nombre,c.apellido1,c.apellido2 FROM comercial c
                                        JOIN pedido p ON p.id_comercial=c.id
                                        JOIN cliente cli ON cli.id=p.id_cliente
WHERE CONCAT(cli.nombre," ",cli.apellido1," ",cli.apellido2)="María Santana Moreno"


--Devuelve el nombre de todos los clientes que han realizado
--algún pedido con el comercial Daniel Sáez Vega.

SELECT c.nombre FROM cliente c
                JOIN pedido p ON c.id=p.id_cliente
                JOIN comercial co ON co.id=p.id_comercial

WHERE CONCAT(co.nombre," ",co.apellido1," ",co.apellido2)="Daniel Sáez Vega"
GROUP BY c.id

      