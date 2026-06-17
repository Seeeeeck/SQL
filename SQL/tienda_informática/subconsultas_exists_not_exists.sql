--EXISTS PARA SABER SI UNA SUBCONSULTA DEVUELVE ALGUN RESULTADO
--NOT EXISTS PARA SABER SI UNA SUBCONSULTA NO DEVUELVE NINGÚN RESULTADO


--Devuelve los nombres de los fabricantes 
--que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT f.nombre FROM fabricante f
WHERE EXISTS ( 
      SELECT * FROM producto p
               WHERE p.id_fabricante=f.id              
)


--Devuelve los nombres de los fabricantes que no
tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT f.nombre FROM fabricante f
WHERE NOT EXISTS ( 
      SELECT * FROM producto p
               WHERE p.id_fabricante=f.id              
)