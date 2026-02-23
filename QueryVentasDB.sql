create database VentasDB
go

use VentasDB

Create table Clientes(
ClienteID int identity (1, 1) PRIMARY KEY not null,
Nombre Varchar(30),
Ciudad Varchar(35),
Telefono Varchar(30)
)
go

Create table Productos(
IdProducto int identity(1, 1) PRIMARY KEY not null,
NombreProducto varchar(50),
Precio Decimal(10, 2),
Stock int default '0'
)
go

Create table Ventas(
VentaId int identity (1, 1) PRIMARY KEY not null,
ClienteID int unique not null,
ProductoId int default 'Sin coincidencias',
Cantidad int,
Fecha date,
FOREIGN KEY (ClienteID) references Clientes(ClienteID),
FOREIGN KEY (ProductoId) references Productos (IdProducto)
)
go

Insert into Clientes
Values('Juan', 'Medellin', '3209048209')
Select * from Clientes

Insert into Productos
Values('Aguacate', 3000, 5 )
Select * from Productos

Insert into Ventas
Values(1, 1, '01/04/2022')
Select * from Ventas