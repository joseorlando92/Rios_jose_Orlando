
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

-- Consulta Nro 1.
-- Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades
-- (id,nombre, cp,id_provincia). Tener en cuenta que:
-- ● En un país hay muchas provincias.
-- ● En una provincia hay muchas localidades.

CREATE TABLE paises (
id_pais INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
); 
CREATE TABLE provincias (
id_provincia INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nonombrembre VARCHAR(30) NOT NULL,
id_pais INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);
CREATE TABLE localidades (
id_localidad INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

-- Consulta Nro 2.
-- Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- ● direccion (varchar)
-- ● id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- ● email
-- ● telefono
-- ● fecha_ingreso
-- ● tms (timestamp)

ALTER TABLE empleados
ADD direccion varchar(255),
ADD id_localidad INT UNSIGNED NOT NULL,
ADD email varchar(255),
ADD telefono DOUBLE NOT NULL,
ADD fecha_ingreso date,
ADD tms timestamp;
ALTER TABLE empleados ADD CONSTRAINT id_localidad FOREIGN KEY (id_localidad) REFERENCES localidades(id_localidad);

-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos:
-- ● gasto (double)
-- ● tms (timestamp)
ALTER TABLE departamentos 
ADD gasto DOUBLE NOT NULL,
ADD tms timestamp;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
-- Inserts Paises
-- 1.
INSERT INTO paises (nombre)
VALUES ("Argentina");
-- 2.
INSERT INTO paises (nombre)
VALUES ("Paraguay");
-- 3.
INSERT INTO paises (nombre)
VALUES ("Brasil");
-- 4.
INSERT INTO paises (nombre)
VALUES ("Uruguay");
-- 5.
INSERT INTO paises (nombre)
VALUES ("Bolivia");
-- Inserts Provincias
-- 1.
INSERT INTO provincias (nombre,id_pais)
VALUES ("Misiones",1);
-- 2.
INSERT INTO provincias (nombre,id_pais)
VALUES ("Corrientes",1);
-- 3.
INSERT INTO provincias (nombre,id_pais)
VALUES ("Entre Rios",1);
-- 4.
INSERT INTO provincias (nombre,id_pais)
VALUES ("Buenos Aires",1);
-- 5.
INSERT INTO provincias (nombre,id_pais)
VALUES ("Santa Fe",1);
-- Inserts Localidades
-- 1.
INSERT INTO localidades (nombre,id_provincia)
VALUES ("Posadas",1);
-- 2.
INSERT INTO localidades (nombre,id_provincia)
VALUES ("Obera",1);
-- 3.
INSERT INTO localidades (nombre,id_provincia)
VALUES ("San Vicente",1);
-- 4.
INSERT INTO localidades (nombre,id_provincia)
VALUES ("Campo viera",1);
-- 5.
INSERT INTO localidades (nombre,id_provincia)
VALUES ("Candelaria",1);

-- Inserts departamentos
-- 1.
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)
VALUES ("Ventas",100000,1,10000,"2022-12-7 23:59:59");
-- 2.
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)
VALUES ("Compras",200000, 1, 20000,"2022-12-8 22:59:59");
-- 3.
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)
VALUES ("Gestiones",300000, 1, 30000,"2022-12-9 21:59:59");
-- 4.
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)
VALUES ("Administracion",400000, 1, 40000,"2022-12-10 20:59:59");
-- 5.
INSERT INTO departamentos (nombre,presupuesto,estado,gasto,tms)
VALUES ("Extensiones",500000, 1, 50000,"2022-12-11 19:59:59");
-- Inserts empleados
-- 1.
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)
VALUES ("10-11222333-1", "Juan", "Perez",1,1,"Av Lopez torres 1111",1,"JuanPerez@gmail.com",3764112233,"2020-01-01","2015-12-11 19:59:59");
-- 2.
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)
VALUES ("20-11222333-2", "Roberto", "Casimiro",2,1,"Av Lopez torres 2222",2,"RobertoCasimiro@gmail.com",3764112233,"2016-01-01","2020-12-11 19:59:59");
-- 3.
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)
VALUES ("30-11222333-3", "Juansito", "Toledo",3,1,"Av Lopez torres 3333",3,"JuansitoToledo@gmail.com",3764445566,"2017-01-01","2014-12-11 19:59:59");
-- 4.
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)
VALUES ("40-11222333-4", "Robertito", "Enriquez",4,1,"Av Lopez torres 4444",4,"RobertitoEnriquez@gmail.com",37647778899,"2018-01-01","2013-12-11 19:59:59");
-- 5.
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso,tms)
VALUES ("50-11222333-5", "Lucas", "Gonzales",5,1,"Av Lopez torres 5555",5,"LucasGonzales@gmail.com",3764123456,"2019-01-01","2012-12-11 19:59:59");

-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos TO movimientos;
-- 6. Agregar las entidades:
-- ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),
-- cuit,id_localidad fk, estado,tms)
-- ● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.
-- Un proveedor está en una localidad.
CREATE TABLE productos (
id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
id_marca INT UNSIGNED NOT NULL,
stock INT,
precio DOUBLE,
estado boolean,
tms timestamp,
FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);
CREATE TABLE marcas (
id_marca INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
imagen VARCHAR(100) NOT NULL,
id_proveedor INT UNSIGNED NOT NULL,
estado boolean,
tms timestamp,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);
CREATE TABLE proveedores (
id_proveedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(30) NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
naturaleza VARCHAR(30) NOT NULL
);
CREATE TABLE cajas (
id_caja INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
horaInicio datetime,
horaCierre datetime,
estado boolean,
tms timestamp
);
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse
-- secuencialmente y no fallar.

-- Inserts productos
-- 1.
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado,tms)
VALUES ("leche", "Entera",1,25,180.25,1,"2015-12-11 19:59:59");
-- 2.
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado,tms)
VALUES ("Dulce de leche", "Light",2,25,350.85,1,"2015-12-11 19:59:59");
-- 3.
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado,tms)
VALUES ("Mermelada", "Light",3,25,485.5,1,"2015-12-11 19:59:59");
-- 4.
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado,tms)
VALUES ("Cereal", "Grande",4,25,650.3,1,"2015-12-11 19:59:59");
-- 5.
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado,tms)
VALUES ("Pan dulce", "con chip",1,25,350.8,1,"2015-12-11 19:59:59");

-- Inserts Marcas
-- 1.
INSERT INTO marcas (nombre,descripcion,imagen,id_proveedor,estado,tms)
VALUES ("Ilolay", "el sabor del encuentro","Documentos/pruebaSQLtp6/imagen1",1,1,"2015-12-11 19:59:59");
-- 2.
INSERT INTO marcas (nombre,descripcion,imagen,id_proveedor,estado,tms)
VALUES ("Mocoreta", "el sabor del encuentro","Documentos/pruebaSQLtp6/imagen2",2,1,"2015-12-11 19:59:59");
-- 3.
INSERT INTO marcas (nombre,descripcion,imagen,id_proveedor,estado,tms)
VALUES ("Sancor", "Re copado","Documentos/pruebaSQLtp6/imagen3",3,1,"2015-12-11 19:59:59");
-- 4.
INSERT INTO marcas (nombre,descripcion,imagen,id_proveedor,estado,tms)
VALUES ("Marolio", "Le da sabor a tu vida","Documentos/pruebaSQLtp6/imagen4",4,1,"2015-12-11 19:59:59");
-- 5.
INSERT INTO marcas (nombre,descripcion,imagen,id_proveedor,estado,tms)
VALUES ("La providencia", "lo mas","Documentos/pruebaSQLtp6/imagen5",5,1,"2015-12-11 19:59:59");

-- Inserts Proveedores
-- 1.
INSERT INTO proveedores (razon_social,nombre,apellido,naturaleza)
VALUES ("Arcor", "Pedrito","Perez","Fisica");
-- 2.
INSERT INTO proveedores (razon_social,nombre,apellido,naturaleza)
VALUES ("Logicom", "Juan","Rodriguez","Juridica");
-- 3.
INSERT INTO proveedores (razon_social,nombre,apellido,naturaleza)
VALUES ("Repatir", "Lucas","Perez","Fisica");
-- 4.
INSERT INTO proveedores (razon_social,nombre,apellido,naturaleza)
VALUES ("Don Pedro", "Robert","Perez","Juridica");
-- 5.
INSERT INTO proveedores (razon_social,nombre,apellido,naturaleza)
VALUES ("Reto a la vida", "Robertito","Perez","Fisica");

-- Inserts Cajas
-- 1.
INSERT INTO cajas (horaInicio,horaCierre,estado,tms)
VALUES ("2015-12-11 07:59:59","2015-12-11 17:59:59",1,"2015-12-11 19:59:59");
-- 2.
INSERT INTO cajas (horaInicio,horaCierre,estado,tms)
VALUES ("2015-12-13 08:59:59","2015-12-11 18:59:59",1,"2015-12-11 19:59:59");
-- 3.
INSERT INTO cajas (horaInicio,horaCierre,estado,tms)
VALUES ("2015-12-14 07:09:59","2015-12-11 17:09:59",1,"2015-12-11 19:59:59");
-- 4.
INSERT INTO cajas (horaInicio,horaCierre,estado,tms)
VALUES ("2015-12-15 07:10:59","2015-12-11 18:18:59",1,"2015-12-11 19:59:59");
-- 5.
INSERT INTO cajas (horaInicio,horaCierre,estado,tms)
VALUES ("2015-12-19 07:05:59","2015-12-11 17:49:59",1,"2015-12-11 19:59:59");

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los
-- departamentos con estado activo o 1.

select nombre, presupuesto, gasto, (presupuesto-gasto) AS diferencia
from departamentos 
where estado = 1;

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre
-- del pais y el nombre de la localidad

select p.nombre, l.nombre
from paises as p, localidades as l, provincias as pr
where pr.id_pais=p.id_pais and l.id_provincia=pr.id_provincia;

-- 10. Modificar (UPADTE):
-- ● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ● el fecha_ingreso y la localidad de otro empleado.

UPDATE empleados
SET telefono = 3755445566
WHERE idemplaedo = 3;

UPDATE empleados as e
SET e.fecha_ingreso = "2019-02-02",e.id_localidad = 1
WHERE e.idemplaedo = 4;

-- 11. Insertar 5 vendedores.

-- 1.
INSERT INTO vendedores (nombre,apellido,cuitcuil,comisión)
VALUES ("Roque", "Gonzales","20-11222333-1",0.25);
-- 2.
INSERT INTO vendedores (nombre,apellido,cuitcuil,comisión)
VALUES ("Luis", "Ayala","20-44555666-1",0.25);
-- 3.
INSERT INTO vendedores (nombre,apellido,cuitcuil,comisión)
VALUES ("Adrial", "Sho","20-77888999-1",0.25);
-- 4.
INSERT INTO vendedores (nombre,apellido,cuitcuil,comisión)
VALUES ("Ale", "k","20-77666555-1",0.25);
-- 5.
INSERT INTO vendedores (nombre,apellido,cuitcuil,comisión)
VALUES ("Ariel", "z","20-33222111-1",0.25);


-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,
-- tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)

ALTER TABLE movimientos 
ADD id_producto INT UNSIGNED NOT NULL,
ADD estado boolean,
ADD tms timestamp,
add FOREIGN KEY (id_producto) REFERENCES productos(id_producto);

-- 13. Insertar 5 movimientos distintos.

-- 1.
INSERT INTO movimientos (cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms)
VALUES (50, "2015-12-11",1,2,3,1,"2015-12-11 19:00:00");
-- 2.
INSERT INTO movimientos (cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms)
VALUES (13, "2015-12-11",2,2,1,1,"2015-12-11 19:10:00");
-- 3.
INSERT INTO movimientos (cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms)
VALUES (25, "2015-12-11",2,2,2,1,"2015-12-11 19:59:59");
-- 4.
INSERT INTO movimientos (cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms)
VALUES (30, "2015-12-11",3,2,3,1,"2015-12-11 19:59:59");
-- 5.
INSERT INTO movimientos (cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tms)
VALUES (10, "2015-12-11",1,4,3,1,"2015-12-11 19:59:59");


-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- ● 2 movimientos que fueron cargados mal
-- ● un pais que tenga al menos 3 localidades

UPDATE movimientos as m
SET m.estado = 0
WHERE m.id = 2;

UPDATE movimientos as m
SET m.estado = 0
WHERE m.id = 3;

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla
-- de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de
-- manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
-- 5 updates de la tabla producto.

UPDATE productos as p
SET p.stock = p.stock + (select m.cantidad from movimientos as m where m.id=4)
WHERE p.id_producto = (select m.id_producto from movimientos as m where m.id=4);

UPDATE productos as p
SET p.stock = p.stock + (select m.cantidad from movimientos as m where m.id=5)
WHERE p.id_producto = (select m.id_producto from movimientos as m where m.id=5);

UPDATE productos as p
SET p.stock = p.stock + (select m.cantidad from movimientos as m where m.id=6)
WHERE p.id_producto = (select m.id_producto from movimientos as m where m.id=6);

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)

CREATE TABLE parametros (
id_parametro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tms timestamp,
cosas json,
id_usuario int
);

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
INSERT INTO parametros (tms,cosas,id_usuario)
VALUES ("2015-12-11 19:59:59",'{"idDeLaCosa": 101, "permisos": "PUT, GET"}',1);

-- ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", “grupo": "ventas"}
INSERT INTO parametros (tms,cosas,id_usuario)
VALUES ("2016-12-11 19:59:59",'{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}',2);

-- ● {"zonaHoraria": "America/Argentina/BuenosAires"}
INSERT INTO parametros (tms,cosas,id_usuario)
VALUES ("2017-12-11 19:59:59",'{"zonaHoraria": "America/Argentina/BuenosAires"}',3);

-- ● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}
INSERT INTO parametros (tms,cosas,id_usuario)
VALUES ("2018-12-11 19:59:59",'{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}',4);

-- ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":
-- "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":
-- "31634912,57","egreso": "9757142,66"}}}
INSERT INTO parametros (tms,cosas,id_usuario)
VALUES ("2015-12-11 19:59:59",'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}',5);

-- Nota: Rellenar a criterio los campos id, tms,id_usuario  
