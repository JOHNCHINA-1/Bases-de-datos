create database TiendaDB
Use TiendaDB
go

create table Productos(
IdProducto int PRIMARY KEY not null,
Nombre varchar(100) not null,
Precio Decimal (10, 2) not null
)
go

Insert into Productos
Values
(01, 'Lapicero', 2.50),
(02, 'Cuaderno', 5.00),
(03, 'Resma de papel', 12.00),
(04, 'Carpeta plastica', 3.80),
(05, 'Borrador', 1.20),
(06, 'Agenda 2025', 15.50),
(07, 'Calculadora', 25.00),
(08, 'Marcadores', 8.90),
(09, 'Tijeras', 4.20),
(10, 'Pegante en barra', 2.00)

/*Muestra todo de productos*/
Select * 
From Productos

/*Nombre y precio de los productos*/
Select Nombre, Precio
From Productos

Insert into Productos
Values
(11, 'Impresora', 350.00),
(12,'Escritorio', 180.00),
(13, 'Silla Ergonomica', 220.00),
(14, 'Monitor 24 pulgadas', 520.00),
(15, 'Teclado Mecanico', 150.00),
(16, 'Audifonos Profesionales', 85.00)

/*Productos con precio mayor a 50*/
Select *
From Productos
Where Precio > 50

Insert into Productos
Values
(17, 'Chocolate en barra', 5.50),
(18, 'Galletas con chocolate', 3.20),
(19, 'Bebida Con chocolate', 4.80),
(20, 'Crema de chocolate', 7.00),
(21, 'Pastel de chocolate', 12.50),
(22, 'Chocolate Blanco', 6.00)

/*Productos que contengan la palabra chocolate*/
Select *
From Productos
Where Nombre Like('%chocolate%')

/*Ordenado por precio menor a mayor*/
Select Nombre, Precio
From Productos
Order by Precio ASC



