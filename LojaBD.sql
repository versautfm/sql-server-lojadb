USE master;
GO
DROP DATABASE IF EXISTS LojaDB;
GO
CREATE DATABASE LojaDB;
GO
USE LojaDB;

CREATE TABLE Categorias (
     Id INT IDENTITY(1,1) PRIMARY KEY,
     Nome VARCHAR(50) NOT NULL
   );

CREATE TABLE Clientes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
     Nome VARCHAR(100) NOT NULL,
     Email VARCHAR(100) NOT NULL,
     Cidade VARCHAR(50)
     
  );
  
 CREATE TABLE Produtos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL CHECK (Preco > 0 ),
    CategoriaId INT NOT NULL FOREIGN KEY REFERENCES 
    Categorias(Id)

  ); 

   CREATE TABLE Pedidos (
      Id INT IDENTITY(1,1) PRIMARY KEY,
      ClienteId INT NOT NULL FOREIGN KEY REFERENCES 
      Clientes(Id),
      DataPedido DATETIME NOT NULL DEFAULT GETDATE(),
      Status VARCHAR(20) NOT NULL CHECK (Status IN ( 'Aberto','Pago','Enviado','Cancelado'))
 );

 CREATE TABLE ItensPedidos (
     Id INT IDENTITY(1,1) PRIMARY KEY,
     PedidoId INT NOT NULL FOREIGN KEY REFERENCES 
     Pedidos(Id),
     ProdutoId INT NOT NULL FOREIGN KEY REFERENCES 
     Produtos(Id),
     Quantidade INT NOT NULL CHECK( Quantidade >0),
     PrecoUnitario DECIMAL(15,2) NOT NULL CHECK( PrecoUnitario >0)
 );

 SELECT * FROM ItensPedidos