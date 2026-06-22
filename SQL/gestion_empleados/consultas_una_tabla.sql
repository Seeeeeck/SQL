--Lista el primer apellido de todos los empleados.

SELECT apellido1 FROM empleado;

--Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.

SELECT DISTINCT(apellido1) FROM empleado;

--Lista todas las columnas de la tabla empleado.

SELECT * FROM empleado;

--Lista el nombre y los apellidos de todos los empleados.

SELECT nombre, apellido1,apellido2 FROM empleado;

--Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.

SELECT id_departamento FROM  empleado;

--Lista el identificador de los departamentos de los empleados 
--que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT(id_departamento) FROM empleado;

--Lista el nombre y apellidos de los empleados en una única columna.

SELECT CONCAT(nombre," ",apellido1," ",apellido2) AS "Nombre empleado" FROM empleado;

--Lista el nombre y apellidos de los empleados en una única columna,
--convirtiendo todos los caracteres en mayúscula.

SELECT UPPER(CONCAT(nombre," ",apellido1," ",apellido2)) AS "Nombre empleado" FROM empleado;

--Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.

SELECT LOWER(CONCAT(nombre," ",apellido1," ",apellido2)) AS "Nombre empleado" FROM empleado;

--Lista el identificador de los empleados junto al nif, pero el nif deberá
--aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.

SELECT id,SUBSTR(nif,1,8), SUBSTR(nif,-1) FROM empleado

--Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone.
--Para calcular este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) 
--los gastos que se han generado (columna gastos). Tenga en cuenta que en algunos casos pueden
--existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.


SELECT nombre,presupuesto-gastos AS "Presupuesto actual" FROM  departamento

--Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.

SELECT nombre,presupuesto-gastos AS "Presupuesto actual" FROM departamento
ORDER BY 2 ASC

--Lista el nombre de todos los departamentos ordenados de forma ascendente.

SELECT nombre FROM departamento
ORDER BY nombre ASC

--Lista el nombre de todos los departamentos ordenados de forma descendente.

SELECT nombre FROM departamento
ORDER BY nombre DESC

--Lista los apellidos y el nombre de todos los empleados,
--ordenados de forma alfabética tendiendo en cuenta en primer
--lugar sus apellidos y luego su nombre.

SELECT apellido1,apellido2,nombre FROM empleado
ORDER BY apellido1 ASC,apellido2 ASC, nombre ASC


--Devuelve una lista con el nombre y el presupuesto,
--de los 3 departamentos que tienen mayor presupuesto.

SELECT nombre,presupuesto FROM  departamento
ORDER BY presupuesto DESC
LIMIT 3

--Devuelve una lista con el nombre y el presupuesto,
--de los 3 departamentos que tienen menor presupuesto.

SELECT nombre,presupuesto FROM  departamento
ORDER BY presupuesto ASC
LIMIT 3

--Devuelve una lista con el nombre y el gasto,
--de los 2 departamentos que tienen mayor gasto.

SELECT nombre, gastos FROM departamento
ORDER BY gastos DESC
LIMIT 2

--Devuelve una lista con el nombre y el gasto,
--de los 2 departamentos que tienen menor gasto

SELECT nombre, gastos FROM departamento
ORDER BY gastos ASC
LIMIT 2

--Devuelve una lista con 5 filas a partir de la tercera fila de la
--tabla empleado. La tercera fila se debe incluir en la respuesta.
--La respuesta debe incluir todas las columnas de la tabla empleado.

SELECT * FROM empleado
LIMIT 2,5
