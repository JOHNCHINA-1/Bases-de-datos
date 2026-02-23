create database Fifa
go
use Fifa
go 

create table Equipos(
IdEquipo int PRIMARY KEY not null,
Nombre varchar (30),
Pais varchar(30)
)
go

create table Jugadores(
CodigoJugador nchar(3) PRIMARY KEY not null,
Nacionalidad varchar(30),
Nombre varchar(30),
Alias varchar(25),
IdEquipoFK int not null,
CONSTRAINT EquipoFK FOREIGN KEY(IdEquipoFK) references Equipos(IdEquipo)
)
go

create table Partidos(
IdPartido int PRIMARY KEY not null,
Lugar varchar(30),
Fecha date,
Hora time
)
go

create table Arbitros(
IdArbitros int identity PRIMARY KEY not null,
Nombre varchar(30),
Nacionalidad varchar (30)
)
go

create table Resultados(
Goles int,
ResultadoPartido varchar(20),
EquipoFK int not null,
PartidoFK int not null,
PRIMARY KEY(EquipoFK, PartidoFK),
FOREIGN KEY(EquipoFK) references Equipos(IdEquipo),
FOREIGN KEY(PartidoFK) references Partidos(IdPartido)
)
go

create table DesignacionArbitros(
Funcion varchar(35),
ArbitrosFK int not null,
PartidosFK int not null,
PRIMARY KEY(ArbitrosFK, PartidosFK),
FOREIGN KEY(ArbitrosFK) references Arbitros(IdArbitros),
FOREIGN KEY(PartidosFK) references Partidos(IdPartido)
)
go

INSERT INTO Equipos (IdEquipo, Nombre, Pais)
VALUES 
    (2, 'Colombia', 'Colombia'),
    (4, 'Brasil', 'Brasil');
    /*
    Para tener en cuenta, una vez que se inserte un valor y se ejecute ese valor
    queda automaticamente ya almacenado, por ende si se vuelve a seleccionar la linea donde se inserta 
    y no donde se selecciona y muestra, salta error por repeticion de la PK,
    por eso es mejor crear primero todo y depues ejecutar.
    */
GO

SELECT * FROM Equipos;
GO

INSERT INTO Jugadores (CodigoJugador, Nacionalidad, Nombre, Alias, IdEquipoFK)
VALUES 
    ('001', 'Colombiano', 'Emma', 'Manolo', 2);
GO

SELECT * FROM Jugadores;
GO