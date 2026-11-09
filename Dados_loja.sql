USE LojaDB

INSERT INTO Categorias (Nome)
VALUES ('Eletrônicos');

INSERT INTO Categorias (Nome)
VALUES ('Roupas');

INSERT INTO Categorias (Nome)
VALUES ('Ferramentas');

SELECT * FROM Categorias;

INSERT INTO Clientes (Nome, Email, Cidade)
VALUES ('Antonio Bandeiras', 'ATBDRAS@gmail.COM', 'Nova Iorque'),
       ('Brad Pitt', 'BRPT@gmail.COM', 'Chicago'),
       ('Megan Fox', 'MGFX@gmail.COM', NULL );

SELECT * FROM Categorias;

INSERT INTO Produtos (Nome, Preco, CategoriaId)
VALUES ('Notebook ACER', 7854.00, 1),
       ('Camisa Wolo Wear', 249.99, 2 ), 
       ('Alicate Amperimetro', 359.00,3),
       ('Mouse Reddragon Cobra', 200.00,1);
        
SELECT * FROM Clientes;

INSERT INTO Pedidos ( ClienteId, Status )
VALUES (4, 'Enviado'),
       (6, 'Aberto'),
       (5, 'Pago');

SELECT * FROM Pedidos;
SELECT * FROM Produtos;

USE LojaDB;

INSERT INTO ItensPedidos (PedidoId, ProdutoId, Quantidade, PrecoUnitario)
VALUES (1, 3, 1, 359.00),
       (1, 2, 1, 249.99),
       (2, 1, 1, 7854.00),
       (3, 3, 1, 359.00);


