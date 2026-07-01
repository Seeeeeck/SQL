--Devuelve un listado con todos los pedidos que se han realizado. 
--Los pedidos deben estar ordenados por la fecha de realización, 
--mostrando en primer lugar los pedidos más recientes.

SELECT * FROM  pedido
ORDER BY fecha DESC

--Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * FROM pedido
ORDER BY total DESC
LIMIT 2

--Devuelve un listado con los identificadores de los clientes 
--que han realizado algún pedido. Tenga en cuenta que no debe 
--mostrar identificadores que estén repetidos.


SELECT DISTINCT(p.id_cliente) FROM pedido p


--Devuelve un listado de todos los pedidos que se 
--realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

SELECT * FROM pedido
WHERE total>500 AND YEAR(fecha)=2017


--Devuelve un listado con el nombre y los 
--apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT CONCAT(nombre," ",apellido1," ",apellido2),comision FROM comercial
WHERE comision BETWEEN 0.05 AND 0.11;

--Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT MAX(comision) FROM comercial;

--Devuelve el identificador, nombre y primer apellido de aquellos
--clientes cuyo segundo apellido no es NULL. 
--El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT id,nombre,apellido1,apellido2 FROM cliente
WHERE apellido2 IS NOT NULL
ORDER BY nombre ASC, apellido1 ASC;

--Devuelve un listado de los nombres de los clientes que empiezan por A
--y terminan por n y también los nombres que empiezan por P. 
--El listado deberá estar ordenado alfabéticamente.

SELECT c.nombre FROM cliente c
WHERE c.nombre LIKE 'A%n' OR c.nombre LIKE 'P%'
ORDER BY c.nombre ASC

--Devuelve un listado de los nombres de los clientes que
--no empiezan por A. El listado deberá estar ordenado alfabéticamente.

SELECT c.nombre FROM cliente c
WHERE c.nombre NOT LIKE 'A%'
ORDER BY c.nombre ASC

--Devuelve un listado con los nombres de los comerciales que 
--terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

SELECT DISTINCT(nombre) FROM comercial
WHERE nombre LIKE '%o'


