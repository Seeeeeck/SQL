--Devuelve un listado con todos los empleados junto con los datos de los departamentos
--donde trabajan. Este listado también debe incluir los empleados que no tienen ningún departamento asociado.

SELECT e.*,d.* FROM empleado e
               LEFT JOIN departamento d on e.id_departamento =d.id 


--Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.

SELECT e.* FROM empleado e
           LEFT  OUTER JOIN departamento d ON d.id =e.id_departamento 
WHERE e.id_departamento IS NULL


--Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.

SELECT d.* FROM departamento d	
          LEFT OUTER JOIN empleado e ON d.id = e.id_departamento
WHERE e.id_departamento IS NULL

--Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
--El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
--que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

SELECT 
    e.nombre AS empleado,
    NULL AS departamento
FROM empleado e
LEFT OUTER JOIN departamento d
ON e.id_departamento = d.id
WHERE d.id IS NULL

UNION

SELECT 
    NULL AS empleado,
    d.nombre AS departamento
FROM departamento d
LEFT OUTER JOIN empleado e
ON d.id = e.id_departamento
WHERE e.id_departamento IS NULL

ORDER BY departamento;



--Devuelve un listado con los empleados que no tienen ningún departamento asociado y
--los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.


SELECT 
    e.nombre AS empleado,
    d.nombre AS departamento
FROM empleado e
LEFT JOIN departamento d
ON e.id_departamento = d.id
WHERE d.id IS NULL

UNION

SELECT 
    e.nombre AS empleado,
    d.nombre AS departamento
FROM empleado e
RIGHT JOIN departamento d
ON e.id_departamento = d.id
WHERE e.id IS NULL

ORDER BY departamento;
