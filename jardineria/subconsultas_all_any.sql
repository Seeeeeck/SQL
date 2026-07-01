--Devuelve el nombre del cliente con mayor límite de crédito.

SELECT * FROM cliente
WHERE limite_credito>=ALL(
      SELECT limite_credito FROM cliente
)

--Devuelve el nombre del producto que tenga el precio de venta más caro.

SELECT nombre FROM producto
WHERE precio_venta>=ALL(
      SELECT precio_venta FROM producto
)

--Devuelve el producto que menos unidades tiene en stock.

SELECT * FROM producto
WHERE cantidad_en_stock<=ALL( 
      SELECT cantidad_en_stock FROM producto
)


