--1.1.7.1 Con operadores básicos de comparación

--Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto p
WHERE p.id_fabricante=(SELECT f.id FROM fabricante f WHERE f.nombre="Lenovo");

--Devuelve todos los datos de los productos que tienen el
--mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT * FROM producto p
HAVING p.precio=(
SELECT 
MAX(p.precio) 
FROM producto p
     JOIN fabricante f
     ON f.id=p.id_fabricante
WHERE f.nombre="Lenovo"
)


--Lista el nombre del producto más caro del fabricante Lenovo.
--La consulta interna debe depender de la externa porque compara los productos
--En el caso de querer obtener de todos los productos no se necesita el on

SELECT p.nombre,p.precio,f.nombre FROM fabricante f
                                  JOIN producto p
                                   ON p.id_fabricante=f.id
WHERE f.nombre="Lenovo" AND p.precio=(
              SELECT MAX(precio)FROM producto 
                                JOIN fabricante
                                ON f.id=producto.id_fabricante)

--Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT p.nombre,p.precio FROM producto p
                JOIN fabricante f
                ON p.id_fabricante= f.id
WHERE f.nombre="Hewlett-Packard" AND p.precio=(
                                     SELECT MIN(precio) FROM producto 
                                                        JOIN fabricante
                                                        ON fabricante.id=p.id_fabricante
) 



--Devuelve todos los productos de la base de datos que
--tienen un precio mayor o igual al producto más caro del fabricante Lenovo.

--En sql playground esta consulta no funciona , el autor quizás redactó mal el enunciado

SELECT * FROM producto p
WHERE p.precio>=(
      SELECT MAX(pro.precio) FROM producto pro
                             JOIN fabricante fa
                              ON pro.id_fabricante=fa.id
      WHERE fa.nombre="Lenovo"
)


