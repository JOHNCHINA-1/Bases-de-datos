create database TablasNormalizacion
Use TablasNormalizacion
go

Create table Restaurante(
ID int PRIMARY KEY not null,
Nombre varchar(50) not null,
Tipo varchar(40) not null,
Ciudad varchar(40),
Direccion varchar(50),
CodPostal varchar(20)
)
go

Insert into Restaurante Values
(1, 'Sabor paisa', 'Comida Colombiana', 'Medellin','calle 15, 10B14', '04001'),
(2, 'Toque picoso', 'Comida Mexicana', 'Cali','calle 31, 09v12', '10010'),
(3, 'Aqua Style', 'Comida Maritima', 'Bogota', 'calle 15, 10A15', '6001')
go

Create table Colegio(
IdColegio int not null PRIMARY KEY,
TipoColegio varchar(30) Check(TipoColegio in ('Publico', 'Privado')),
Nombre varchar(50),
Ciudad varchar(30),
Direccion varchar(50),
CodPostal varchar (20)
)
go

Insert into Colegio Values
(101, 'Publico', 'ColegioA', 'Lima', 'cl 30, 15', '1201'),
(102, 'Privado', 'ColegioB', 'Santiago De Chile', 'cl 11, 10', '30410'),
(103, 'Publico', 'COlegioC', 'Bucaramanga', 'cl 2, 303', '5500')
go

Create table Clinica(
IdClinica int not null PRIMARY KEY,
Nombre varchar(50),
Eps varchar(40),
Sede varchar (30),
Direccion varchar(40),
TipoTramite varchar (50) 
Check(TipoTramite in ('Atencion general', 'Cardiologia', 'Laboratorio'))
)
go

Insert into Clinica Values
(1001, 'Padre nuestro', 'Sura', 'San diego', 'ABC', 'Atencion general'),
(1002, 'Que estas', 'SaludTotal', 'Monterrey', 'DFG', 'Cardiologia'),
(1003, 'En los cielos', 'SaludCoop', 'Chagualo', 'HIJ', 'Laboratorio')
go

