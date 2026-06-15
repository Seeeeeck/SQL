--Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(id) FROM producto;

--Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(id) FROM fabricante;

--Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla 

SELECT COUNT(DISTINCT(id_fabricante)) FROM producto;

--Calcula la media del precio de todos los productos.

SELECT AVG(precio) FROM producto;

--Calcula el precio más barato de todos los productos.

SELECT MIN(precio) FROM producto;

--Calcula el precio más caro de todos los productos.

SELECT MAX(precio) FROM producto;

--Lista el nombre y el precio del producto más barato.

SELECT nombre,precio FROM producto
                     ORDER BY  precio ASC
                     LIMIT 1;

--Lista el nombre y el precio del producto más caro.

SELECT nombre,precio FROM producto
                     ORDER BY precio DESC
                     LIMIT 1;

--Calcula la suma de los precios de todos los productos.

SELECT SUM(precio) FROM producto;

--Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(p.id) as "cantidad productos Asus" FROM producto p
                   JOIN fabricante f
                   ON p.id_fabricante=f.id
WHERE f.nombre="Asus";

--Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(p.precio) as "Media productos Asus" FROM producto p
                   JOIN fabricante f
                   ON p.id_fabricante=f.id
WHERE f.nombre="Asus";

--Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT MIN(p.precio) as "Precio más bajo Asus" FROM producto p
                   JOIN fabricante f
                   ON p.id_fabricante=f.id
WHERE f.nombre="Asus";

--Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT MAX(p.precio) as "Precio más caro Asus" FROM producto p
                   JOIN fabricante f
                   ON p.id_fabricante=f.id
WHERE f.nombre="Asus";


--Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(p.precio) as "Suma precio Asus" FROM producto p
                   JOIN fabricante f
                   ON p.id_fabricante=f.id
WHERE f.nombre="Asus";

--Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial

SELECT
MAX(p.precio) as "Precio más caro Crucial",
MIN(p.precio) as "Precio más bajo Crucial",
AVG(p.precio) as "Media precio Crucial",
COUNT(p.id) as "Cantidad productos Crucial"
           FROM producto p
           JOIN fabricante f
           ON p.id_fabricante=f.id
WHERE f.nombre="Crucial";

--Muestra el número total de productos que tiene cada uno de los fabricantes.
--El listado también debe incluir los fabricantes que no tienen ningún producto. 
--El resultado mostrará dos columnas, una con el nombre del fabricante y otra 
--con el número de productos que tiene. Ordene el resultado descendentemente
--por el número de productos.

SELECT f.nombre, COUNT(p.id) AS "Total  de productos" 
FROM producto p
              JOIN fabricante f
              ON p.id_fabricante=f.id
GROUP BY f.id
HAVING COUNT(p.id)>=0
ORDER BY COUNT(p.id)

--Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. 
--El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.

SELECT 
f.nombre,
MAX(p.precio) as "Precio más caro",
MIN(p.precio) as "Precio más bajo",
AVG(p.precio) as "Media precio"
FROM fabricante f
               JOIN producto p
               ON f.id=p.id_fabricante
GROUP BY f.nombre;

