--1.1.7.2 Subconsultas con ALL y ANY

--ANY si es que alguno cumple la condición
--ALL si es que todos cumplen la condicion

--Devuelve el producto más caro que existe 
--en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT * FROM producto p
WHERE p.precio >= ALL(
                 SELECT precio FROM producto
)


--Devuelve el producto más barato que existe 
--en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT * FROM producto p
WHERE precio<=ALL(
              SELECT precio FROM producto
)


--Devuelve los nombres de los fabricantes que 
--tienen productos asociados. (Utilizando ALL o ANY).

-- Si f.id es igual algun id de fabricante que esta en producto entonces devolver el nombre
SELECT f.nombre FROM fabricante f
WHERE f.id=ANY(
           SELECT pro.id_fabricante FROM producto pro
)


--Devuelve los nombres de los fabricantes que 
--no tienen productos asociados. (Utilizando ALL o ANY).
--Si no hay un f.id en los pro.id_fabricante entonces devolver el nombre
SELECT f.nombre FROM fabricante f
WHERE f.id!=ALL(
           SELECT pro.id_fabricante FROM producto pro
)
