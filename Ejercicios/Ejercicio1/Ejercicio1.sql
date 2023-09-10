CREATE TABLE Pub (
	cod_pub varchar(25) NOT NULL,
	nombre varchar(25) NOT NULL,
	licencia_fiscal varchar(25) NOT NULL,
	domicilio varchar(25),
	fecha_apertura date NOT NULL,
	horario varchar(25) NOT NULL CHECK (horario in ('HOR1', 'HOR2', 'HOR3')),
	cod_localidad int NOT NULL,
	PRIMARY KEY(cod_pub)
)

CREATE TABLE titular (
	dni_titular varchar(25) NOT NULL,
	nombre varchar(25) NOT NULL,
	domicilio varchar(25), 
	cod_pub varchar(25) NOT NULL,
	FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
	PRIMARY KEY(dni_titular)
	
)

CREATE TABLE empleado (
	dni_empleado varchar(25) NOT NULL,
	nombre varchar(25) NOT NULL,
	domicilio varchar(25),
	PRIMARY KEY(dni_empleado)
)

CREATE TABLE existencias (
	cod_articulo varchar(25) NOT NULL,
	nombre varchar(25) NOT NULL,
	cantidad int NOT NULL,
	precio int NOT NULL CHECK (precio != 0),
	cod_pub varchar(25) NOT NULL,
	FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
	PRIMARY KEY(cod_articulo)
)

CREATE TABLE localidad (
	cod_localidad int NOT NULL,
	nombre varchar(25) NOT NULL,
	PRIMARY KEY(cod_localidad)
)

CREATE TABLE pub_empleado (
	cod_pub varchar(25) NOT NULL,
	dni_empleado varchar(25) NOT NULL,
	funcion varchar(25) NOT NULL CHECK (funcion in ('CAMARERO', 'SEGURIDAD', 'LIMPIEZA')),
	FOREIGN KEY (cod_pub) REFERENCES Pub(cod_pub),
	FOREIGN KEY (dni_empleado) REFERENCES Empleado(dni_empleado),
	PRIMARY KEY (cod_pub, dni_empleado, funcion)
)
