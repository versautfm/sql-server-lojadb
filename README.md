# 🏪 LojaDB: banco de dados de uma loja no SQL Server

Projeto de estudo de **SQL Server**, construído passo a passo enquanto aprendo SQL do zero.

O banco simula uma loja: **clientes**, **categorias**, **produtos**, **pedidos** e os **itens** de cada pedido.

## 🗂️ Modelo de dados

```mermaid
erDiagram
    Categorias ||--o{ Produtos : "tem"
    Clientes ||--o{ Pedidos : "faz"
    Pedidos ||--|{ ItensPedidos : "contém"
    Produtos ||--o{ ItensPedidos : "aparece em"

    Categorias {
        INT Id PK
        VARCHAR Nome
    }
    Clientes {
        INT Id PK
        VARCHAR Nome
        VARCHAR Email
        VARCHAR Cidade "opcional"
    }
    Produtos {
        INT Id PK
        VARCHAR Nome
        DECIMAL Preco "maior que 0"
        INT CategoriaId FK
    }
    Pedidos {
        INT Id PK
        INT ClienteId FK
        DATETIME DataPedido "padrão: data atual"
        VARCHAR Status "Aberto, Pago, Enviado ou Cancelado"
    }
    ItensPedidos {
        INT Id PK
        INT PedidoId FK
        INT ProdutoId FK
        INT Quantidade "maior que 0"
        DECIMAL PrecoUnitario "maior que 0"
    }
```

Um pedido pode ter vários produtos. Por isso os produtos de cada pedido ficam na tabela `ItensPedidos`, e não dentro de `Pedidos`. O `PrecoUnitario` guarda o preço do momento da compra, porque o preço do produto pode mudar depois.

## 📁 Arquivos

| Arquivo | O que faz |
|---|---|
| [`LojaBD.sql`](LojaBD.sql) | Apaga e recria o banco `LojaDB` com todas as tabelas. |
| [`Dados_loja.sql`](Dados_loja.sql) | Insere dados de exemplo em todas as tabelas. |

## ▶️ Como executar

1. Instale o **SQL Server** (a edição Developer é gratuita) e o **SSMS**.
2. Abra `LojaBD.sql` no SSMS e execute com **F5**.
3. Abra `Dados_loja.sql` e execute com **F5**.

> ⚠️ `LojaBD.sql` começa com `DROP DATABASE IF EXISTS LojaDB`, então rodá-lo de novo **apaga todos os dados** e recria o banco vazio.

## 🧠 O que já pratiquei

- `CREATE DATABASE` e `CREATE TABLE`
- Chave primária com numeração automática (`PRIMARY KEY`, `IDENTITY`)
- Chave estrangeira (`FOREIGN KEY ... REFERENCES`)
- Regras de integridade: `NOT NULL`, `CHECK` e `DEFAULT GETDATE()`
- `INSERT` com várias linhas, `DELETE ... WHERE`
- Consultas com `SELECT`, `WHERE` e `ORDER BY`

## 🚧 Próximos passos

- [ ] `JOIN` entre tabelas
- [ ] Agregações com `GROUP BY` (faturamento por categoria, por cliente...)
- [ ] Email único para cada cliente
- [ ] Views, stored procedures e triggers
- [ ] Índices e análise de desempenho
