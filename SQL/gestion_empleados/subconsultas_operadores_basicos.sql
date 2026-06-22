--Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

SELECT  e.* FROM empleado e
WHERE e.id_departamento =(
      SELECT id FROM departamento
      WHERE departamento.nombre ="Sistemas"
)

--Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

SELECT d.nombre,d.presupuesto  
FROM departamento d
WHERE d.presupuesto =(
      SELECT MAX(dep.presupuesto) FROM departamento dep
)


--Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

SELECT d.nombre,d.presupuesto  
FROM departamento d
WHERE d.presupuesto =(
      SELECT MIN(dep.presupuesto) FROM departamento dep
)