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
