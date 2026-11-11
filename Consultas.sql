
USE LojaDB;

SELECT * FROM Produtos;
SELECT * FROM Clientes;

SELECT *
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteId = Clientes.Id;

SELECT Pedidos.Id as Pedido ,Clientes.Nome as Cliente,
Pedidos.Status 
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteId = Clientes.Id;

SELECT * FROM Produtos;
SELECT * FROM Categorias;

SELECT Produtos.Nome AS Produto, Produtos.Preco, 
Categorias.Nome AS Categoria
FROM Produtos
JOIN Categorias ON Produtos.CategoriaId= Categorias.Id 
WHERE Categorias.Nome = 'eletrônicos';
