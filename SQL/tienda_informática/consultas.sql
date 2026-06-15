
USE tienda;
--Lista el nombre de todos los productos que hay en la tabla producto.

SELECT nombre FROM producto;


--Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre,precio FROM producto;

--Lista todas las columnas de la tabla producto.

SELECT * FROM producto;

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre ,ROUND(precio*0.92,2) as 'euro', precio as 'dolares' FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(nombre),precio FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(nombre),precio FROM producto;


--Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre,UPPER(LEFT(nombre,2)) FROM fabricante;

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio) FROM producto;

--Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre, TRUNCATE(precio,0) FROM producto;

--Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT fabricante.id FROM fabricante JOIN producto;
                               


--Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT(fabricante.id) FROM fabricante 
                               JOIN producto
                               WHERE fabricante.id = producto.id_fabricante;

--Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre FROM fabricante
              ORDER BY nombre ASC;

--Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre FROM fabricante
              ORDER BY nombre DESC;

--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre,precio FROM producto
                     ORDER BY nombre ASC,precio DESC;

--Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT * FROM fabricante LIMIT 5;


--Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

SELECT * FROM fabricante LIMIT 3,2;

--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre,precio FROM producto
                     ORDER BY precio ASC 
                     LIMIT 1;

--Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre,precio FROM producto
                     ORDER BY precio DESC 
                     LIMIT 1;