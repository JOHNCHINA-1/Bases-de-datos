create database LibrosSaber
go

use LibrosSaber
go

create table Socios(
SocioId int PRIMARY KEY not null,
CodigoSocio int unique not null,
PrimerNombre varchar(30) not null,
SegundoNombre varchar(30),
Direccion varchar(30),
Email varchar(50)
)
go

create table Autores(
AutorId int identity(5, 5) PRIMARY KEY not null,
PrimerNombre varchar(30) not null,
SegundoNombre varchar(30),
Nacionalidad varchar(30)
)
go

create table Editoriales(
EditorialId int PRIMARY KEY not null,
NombreEditorial varchar(30) not null,
Pais varchar(25)
)
go

create table Libros(
LibroId int PRIMARY KEY not null,
TituloLibro varchar(30) not null,
Genero varchar(20),
Stock int,
IdEditorialFK int not null,
IdAutorFK int not null,
FOREIGN KEY(IdEditorialFK) references Editoriales(EditorialId),
FOREIGN KEY(IdAutorFK) references Autores(AutorId)
)
go

create table Prestamos(
PrestamoId nchar(5) PRIMARY KEY not null,
FechaPrestamo datetime,
FechaDevolucion datetime,
Total float,
SocioIdFK int not null,
LibroIdFK int not null,
FOREIGN KEY(SocioIdFK) references Socios(SocioId),
FOREIGN KEY(LibroIdFK) references Libros(LibroId)
)
go

INSERT INTO Socios VALUES
(1, 100, 'Juan', 'Manuel', 'Calle 90 ', 'JuanManuelGmail'),
(2, 101, 'Andrea', null, 'Calle 91', 'AndreitaGmail'),
(3, 102, 'Juan', 'Carlos', 'Calle 92', 'HernannnGmail')

INSERT INTO Autores VALUES
('Creador1', null, 'Colombiano'),
('Creador2', null, 'Argentino'),
('Creador3', null, 'Peruano')

INSERT INTO Editoriales VALUES
(1, 'Editorial1', 'Colombia'),
(2, 'Editorial2', 'brasil'),
(3, 'Editorial3', 'Ecuador')

INSERT INTO Libros VALUES
(1, 'Libro1', 'Romatico', 3, 1, 5),
(2, 'Libro2', 'Terror', 1, 2, 10),
(3, 'Libro3', 'Comedia', null, 3, 15)

INSERT INTO Prestamos VALUES
(00001, null, null, 35.4, 1, 1),
(00002, '2025/10/10 7:30', '2025/10/11 20:30', 20000, 2, 2),
(00003, null, null, null, 3, 3)

Alter table Socios alter column Direccion varchar(50)
Alter table Socios drop column Direccion

SELECT * FROM Socios 

SELECT * FROM Autores

SELECT * FROM Editoriales

SELECT * FROM Libros

SELECT * FROM Prestamos
