
--Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT d.nombre FROM departamento d
WHERE EXISTS(SELECT e.id_departamento FROM empleado e WHERE e.id_departamento =d.id )

--Devuelve los nombres de los departamentos que notienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT d.nombre FROM departamento d
WHERE NOT EXISTS(SELECT e.id_departamento FROM empleado e WHERE e.id_departamento =d.id )