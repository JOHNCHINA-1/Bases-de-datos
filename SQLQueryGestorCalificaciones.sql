create database gestorCalificaciones
--drop XXXX, para eliminar objetos, BDs, columnas, etc.
--Truncate XXXX es para eliminar obj y datos pero deja la tabla, en blanco
/* El alter se puede usar para modificar columnas, añadir, eliminar, etc.
pero si se hace una modificacion y se ejecuta y se quiere volver a cambiar se tiene
que crear otro alter, tambien se pueden añadir FKs o PKs; las lineas son: 
- Drop column para eliminar, pero para eliminar se debe ver que no hayan dependencias
como rompimientos
- Add XXXX para añadir
- Alter XXXX para modificar una ya existente */
use gestorCalificaciones

create table Alumnos(
Numero_Id bigint PRIMARY KEY NOT NULL,
Nombres varchar(50) not null,
Apellidos varchar(50) not null,
Telefono numeric(10) not null, --numeric es un tipo de dato numerico que puede delimitar los digitos max en el ()
Correo varchar(30) unique not null,
Direccion varchar(50) null
)
go

create table Parciales(
Codigo_Parcial nchar(5) not null,
Titulo_Parcial varchar(40) not null,
Nro_Preguntas int null,
Fecha_realizacion date,
PRIMARY KEY (Codigo_Parcial)
)
go

create table ResultadosParciales(
Codigo_Parcial nchar(5) not null,
Numero_Id bigint not null,
Nota Float null,
PRIMARY KEY(Codigo_Parcial, Numero_Id),
FOREIGN KEY(Codigo_parcial) references Parciales(Codigo_Parcial),
FOREIGN KEY(Numero_Id) references Alumnos(Numero_Id)
)
go

create table Talleres(
Codigo_Taller int identity not null, /*El identity tiene un indice de inicio y otro de incremento, 
asi: (1,2) inicia en 1 e incrementa de 2 en 2 */
Titulo_Taller varchar(40) not null,
Grado_DIficultad varchar(20) null,
PRIMARY KEY (Codigo_Taller)
)
go

create table ResultadosTalleres(
Codigo_Talleres int not null,
Numero_Id bigint not null,
Nota Float null,
Hora_Parcial time null,
Fecha_Taller date null,
PRIMARY KEY(Codigo_Talleres, Numero_Id),
FOREIGN KEY(Codigo_Talleres) references Talleres(Codigo_Taller),
FOREIGN KEY(Numero_Id) references Alumnos(Numero_Id)
)
go

create table Profesores(
Cedula bigint PRIMARY KEY NOT NULL,
Nombres varchar(50) not null,
Apellidos varchar(50) not null,
Telefono numeric(10) unique not null,
Correo varchar(50) null,
Titulo varchar(50) null
)
go

create table TalleresDesign (
Design_Id int identity(1, 1) PRIMARY KEY,
Cedula bigint not null,
Codigo_Talleres int not null,
Fecha_Last_Design datetime null,
FOREIGN KEY(Cedula) references Profesores(Cedula),
FOREIGN KEY(Codigo_Talleres) references Talleres(Codigo_Taller)
)
go