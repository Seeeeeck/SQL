--Devuelve el nombre del cliente con mayor límite de crédito.

SELECT * FROM cliente
WHERE limite_credito=(
      SELECT MAX(limite_credito) FROM cliente
);


--Devuelve el nombre del producto que tenga el precio de venta más caro.

SELECT * FROM producto
WHERE precio_venta=(
      SELECT MAX(precio_venta) FROM producto
);

--Devuelve el nombre del producto del que se han vendido más unidades.
--(Tenga en cuenta que tendrá que calcular cuál es el número total
--de unidades que se han vendido de cada producto a partir 
..de los datos de la tabla detalle_pedido)

SELECT * FROM producto p
WHERE p.codigo_producto=(
     SELECT 
     codigo_producto
     FROM detalle_pedido
     GROUP BY codigo_producto
     HAVING MAX(cantidad)=(
            SELECT MAX(cantidad)
            FROM  detalle_pedido
            GROUP BY codigo_producto
            ORDER BY 1 DESC 
            LIMIT 1 
))


--Los clientes cuyo límite de crédito sea mayor 
--que los pagos que haya realizado. (Sin utilizar INNER JOIN).
--Esta mal redactado, no se se sabe si al total de pagos o mayor a todos los pagos
SELECT * FROM cliente c
WHERE c.limite_credito>(
      SELECT MAX(total) FROM pago p
      WHERE p.codigo_cliente=c.codigo_cliente
)

--Devuelve el producto que más unidades tiene en stock.

SELECT * FROM producto p
WHERE p.cantidad_en_stock=(
      SELECT MAX(cantidad_en_stock) FROM producto
)

--Devuelve el producto que menos unidades tiene en stock.
SELECT * FROM producto p
WHERE p.cantidad_en_stock=(
      SELECT MIN(cantidad_en_stock) FROM producto
)


--Devuelve el nombre, los apellidos y el email 
--de los empleados que están a cargo de Alberto Soria

SELECT e.nombre,e.apellido1,e.apellido2,e.email
FROM  empleado e
WHERE e.codigo_jefe=(
      SELECT codigo_empleado FROM empleado
      WHERE CONCAT(nombre," ",apellido1)="Alberto Soria"   
      )
;
