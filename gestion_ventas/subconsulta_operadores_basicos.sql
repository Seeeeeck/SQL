--Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

SELECT * FROM pedido p
WHERE p.id_cliente=(
      SELECT c.id FROM cliente c WHERE CONCAT(c.nombre," ",c.apellido1," ",c.apellido2)="Adela Salas Díaz"
)

--Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

SELECT count(p.id) AS "Cantidad de pedidos" FROM pedido p
WHERE p.id_comercial=(SELECT co.id FROM comercial co WHERE CONCAT(co.nombre," ",co.apellido1," ",co.apellido2)="Daniel Sáez Vega")


--Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

SELECT * FROM cliente cli
WHERE cli.id=(
      SELECT p.id_cliente FROM pedido p
      WHERE YEAR(p.fecha)=2019
      ORDER BY p.total DESC
      LIMIT 1
)

--Devuelve la fecha y la cantidad del pedido de menor 
--valor realizado por el cliente Pepe Ruiz Santana.

SELECT * FROM pedido;

SELECT p.fecha,p.total
FROM pedido p
WHERE p.id_cliente=(
      SELECT c.id FROM cliente c WHERE CONCAT(c.nombre," ",c.apellido1," ",c.apellido2)="Pepe Ruiz Santana"
      )
      AND p.total=(SELECT MIN(total) FROM pedido WHERE p.id=pedido.id)
ORDER BY p.total ASC
LIMIT 1


--Devuelve un listado con los datos de los clientes y los pedidos,
--de todos los clientes que han realizado un pedido durante el año 2017 con 
--un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

SELECT * FROM cliente c
         JOIN pedido p ON c.id=p.id_cliente
WHERE YEAR(p.fecha)=2017
      AND p.total>=(
          SELECT AVG(pe.total) FROM pedido pe
          WHERE YEAR(pe.fecha)=2017
          )
