--Devuelve el nombre del departamento con mayor
--presupuesto y la cantidad que tiene asignada.
--Sin hacer uso de MAX, ORDER BY ni LIMIT.


--ALL es para saber si todos corresponden a la conidición
--ANY repregunta si alguno corresponde a la condicion
SELECT d.nombre 
FROM departamento d
WHERE d.presupuesto >= ALL(SELECT presupuesto FROM departamento)

--Devuelve el nombre del departamento con menor
--presupuesto y la cantidad que tiene
--asignada. Sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT d.nombre 
FROM departamento d
WHERE d.presupuesto <= ALL(SELECT presupuesto FROM departamento)


--Devuelve los nombres de los departamentos 
--que tienen empleados asociados. (Utilizando ALL o ANY).

SELECT d.nombre FROM departamento d
WHERE d.id = ANY(SELECT e.id_departamento FROM empleado e)


--Devuelve los nombres de los departamentos 
--que no tienen empleados asociados. (Utilizando ALL o ANY).

--LOS NULL BLOQUEAN LA CONSULTA, POR ESO SE USA IS NOT NULL

SELECT d.id
FROM departamento d
WHERE d.id <> ALL (
    SELECT emp.id_departamento
    FROM empleado emp
    WHERE emp.id_departamento IS NOT NULL
);



