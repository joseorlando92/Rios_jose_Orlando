Use sistema;
-- Ejercicio 1: Consultas sql

-- Consulta Nro 1.	
SELECT apellido FROM empleados;

-- Consulta Nro 2.	
SELECT DISTINCT apellido FROM empleados;

-- Consulta Nro 3.	
SELECT * FROM empleados;

-- Consulta Nro 4.	
SELECT nombre, apellido FROM empleados;

-- Consulta Nro 5.	
SELECT cuil_cuit FROM empleados AS E, departamentos AS D WHERE E.id_departamento=D.iddepartamento;

-- Consulta Nro 6.	
SELECT concat(nombre,' ',apellido) AS Empleados FROM empleados;

-- Consulta Nro 7.	
SELECT upper(concat(nombre,' ',apellido)) AS Empleados FROM empleados;

-- Consulta Nro 8.	
SELECT lower(concat(nombre,' ',apellido)) AS Empleados FROM empleados;

-- Consulta Nro 9.	
SELECT nombre,presupuesto AS Empleados FROM departamentos order by presupuesto ASC;

-- Consulta Nro 10.	
SELECT nombre FROM departamentos order by presupuesto ASC;

-- Consulta Nro 11.	
SELECT nombre FROM departamentos order by presupuesto desc;

-- Consulta Nro 12.	
SELECT apellido,nombre FROM empleados order by apellido,nombre ASC;

-- Consulta Nro 13.	
SELECT nombre,presupuesto 
FROM departamentos 
order by presupuesto desc limit 3;

-- Consulta Nro 14.	
SELECT nombre,presupuesto 
FROM departamentos 
order by presupuesto asc limit 3;

-- Consulta Nro 15.	
SELECT nombre,presupuesto 
FROM departamentos 
WHERE presupuesto >=150000;

-- Consulta Nro 16.	
SELECT nombre,presupuesto 
FROM departamentos 
WHERE presupuesto >= 100000 and presupuesto <=200000;

-- Consulta Nro 17.	
SELECT nombre,presupuesto 
FROM departamentos 
WHERE presupuesto >= 100000 and presupuesto >=200000;

-- Consulta Nro 18.	
SELECT nombre,presupuesto 
FROM departamentos 
WHERE presupuesto between 100000 and 200000;

-- Consulta Nro 19.	
SELECT nombre,presupuesto 
FROM departamentos 
WHERE presupuesto NOT between 100000 and 200000;

-- Consulta Nro 20.	
SELECT E.apellido, E.nombre, D.nombre, D.presupuesto, D.estado 
FROM empleados AS E join departamentos AS D 
WHERE D.iddepartamento = E.id_departamento;

-- Consulta Nro 21.	
SELECT E.apellido, E.nombre, D.nombre, D.presupuesto, D.estado 
FROM empleados AS E join departamentos AS D 
WHERE D.iddepartamento = E.id_departamento
order by D.nombre ASC;

-- Consulta Nro 22.	
SELECT Distinct D.iddepartamento, D.nombre
FROM departamentos AS D, empleados AS E 
WHERE D.iddepartamento = E.id_departamento ;

-- Consulta Nro 23.	
SELECT D.nombre, E.nombre
FROM departamentos AS D, empleados AS E 
WHERE E.cuil_cuit='27-38382980-3' ;

-- Consulta Nro 24.	
SELECT D.nombre, E.nombre , E.apellido
FROM departamentos AS D, empleados AS E 
where D.iddepartamento = E.id_departamento AND E.nombre='Pepe' AND E.apellido = 'Ruiz' ;

-- Consulta Nro 25.	
SELECT E.cuil_cuit, E.nombre , E.apellido, E.estado
FROM departamentos AS D, empleados AS E 
WHERE D.iddepartamento = E.id_departamento AND D.nombre='I+D' 
ORDER BY E.nombre ASC;

-- Consulta Nro 26.	
SELECT E.cuil_cuit, E.nombre , E.apellido, E.estado , D.nombre
FROM departamentos AS D, empleados AS E 
WHERE D.nombre = 'Sistemas' OR D.nombre='I+D' OR D.nombre = 'Contabilidad'  
ORDER BY E.nombre ASC;

-- Consulta Nro 27.	
SELECT E.cuil_cuit, E.nombre , E.apellido ,D.presupuesto
FROM departamentos AS D, empleados AS E 
WHERE D.iddepartamento=E.id_departamento AND presupuesto not between 100000 and 200000;

