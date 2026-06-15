--Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT 
p.nombre,
p.precio,
f.nombre 
FROM producto as p
     JOIN fabricante as f
     ON p.id_fabricante=f.id;



--Devuelve una lista con el nombre del producto, precio y nombre de fabricante
--de todos los productos de la base de datos. Ordene
--el resultado por el nombre del fabricante, por orden alfabético.

SELECT 
p.nombre as 'producto',
p.precio,
f.nombre as 'fabricante'
FROM producto as p
     JOIN fabricante as f
     ON p.id_fabricante=f.id
ORDER BY f.nombre ASC;



--Devuelve una lista con el identificador del producto, nombre del producto,
--identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT
p.id as 'identificador del producto',
p.nombre as 'nombre del producto',
f.id as 'identificacion del fabricante',
f.nombre as 'nombre del fabricante'
FROM producto as p
     JOIN fabricante as f
     ON p.id_fabricante=f.id;

--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT 
p.nombre as 'nombre de producto' , 
p.precio as 'precio del producto',
f.nombre as 'nombre del fabricante'
FROM producto as p
     JOIN fabricante f
     ON p.id_fabricante=f.id
ORDER BY p.precio ASC
LIMIT 1;


--Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT 
p.nombre as 'nombre de producto' , 
p.precio as 'precio del producto',
f.nombre as 'nombre del fabricante'
FROM producto as p
     JOIN fabricante f
     ON p.id_fabricante=f.id
ORDER BY p.precio DESC
LIMIT 1;


--Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT * FROM producto AS p
         JOIN fabricante AS f
         ON p.id_fabricante=f.id
WHERE f.nombre="Lenovo";



--Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT * FROM producto AS p
         JOIN fabricante AS f
         ON p.id_fabricante=f.id
WHERE f.nombre="Crucial" AND p.precio>200;


--Devuelve un listado con todos los productos de los fabricantes
-- Asus, Hewlett-Packard Seagate. Sin utilizar el operador IN.

SELECT * FROM producto AS p
         JOIN fabricante AS f
         ON p.id_fabricante=f.id
WHERE f.nombre="Asus" OR f.nombre="Hewlett-Packard" OR f.nombre="Seagate" ;


--Devuelve un listado con todos los productos de los
--fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.


SELECT * FROM producto AS p
         JOIN fabricante AS f
         ON p.id_fabricante=f.id
WHERE f.nombre IN("Asus","Hewlett-Packard","Seagate") ;



--Devuelve un listado con el nombre y el precio de todos
--los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT 
p.nombre as 'producto',
p.precio,
f.nombre as "fabricante" 
                         FROM producto p
                         JOIN fabricante f
                         ON p.id_fabricante=f.id
WHERE f.nombre LIKE '%e';


--Devuelve un listado con el nombre y el precio de todos 
--los productos cuyo nombre de fabricante contenga el carácter w en su nombre.


SELECT 
p.nombre as "producto",
p.precio,
f.nombre as "fabricante"
                      FROM producto p
                      JOIN fabricante f
                      ON p.id_fabricante=f.id
WHERE f.nombre LIKE '%w%';


--Devuelve un listado con el nombre de producto, precio y nombre de
--fabricante, de todos los productos que tengan un precio
--mayor o igual a 180€. Ordene el resultado en primer lugar por 
--el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT
p.nombre as "producto",
p.precio,
f.nombre as "fabricante"
        FROM producto p
        JOIN fabricante f
        ON p.id_fabricante=f.id
WHERE p.precio>=180
ORDER BY p.precio DESC, p.nombre ASC



--Devuelve un listado con el identificador y el nombre de fabricante, 
--solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT 
DISTINCT(f.id) as "id fabricante",
f.nombre as "fabricante" 
                     FROM fabricante f
                    RIGHT JOIN producto p
                     ON p.id_fabricante= f.id
WHERE p.id_fabricante IS NOT NULL;