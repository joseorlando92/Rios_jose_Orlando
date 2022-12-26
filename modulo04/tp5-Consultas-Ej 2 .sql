Use ventas;

-- Ejercicio 2: Consultas sql

-- Nro 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
-- ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.	
SELECT * FROM pedidos
ORDER BY fecha DESC;

-- Nro 2. Devuelve todos los datos de los dos pedidos de mayor valor.	
SELECT * FROM pedidos
ORDER BY cantidad DESC limit 2;

-- Nro 3.	Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT c.id 
FROM clientes AS c ,pedidos AS p 
WHERE c.id = p.id_cliente;

-- Nro 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, 
-- cuya cantidad total sea superior a $500.
SELECT *
FROM pedidos AS p 
WHERE p.fecha between '2022-01-01' and '2022-12-31';

-- Nro 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT *
FROM vendedores AS v 
WHERE v.comisión between 0.05 and 0.11;

-- Nro 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.	
SELECT MAX(v.comisión)
FROM vendedores AS v;

-- Nro 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT c.id, c.nombre, c.apellido, c.cuitcuil
FROM clientes AS c
WHERE c.cuitcuil is not null;

-- Nro 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y 
-- también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT c.nombre
FROM clientes AS c
WHERE c.nombre like 'A%'  AND c.nombre like '%n' OR c.nombre like 'P%';

-- Nro 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
SELECT c.nombre 
FROM clientes AS c
WHERE c.nombre not like 'A%' 
ORDER BY c.nombre ASC;

-- Nro 10. Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. 
-- Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT distinct v.nombre
FROM vendedores AS v
WHERE v.nombre like '%el' OR '%o';

-- Nro 11. Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
-- realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT distinct c.id, c.nombre, c.apellido 
FROM clientes AS c, pedidos AS p
WHERE p.id_cliente = c.id AND p.id_cliente is not null
ORDER BY c.nombre ASC;

-- Nro 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
-- debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
-- los clientes ordenados alfabéticamente.
SELECT c.id, c.nombre, p.id
FROM clientes AS c 
INNER JOIN pedidos AS p ON c.id = p.id_cliente
ORDER BY c.nombre;

-- Nro 13. Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
-- resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
-- mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT *
FROM pedidos AS p 
INNER JOIN vendedores AS v ON v.id = p.id_vendedor
ORDER BY v.nombre;

-- Nro 14. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
-- con los datos de los vendedores asociados a cada pedido.
SELECT *
FROM clientes AS c 
INNER JOIN pedidos AS p 
ON c.id = p.id_cliente
INNER JOIN vendedores AS v 
ON v.id = p.id_vendedor
ORDER BY c.id;

-- Nro 15. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, 
-- cuyo monto esté entre $300 y $1000.
SELECT *
FROM clientes AS c  
INNER JOIN pedidos AS p ON  (c.id = p.id_cliente) 
and (p.fecha between '2022-01-01' and '2022-12-31') and (p.cantidad between 300 and 1000) ;

-- Nro 16. Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
-- realizado por María Santana.
SELECT distinct v.nombre, v.apellido
FROM vendedores AS v  
INNER JOIN pedidos AS p ON  (p.id_vendedor = v.id)
INNER JOIN clientes AS c ON (c.id = p.id_cliente and (c.nombre = 'Maria' and c.apellido = 'Santana'));

-- Nro 17. Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez. 
SELECT distinct c.nombre
FROM clientes AS c  
INNER JOIN pedidos AS p ON  (p.id_cliente = c.id)
INNER JOIN vendedores AS v ON (v.id = p.id_vendedor and (v.nombre = 'Daniel' and v.apellido = 'Saez'));

-- Nro 18. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
-- El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT *
FROM clientes AS c
LEFT JOIN pedidos AS p ON  p.id_cliente = c.id WHERE coalesce(p.id_cliente,'') in ('');

-- Nro 19. Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
-- realizado. Este listado también debe incluir los vendedores que no han realizado ningún
-- pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los
-- vendedores.
SELECT *
FROM vendedores AS v
LEFT JOIN pedidos AS p ON  p.id_vendedor = v.id WHERE coalesce(p.id_vendedor,'') in ('');

-- Nro 20. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT *
FROM clientes AS c
WHERE NOT EXISTS(SELECT *
FROM pedidos AS p
WHERE c.id = p.id_cliente);
    

-- Nro 21. Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT *
FROM vendedores AS v
WHERE NOT EXISTS(SELECT *
FROM pedidos AS p
WHERE v.id = p.id_vendedor);
    
-- Consulta Nro 22. Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores
-- que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y
-- el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.
SELECT *
FROM clientes AS c, vendedores AS v
WHERE NOT EXISTS(SELECT *
FROM pedidos AS p
WHERE c.id = p.id_cliente or v.id=p.id_vendedor);

-- Nro 23. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT sum(p.cantidad)
FROM pedidos AS p;

-- Nro 24. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT avg(p.cantidad)
FROM pedidos AS p;


-- Nro 25. Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
SELECT  count(distinct p.id_vendedor)
FROM pedidos AS p;

-- Nro 26. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT  count(c.id)
FROM clientes AS c;

-- Nro 27. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT  max(p.cantidad)
FROM pedidos AS p;

-- Nro 28. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT  min(p.cantidad)
FROM pedidos AS p;

-- Nro 29. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT  c.ciudad, max(c.categoría) 
FROM clientes AS c;


-- Nro 30. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes
-- cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada
-- uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del
-- cliente, nombre, apellido, la fecha y el valor de la cantidad.
SELECT DISTINCT p.fecha, c.id, c.nombre, c.apellido, p.cantidad
FROM clientes AS c
INNER JOIN pedidos AS p ON (SELECT MAX(p.cantidad) FROM pedidos WHERE p.id_cliente = c.id)
GROUP BY p.fecha;

-- Nro 31. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno
-- de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen
-- la cantidad de $2000 .
SELECT DISTINCT p.fecha, MAX(p.cantidad)
FROM clientes c, pedidos p
WHERE p.id_cliente = c.id 
and p.cantidad > 2000
GROUP BY p.fecha;

-- Nro 32. Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la
-- fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
SELECT  v.id, v.nombre, v.apellido , max(p.cantidad)
FROM vendedores v,pedidos p
WHERE p.id_vendedor = v.id and p.fecha = '2021-08-17';

-- Nro 33. .Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de
-- pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir
-- clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el
-- listado indicando que el número de pedidos realizados es 0.
SELECT  c.id, c.nombre, c.apellido,  count(*) pedidos
FROM clientes AS c, pedidos AS p
WHERE c.id = p.id_cliente or not exists (SELECT c.id FROM pedidos pe WHERE c.id=pe.id_cliente) 
GROUP BY c.id;

-- Nro 34. Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de
-- pedidos que ha realizado cada uno de clientes durante el año 2020.
SELECT  c.id, c.nombre, c.apellido , count(p.id)
FROM clientes c,pedidos p
WHERE p.id_cliente = c.id and p.fecha like '2020%'
GROUP BY c.id;

-- Nro 35. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT DISTINCT YEAR(p.fecha) AS anio, p.id, p.fecha, p.cantidad
FROM clientes c, pedidos p
WHERE p.id_cliente = c.id 
and p.cantidad = (SELECT  max(pe.cantidad) from pedidos pe where pe.id_cliente = c.id)
GROUP BY YEAR(p.fecha);

-- Nro 36. Devuelve el número total de pedidos que se han realizado cada año.
SELECT  DISTINCT year(p.fecha), count(p.id)
FROM pedidos p
GROUP BY YEAR(p.fecha);

-- Nro 37. Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
SELECT *
FROM pedidos p
CROSS JOIN clientes c WHERE p.id_cliente = c.id and c.nombre = 'Adela' and c.apellido = 'Salas';

-- Nro 38. Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
SELECT count(p.id)
FROM pedidos p
CROSS JOIN vendedores v WHERE p.id_vendedor = v.id and v.nombre = 'Daniel' and v.apellido = 'Saez';

-- Nro 39. Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
SELECT max(p.cantidad), c.nombre
FROM clientes c
CROSS JOIN pedidos p WHERE p.id_cliente = c.id  and p.fecha between '2020-01-01' and '2020-12-31';

-- Nro 40. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT min(p.cantidad), p.fecha
FROM  pedidos p
CROSS JOIN clientes c WHERE p.id_cliente = c.id  and c.nombre='Pepe' and c.apellido='Ruiz';

-- Nro 41. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM  clientes c
WHERE c.id  NOT IN (SELECT p.id_cliente
FROM  pedidos p);

-- Nro 42. Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM  vendedores v
WHERE v.id  NOT IN (SELECT p.id_vendedor
FROM  pedidos p);

-- Nro 43. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM  clientes c
WHERE NOT EXISTS (SELECT p.id_cliente
FROM  pedidos p
WHERE c.id = p.id_cliente);

-- Nro 44. Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM  vendedores v
WHERE NOT EXISTS (SELECT  p.id_vendedor
FROM  pedidos p
WHERE p.id_vendedor = v.id);