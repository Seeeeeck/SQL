--Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT 
f.nombre,
p.precio AS 'Precio del producto más caro'
FROM fabricante f
     JOIN producto p
     ON f.id=p.id_fabricante
WHERE p.precio=(
      SELECT MAX(pro.precio) FROM producto pro
      WHERE pro.id_fabricante=f.id
);



--Devuelve un listado de todos los productos que tienen
--un precio mayor o igual a la media de todos los productos de su mismo fabricante.

SELECT * FROM producto p
WHERE p.precio>=(
      SELECT AVG(pro.precio) FROM producto pro
      WHERE pro.id_fabricante = p.id_fabricante
)


--Lista el nombre del producto más caro del fabricante Lenovo.

SELECT p.nombre ,p.precio
FROM producto p
JOIN fabricante f
     ON f.id=p.id_fabricante
WHERE f.nombre="Lenovo" AND p.precio=(
                            SELECT MAX(pro.precio) FROM producto pro
                                                   JOIN fabricante fa
                                                   ON fa.id=pro.id_fabricante
                            WHERE fa.id=f.id
                                                                                                           
 )