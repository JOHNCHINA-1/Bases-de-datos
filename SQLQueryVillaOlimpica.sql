create database VillaOlimpica
go
use VillaOlimpica
go

create table Paises(
Pais_Id int identity(2, 2) PRIMARY KEY not null,
Nombre_Pais varchar(40) not null,
Medallas_Oro int,
Medallas_Plata int,
Medallas_Bronce int
)
go

create table Atletas(
Numero_Id varchar(15) PRIMARY KEY not null,
Primer_Nombre varchar(15) not null,
Segundo_Nombre varchar(10),
Primer_Apellido varchar(20) not null,
Segundo_Apellido varchar(20) not null,
Fecha_Nacimiento date,
Genero nchar(10),
Pais_Id_FK int not null,
constraint RelacionPaisAtletas FOREIGN KEY(Pais_Id_FK) references Paises(Pais_Id)
)
go

create table Estadios(
Id_Estadio nchar(3) PRIMARY KEY not null,
Nombre_Estadio varchar (40) not null,
Ubicacion varchar(40),
Capacidad int,
)
go 

create table EquipoEspecial(
Id_Equipamiento numeric(5) PRIMARY KEY not null,
Descripcion varchar(40) 
)
go 

create table Deportes(
Id_Deporte int PRIMARY KEY not null,
Nombre_Deporte varchar(50) not null,
Descripcion varchar(100)
)
go 

create table Competicion(
Id_Competicion int PRIMARY KEY	not null,
Modalidad varchar(15) not null,
Fecha_Incio date ,
Fecha_Finalizacion date,
Hora_Inicio time ,
Hora_Fin time,
Genero nchar(20),
Id_DeporteFK int not null,
Id_EstadioFK nchar(3) not null,
Id_EquipamientoFK numeric(5) not null, --En las relaciones que tengan un limite de digitos se tiene que poner tal cual
FOREIGN KEY(Id_DeporteFK) references Deportes(Id_Deporte),
FOREIGN KEY(Id_EstadioFK) references Estadios(Id_Estadio),
FOREIGN KEY(Id_EquipamientoFK) references EquipoEspecial(Id_Equipamiento)
)
go 

create table Resultados(
Id_Resultados int PRIMARY KEY not null,
Posicion_Final int,
Marca varchar(25),
AtletasId_FK varchar(15) not null,
CompeId_FK int not null,
FOREIGN KEY(AtletasId_FK) references Atletas(NUmero_Id),
FOREIGN KEY(CompeId_FK) references Competicion(Id_Competicion)
)
go

--insertamos registros / llenamos las tablas
--Para reutilizar el codigo no se deben de hacer tantos Inserts de 1 tabla, se pueden separar solo por ,

INSERT INTO Paises(Nombre_Pais, Medallas_Oro, Medallas_Plata, Medallas_Bronce) 
VALUES ('Colombia', 100, 200, null), ('argentina', 5, 50, 80)

INSERT INTO Atletas VALUES('10293028', 'Ana', 'Lisa', 'Mela', 'D', '1999-03-13', 'Femenino', 2)

INSERT INTO Estadios VALUES('1', 'Bochim', 'ABCD', 100)

INSERT INTO EquipoEspecial VALUES(4, 'Sirve para respirar bajo el agua')

INSERT INTO Deportes VALUES(1, 'Futbol', 'Gol, solo gol y gol')

/* Alter

No se pueden cambiar los tipos de datos cuando ya hay registros creados, si no coinciden
por ejemplo de date a int, ya no, pero si a varchar o datetime porque son similares y se
escriben con el mismo formato, osea con ''

Las Fks o PKs se pueden añadir cuando ya esten definidas con el alter: 
Alter table XXXX add Pk (nombre) 
Alter table XXXX add Fk (nombre de la FK) reference XXXX(nombre de la PK)
*/

Alter table Atletas add Email varchar(20)

Alter table Atletas drop column Email

Alter table Atletas alter column Fecha_Nacimiento int

SELECT * FROM Paises --El asterisco selecciona todas las comlumnas y valores de la tabla