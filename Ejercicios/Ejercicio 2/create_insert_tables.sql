/* 
LUGAR (L_CODIGO, L_NOMBRE, L_TIPO, L_CLIMA, L_TOTAL_HABITANTES, L_DESCRIPCION, L_FK_LUGAR) 

VIAJE (V_CODIGO, V_FK_PASAJERO, V_FK_LUGAR, V_FECHA) 

PASAJERO (P_CODIGO, P_NOMBRE, P_APELLIDO, P_PERFIL, P_FECHA_NACIMIENTO,  P_NUM_TELEFONICO, P_FK_LUGAR_PAIS_RESIDENCIA) 
*/

create DATABASE UADE_Ejercicio2;

use UADE_Ejercicio2;

CREATE TABLE Lugar (
	l_codigo int identity(1, 1) PRIMARY KEY,
	l_nombre varchar(25) NOT NULL,
	l_tipo varchar (25) NOT NULL,
	l_clima varchar (25) NOT NULL,
	l_total_habitantes int NOT NULL,
	l_descripcion varchar (100) NOT NULL,
);

CREATE TABLE Pasajero (
	p_codigo int identity (1, 1) PRIMARY KEY,
	p_nombre varchar (25) NOT NULL,
	p_apellido varchar (30) NOT NULL,
	p_perfil varchar (25) NOT NULL,
	p_fecha_de_nacimiento date NOT NULL,
	p_num_telefonico varchar (25) NOT NULL,
	FOREIGN KEY (p_codigo) REFERENCES Lugar(l_codigo),
);

CREATE TABLE Viaje (
    v_codigo int identity(1, 1) PRIMARY KEY,
    v_fecha date NOT NULL,
    v_cd_pasajero int REFERENCES Pasajero (p_codigo),
    v_cd_lugar int REFERENCES Lugar (l_codigo)
);

ALTER TABLE Lugar
ALTER COLUMN l_total_habitantes bigint NOT NULL;

ALTER TABLE Lugar
ALTER COLUMN l_descripcion varchar(100) NOT NULL;

INSERT INTO Lugar(l_nombre, l_tipo, l_clima, l_total_habitantes, l_descripcion) VALUES 
('Argentina', 'Pais', 'Seco', 48000000, 'Argentina es muy rica en cultura.'),
('Caracas', 'Ciudad', 'Humedo', 3400000, 'Caracas tiene muchos robos'),
('Colombia', 'Pais', 'Tropical', 37500000, 'Colombia es un gran lugar si te gusta el cafe'),
('Espania', 'Pais', 'Mediterraneo', 6500000, 'Espania es caracteristico por sus lindos paisajes y gran historia'),
('Francia', 'Pais', 'Mediterraneo', 4300000, 'Francia es muy interesante si disfrutas de la gastronomia'),
('Italia', 'Pais', 'Mediterraneo', 3850000, 'Italia es la tierra de la pasta'),
('Madrid', 'Ciudad', 'Seco', 1450000, 'Madrid es una de las principales ciudades de Espania'),
('Hong Kong', 'Ciudad', 'Humedo', 12340000, 'Hong Kong es super interesante culturalmente'),
('Rio de Janeiro', 'Ciudad', 'Tropical', 11890000, 'Rio de Janeiro es un lugar al que tenes que ir si disfrutas de las lindas playas.'),
('Brasil', 'Pais', 'Tropical', 145000000, 'Brasil se caracteriza por su gente alegre y las buenas playas'),
('Portugal', 'Pais', 'Mediterraneo', 4250000, 'Portugal es muy rico en cultura y paisajes'),
('Finlandia', 'Pais', 'Frio', 1500000, 'Finlandia es divertido de conocer'),
('Mexico', 'Pais', 'Tropical', 37500000, 'Mexico es un pais muy grande para recorrer');

INSERT INTO Viaje(v_fecha) VALUES 
('2023-09-07'),
('2023-09-08'),
('2023-09-09'),
('2023-09-10'),
('2023-09-11'),
('2023-09-12'),
('2023-09-13'),
('2023-09-14'),
('2023-09-15'),
('2023-09-16');

INSERT INTO Pasajero(p_nombre, p_apellido, p_perfil, p_fecha_de_nacimiento, p_num_telefonico) VALUES
('Ana', 'Lopez', 'Low Cost', '1992-08-17', '555-111-2222'),
('Carlos', 'Garcia', 'Business', '1988-06-25', '666-333-4444'),
('Diego', 'Rodriguez', 'Tourist Class', '1999-02-03', '777-555-6666'),
('Elena', 'Martinez', 'Low Cost', '1995-11-10', '888-777-8888'),
('Fernando', 'Hernandez', 'Business', '1980-04-05', '999-999-9999'),
('Gabriel', 'Perez', 'First Class', '1987-12-20', '333-222-1111'),
('Hugo', 'Lopez', 'Tourist Class', '1993-03-15', '444-333-2222'),
('Isabel', 'Gonzalez', 'Business', '1986-07-05', '555-444-3333'),
('Javier', 'Martinez', 'Low Cost', '1998-01-30', '666-555-4444'),
('Karina', 'Sanchez', 'Business', '1991-10-12', '777-666-5555');


SELECT * FROM Viaje;
SELECT * FROM Lugar;
SELECT * FROM Pasajero;