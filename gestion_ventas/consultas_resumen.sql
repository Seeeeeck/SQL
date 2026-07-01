--Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

SELECT SUM(total) AS "Total de pedidos" FROM pedido;

--Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

SELECT AVG(total) AS "Media de pedidos" from pedido;


--Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

SELECT COUNT(DISTINCT(p.id_comercial)) AS "Total comerciales distintos" FROM pedido p;

--Calcula el número total de clientes que aparecen en la tabla cliente.

SELECT COUNT(c.id) AS "Total de clientes" FROM cliente c;

--Calcula cuál es la mayor cantidad que aparece en la tabla pedido

SELECT MAX(total) FROM pedido;

--Calcula cuál es la menor cantidad que aparece en la tabla pedido

SELECT MIN(total) FROM pedido;

--Calcula cuál es el valor máximo de categoría para
--cada una de las ciudades que aparece en la tabla cliente.

SELECT ciudad,MAX(categoria) 
FROM cliente
GROUP BY ciudad;

--Calcula cuál es el máximo valor de los pedidos realizados 
--durante el mismo día para cada uno de los clientes. 
--Es decir, el mismo cliente puede haber realizado 
--varios pedidos de diferentes cantidades el mismo día. Se pide 
--que se calcule cuál es el pedido de máximo valor para cada uno 
--de los días en los que un cliente ha realizado un pedido. 
--Muestra el identificador del cliente, nombre, 
--apellidos, la fecha y el valor de la cantidad.

SELECT cli.id,cli.nombre,cli.apellido1,cli.apellido2,p.fecha, MAX(p.total) FROM pedido p
                           JOIN cliente cli ON cli.id=p.id_cliente 
GROUP BY cli.id,p.fecha;


--Calcula cuál es el máximo valor de los pedidos realizados durante el mismo
--día para cada uno de los clientes, teniendo en cuenta que sólo
--queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

SELECT 
cli.id as "Cliente",
p.fecha, MAX(p.total) AS "Máximo total"
                       FROM pedido p
                       JOIN cliente cli ON cli.id=p.id_cliente
GROUP BY p.fecha,cli.id
HAVING MAX(p.total)>2000;

--Calcula el máximo valor de los pedidos realizados para cada
--uno de los comerciales durante la fecha 2016-08-17. 
--Muestra el identificador del comercial, nombre, apellidos y total.

SELECT c.id,c.nombre,c.apellido1,c.apellido2,MAX(p.total) FROM pedido p
                    JOIN comercial c ON p.id_comercial=c.id
WHERE p.fecha="2016-08-17"
GROUP BY c.id


--Devuelve un listado con el identificador de cliente, nombre y apellidos
--y el número total de pedidos que ha realizado cada uno de clientes. 
--Tenga en cuenta que pueden existir clientes que no han realizado ningún 
--pedido. Estos clientes también deben aparecer en el listado 
--indicando que el número de pedidos realizados es 0.

SELECT
c.id,
c.nombre,
c.apellido1,
c.apellido2,
COUNT(p.id) AS "Total de pedidos"
FROM cliente c
     LEFT JOIN pedido p ON p.id_cliente=c.id
GROUP BY c.id


--Devuelve un listado con el identificador de cliente, nombre 
--y apellidos y el número total de pedidos que ha realizado
--cada uno de clientes durante el año 2017.

SELECT
c.id,
c.nombre,
c.apellido1,
c.apellido2,
COUNT(p.id) AS "Total de pedidos"
FROM cliente c
     LEFT JOIN pedido p ON p.id_cliente=c.id
WHERE YEAR(p.fecha)=2017
GROUP BY c.id


--Devuelve un listado que muestre el identificador de cliente, 
--nombre, primer apellido y el valor de la máxima cantidad del 
--pedido realizado por cada uno de los clientes. El resultado debe 
--mostrar aquellos clientes que no han realizado ningún pedido
--indicando que la máxima cantidad de sus pedidos
--realizados es 0. Puede hacer uso de la función IFNULL.

SELECT
c.id,
c.nombre,
c.apellido1,
MAX(p.id) AS "Maximo de pedidos"
FROM cliente c
     LEFT JOIN pedido p ON p.id_cliente=c.id
GROUP BY c.id
HAVING MAX(p.id) IS NULL

--Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

SELECT YEAR(p.fecha), MAX(p.total) AS "Pedido máximo" FROM pedido p
GROUP BY 1

--Devuelve el número total de pedidos que se han realizado cada año.
SELECT YEAR(p.fecha), COUNT(p.total) AS "Pedido máximo" FROM pedido p
GROUP BY 1