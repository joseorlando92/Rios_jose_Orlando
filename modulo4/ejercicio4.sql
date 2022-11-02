--Ejercicio 1
CREATE TABLE alumno (
    Cod_Matricula int NOT NULL,
    Nombre varchar(255),
    DNI varchar(45),
    FechaNacimiento date,
    email varchar(45)
);
CREATE TABLE curso (
    Cod_curso int NOT NULL,
    Nombre_curso varchar(255),
    ALUMNO_Cod_Matricula int
);
CREATE TABLE profesor (
    Id_Profesor int NOT NULL,
    Nombre_Profesor varchar(255),
    Especialidad varchar(45),
    email varchar(45)
    Cod_curso int
);

--///// Ejercicio 2

CREATE TABLE pais (
    Id_Pais int NOT NULL,
    Nombre_Pais varchar(255),
    PRIMARY KEY (Id_Pais),
);
CREATE TABLE provincia (
    Id_Provincia int NOT NULL,
    Nombre_Provincia varchar(255) NOT NULL,
    PAIS_id_PAIS int,
    PRIMARY KEY (Id_Provincia),
    FOREIGN KEY (PAIS_id_PAIS) REFERENCES pais(Id_Pais)
);
CREATE TABLE localidad (
    Id_Localidad int NOT NULL,
    Nombre_Localidad varchar(255) NOT NULL,
    codigo_postal varchar(45),
    PROVINCIA_id_PROVINCIA varchar(45),
    PRIMARY KEY (Id_Localidad),
    FOREIGN KEY (PROVINCIA_id_PROVINCIA) REFERENCES provincia(Id_Provincia)
    
);
CREATE TABLE empleado (
    Id_Empleado int NOT NULL,
    Nombre_Empleador varchar(255) NOT NULL,
    telefono varchar(45),
    email varchar(45),
    fecha_alta date,
    LOCALIDAD_id_LOCALIDAD int ,
    PRIMARY KEY (Id_Empleado),
    FOREIGN KEY (LOCALIDAD_id_LOCALIDAD) REFERENCES localidad(Id_Localidad)
);
--Ejercicio 3
CREATE TABLE CLIENTE (
    id_Cliente int NOT NULL,
    DNI varchar(45) NOT NULL,
    nombre_Cliente varchar(45),
    direccion_Cliente varchar(45),
    telefono_Cliente varchar(45),
    CLIENTE_id_CLIENTE int,
    PRIMARY KEY (id_Cliente),
    FOREIGN KEY (CLIENTE_id_CLIENTE) REFERENCES CLIENTE(id_Cliente)
);
CREATE TABLE RESERVA (
    id_Reserva int NOT NULL,
    numero_Identificacion int NOT NULL,
    fecha_Inicio date,
    final_Reserva date,
    precio_Total date,
    RESERVA_COCHE_idRESERVA int,
    PRIMARY KEY (id_Reserva),
    FOREIGN KEY (RESERVA_COCHE_idRESERVA) REFERENCES RESERVA_COCHE(idRESERVA_COCHE)
);
CREATE TABLE RESERVA_COCHE (
    idRESERVA_COCHE int NOT NULL,
    litros_Por_COCHE int NOT NULL,
    PersonID int,
    COCHE_id_Coche int,
    PRIMARY KEY (idRESERVA_COCHE),
    FOREIGN KEY (COCHE_id_Coche) REFERENCES COCHE(id_COCHE)
);
CREATE TABLE COCHE (
    id_COCHE int NOT NULL,
    matricula int NOT NULL,
    modelo varchar(45),
    color varchar(45),
    marca varchar(45),
    precio_Por_Hora varchar(45),
    PRIMARY KEY (id_COCHE)
);
