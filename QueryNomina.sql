create database NominaDB
go

use NominaDB

Create table Departamento(
DepartamentoID int identity(0, 2) PRIMARY KEY not null,
Nombre Varchar(50) not null
)
go

Create table Cargo(
CargoID int identity (1, 1) PRIMARY KEY,
Nombre varchar(30) not null,
SalarioBase Decimal (10, 2),
IdDepartamento int not null,
FOREIGN KEY (idDepartamento) references Departamento (DepartamentoID)
)
go

Create table TipoContrato(
ContratoID int identity(0, 5) PRIMARY KEY,
Descripcion varchar(100) not null
)
go

Create table Empleado(
EmpleadoID int identity (10, 1)PRIMARY KEY,
Documento varchar(20) unique not null,
Nombre varchar(30) not null,
Apellidos varchar(50) not null,
FechaIngreso date not null,
IdCargo int not null,
TipoContratoId int not null,
FOREIGN KEY (IdCargo) references Cargo (CargoID),
FOREIGN KEY (TipoContratoId) references TipoContrato (ContratoID),
)
go

Create table Nomina(
NominaID int identity(1, 1) PRIMARY KEY,
EmpleadoID int not null,
FechaInicio date not null,
FechaFin date not null,
TotalDevengado Decimal (10, 2),
TotalDeducciones Decimal (10, 2),
NetoPagar Decimal (10, 2),
FOREIGN KEY (EmpleadoID) references Empleado (EmpleadoID)
)
go

Create table DetalleNomina(
DetalleID int identity (0, 2) PRIMARY KEY,
NominaID int not null,
Concepto varchar(100) not null,
Tipo varchar(20) CHECK (Tipo IN ('Devengado', 'Deduccion')),
Valor Decimal (10, 2) not null,
FOREIGN KEY (NominaID) references Nomina (NominaID)
)
go