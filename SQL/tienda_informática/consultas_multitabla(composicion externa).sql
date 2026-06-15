---Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

--Devuelve un listado de todos los fabricantes que existen en la base de datos,
--junto con los productos que tiene cada uno de ellos. 
--El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT * FROM fabricante f
         LEFT JOIN producto p
         ON f.id=p.id_fabricante;

--Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT * FROM fabricante f
         LEFT JOIN producto p
         ON f.id=p.id_fabricante
WHERE p.id IS NULL;

--¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

--No ,porque existe una llave foranea que hace referencia a una tabla fabricante
--es obligatorio insertar el producto con el id de fabricante o si no ,no se agrega el producto.