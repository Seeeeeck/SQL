--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT d.nombre FROM departamento d
WHERE d.id IN (SELECT e.id_departamento FROM empleado e)


--Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

SELECT d.nombre FROM departamento d
WHERE d.id NOT IN (SELECT e.id_departamento FROM empleado e WHERE e.id_departamento IS NOT NULL)