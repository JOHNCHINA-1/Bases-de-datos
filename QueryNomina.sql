create database NominaDataBase
go

use NominaDataBase

CREATE TABLE Departamento (
IdDepartamento INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Cargo (
IdCargo INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
SalarioBase DECIMAL(10,2) NOT NULL,
IdDepartamento INT NOT NULL, FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
);

CREATE TABLE TipoContrato (
IdTipoContrato INT IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
Documento VARCHAR(20) UNIQUE NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
FechaIngreso DATE NOT NULL,
IdCargo INT NOT NULL,
IdTipocontrato INT NOT NULL, FOREIGN KEY (IdCargo) REFERENCES Cargo(IdCargo),
FOREIGN KEY (IdTipoContrato) REFERENCES TipoContrato(IdTipoContrato)
);

CREATE TABLE Nomina (
IdNomina INT IDENTITY(1,1) PRIMARY KEY,
IdEmpleado INT NOT NULL,
FechaInicio DATE NOT NULL,
FechaFin DATE NOT NULL,
TotalDevengado DECIMAL (10,2),
TotalDeducciones DECIMAL (10,2),
NetoPagar DECIMAL(10,2),
FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);

CREATE TABLE DetalleNomina (
IdDetalle INT IDENTITY(1,1) PRIMARY KEY,
IdNomina INT NOT NULL,
Concepto VARCHAR (100) NOT NULL,
Tipo VARCHAR(20) CHECK (Tipo IN ('DEVENGADO', 'DEDUCCION')),
Valor DECIMAL(10,2) NOT NULL, FOREIGN KEY (IdNomina) REFERENCES Nomina (IdNomina)
);

Insert into Departamento
Values
('Sistemas'), ('Contabilidad'), ('RRHH'), ('Ventas')


Insert into Cargo
Values
('Desarollador', 3500000, 1),
('Analista contable', 28000000, 2 ),
('Auxiliar RRHH', 2200000, 3), 
('Ejecutivo COmercial', 30000000, 4)


Insert into	TipoContrato
Values 
('Termino fijo'), ('Termino indefinido'), ('Prestacion de servicios')

Insert into	Empleado
Values
('1010','Juan','Perez', '2024-01-10', 1, 2), 
('2020', 'Maria', 'Gomez','2023-05-15', 2, 1), 
('3030', 'Carlos', 'Lopez', '2022-08-01', 4, 2)


Insert into Nomina (IdEmpleado,FechaInicio, FechaFin)
Values
(1, '2026-05-01', '2026-05-31'),
(2, '2026-05-01','2026-05-31'), 
(3, '2026-05-01','2026-05-31')

Insert into DetalleNomina
Values
(1, 'Salario Basico', 'DEVENGADO', 3500000),
(1, 'Salud', 'DEDUCCION', 1400000 ),
(1, 'Pension', 'DEDUCCION', 140000), 
(2, 'Salario Basico', 'DEVENGADO', 28000000),
(2, 'Salud', 'DEDUCCION', 112000),
(2, 'Pension', 'DEDUCCION', 112000),
(3, 'Salario Basico', 'DEVENGADO', 3000000),
(3, 'Comision', 'DEVENGADO', 500000),
(3, 'Salud', 'DEDUCCION', 140000)

Select * from Departamento

Select * from Cargo
Where SalarioBase > 3000000

Select * from TipoContrato

Select * from Empleado

Select * from Empleado
Where IdTipoContrato = 2

Select E.Nombre, E.Apellido, C.Nombre as Cargo, D.Nombre as Departamento
From Empleado E JOIN Cargo C
on E.IdCargo = C.IdCargo JOIN Departameno.D
on C.IdDepartamento = D.IdDepartamento

Select E.Nombre, Sum(DN.Valor) as TotalDevengado
From Empleado E JOIN Nomina N 
on E.IdEmpleado = N.IdEmpleado JOIN DetalleNomina DN
on N.IdNomina = DN.IdNomina
Where DN.Tipo = 'DEVENGADO'
Group By E.Nombre

Select E.Nombre Sum(DN.Valor)as TotalDeducciones
From Empleado E JOIN Nomina N 
on E.IdEmpleado = N.IdEmpleado JOIN DetalleNomina DN
on N.IdNomina = DN.IdNomina
Where DN.Tipo = 'DEDUCCION'
Group By E.Nombre