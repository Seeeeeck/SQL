--Devuelve los nombres de los fabricantes que tienen
--productos asociados. (Utilizando IN o NOT IN).

SELECT f.nombre FROM fabricante f
WHERE f.id IN (
           SELECT p.id_fabricante FROM producto p
)


--Devuelve los nombres de los fabricantes que no
--tienen productos asociados. (Utilizando IN o NOT IN).

SELECT f.nombre FROM fabricante f
WHERE f.id NOT IN (
           SELECT p.id_fabricante FROM producto p
)
