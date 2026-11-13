
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

SELECT * FROM Pedidos

SELECT * FROM Produtos;
SELECT * FROM ItensPedidos;

SELECT ItensPedidos.PedidoId as Pedido, Produtos.nome as Produto, 
ItensPedidos.Quantidade, Clientes.Nome as Cliente
From ItensPedidos
JOIN Produtos ON ItensPedidos.ProdutoId = Produtos.Id
JOIN Pedidos ON ItensPedidos.PedidoId= Pedidos.Id
JOIN Clientes ON Pedidos.ClienteId = Clientes.Id;

USE LojaDB

SELECT COUNT(*) AS TotalProdutos
FROM Produtos;

SELECT AVG(Preco) AS PrecoMedio,
       MAX(Preco) AS MaisCaro,
       MIN(Preco) as MaisBarato
FROM Produtos;

SELECT Categorias.Nome AS Categoria,
       AVG(Produtos.Preco) AS QtdProdutos
FROM Produtos
JOIN Categorias ON Produtos.CategoriaId = Categorias.Id
GROUP BY Categorias.Nome;

USE LojaDB

SELECT * FROM Produtos
SELECT * FROM ItensPedidos
SELECT * FROM Clientes
SELECT * FROM Pedidos

SELECT Clientes.Nome,
       SUM(ItensPedidos.Quantidade * ItensPedidos.PrecoUnitario) AS TotalGasto
FROM Clientes
JOIN Pedidos ON Pedidos.ClienteId = Clientes.Id
JOIN ItensPedidos ON ItensPedidos.PedidoId = Pedidos.Id
GROUP BY Clientes.Nome
ORDER BY TotalGasto DESC;

SELECT Clientes.Nome,
       SUM(ItensPedidos.Quantidade * ItensPedidos.PrecoUnitario) AS TotalGasto
FROM Clientes
JOIN Pedidos ON Pedidos.ClienteId = Clientes.Id
JOIN ItensPedidos ON ItensPedidos.PedidoId = Pedidos.Id
GROUP BY Clientes.Nome
HAVING SUM(ItensPedidos.Quantidade * ItensPedidos.PrecoUnitario) < 100
ORDER BY TotalGasto DESC;