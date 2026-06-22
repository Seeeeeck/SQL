--Calcula la suma del presupuesto de todos los departamentos.

SELECT SUM(presupuesto) AS "Suma de presupuesto" FROM  departamento;

--Calcula la media del presupuesto de todos los departamentos.

SELECT AVG(presupuesto) AS  "Media de presupuesto" FROM departamento;

--Calcula el valor mínimo del presupuesto de todos los departamentos.

SELECT MIN(presupuesto) AS "Mínimo de presupuesto" FROM departamento;

--Calcula el nombre del departamento y el presupuesto que tiene asignado
--, del departamento con menor presupuesto.

SELECT nombre,presupuesto
FROM departamento
ORDER BY presupuesto-gastos
LIMIT 1

--Calcula el valor máximo del presupuesto de todos los departamentos.

SELECT MAX(presupuesto) "Valor máximo de presupuesto" FROM departamento;

--Calcula el nombre del departamento y el presupuesto 
--que tiene asignado, del departamento con mayor presupuesto.

SELECT nombre,presupuesto FROM departamento
ORDER BY presupuesto DESC
LIMIT 1

--Calcula el número total de empleados que hay en la tabla empleado.

SELECT COUNT(id) AS "Total de empleados" FROM empleado;

--Calcula el número de empleados que no tienen NULL en su segundo apellido.

SELECT COUNT(id) FROM empleado
WHERE apellido2 IS NOT NULL


--Calcula el número de empleados que hay en cada departamento. 
--Tienes que devolver dos columnas, una con el nombre del
--departamento y otra con el número de empleados que tiene asignados.


SELECT d.nombre,COUNT(e.id) AS "Cantidad de empleados" 
                            FROM departamento d
                            JOIN empleado e ON e.id_departamento = d.id
GROUP BY d.id;

--Calcula el nombre de los departamentos que tienen más de 2 empleados. 
El resultado debe tener dos columnas, una con el nombre del departamento 
y otra con el número de empleados que tiene asignados.

SELECT d.nombre,COUNT(e.id) AS "Cantidad de empleados" 
                            FROM departamento d
                            JOIN empleado e ON e.id_departamento = d.id
GROUP BY d.id
HAVING COUNT(e.id)>2
;


--Calcula el número de empleados que trabajan en cada uno de los departamentos.
--El resultado de esta consulta también tiene que incluir 
--aquellos departamentos que no tienen ningún empleado asociado.

SELECT d.nombre,COUNT(e.id) AS "Cantidad de empleados" 
                            FROM departamento d
                            LEFT JOIN empleado e ON e.id_departamento = d.id
GROUP BY d.id
;


--Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.

SELECT d.nombre,COUNT(e.id) AS "Cantidad de empleados" 
                            FROM departamento d
                            LEFT JOIN empleado e ON e.id_departamento = d.id
WHERE d.presupuesto > 200000
GROUP BY d.id;