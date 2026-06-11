
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
