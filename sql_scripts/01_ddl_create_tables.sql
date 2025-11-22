-- DDL: CREATE TABLEs

CREATE TABLE Cliente (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15)
);

CREATE TABLE Entregador (
    ID_Entregador SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(15),
    PlacaMoto VARCHAR(10)
);

CREATE TABLE FormaPagamento (
    ID_FormaPagamento SERIAL PRIMARY KEY,
    Tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Pizza (
    ID_Pizza SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(8,2) NOT NULL
);

CREATE TABLE Ingrediente (
    ID_Ingrediente SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    QuantidadeDisponivel DECIMAL(8,2) NOT NULL,
    EstoqueMinimo DECIMAL(8,2) NOT NULL
);

CREATE TABLE Endereco (
    ID_Endereco SERIAL PRIMARY KEY,
    Logradouro VARCHAR(200) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    CEP VARCHAR(10),
    ID_Cliente INTEGER NOT NULL REFERENCES Cliente (ID_Cliente)
);

CREATE TABLE Pedido (
    ID_Pedido SERIAL PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    Status VARCHAR(20) NOT NULL,
    ValorTotal DECIMAL(10,2) NOT NULL,
    ID_Cliente INTEGER NOT NULL REFERENCES Cliente (ID_Cliente),
    ID_Entregador INTEGER REFERENCES Entregador (ID_Entregador),
    ID_FormaPagamento INTEGER NOT NULL REFERENCES FormaPagamento (ID_FormaPagamento)
);

CREATE TABLE Pizza_Ingrediente (
    ID_Pizza INTEGER NOT NULL REFERENCES Pizza (ID_Pizza),
    ID_Ingrediente INTEGER NOT NULL REFERENCES Ingrediente (ID_Ingrediente),
    QuantidadeUsada DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (ID_Pizza, ID_Ingrediente)
);

CREATE TABLE ItemPedido (
    ID_ItemPedido SERIAL PRIMARY KEY,
    Quantidade INTEGER NOT NULL,
    ID_Pedido INTEGER NOT NULL REFERENCES Pedido (ID_Pedido),
    ID_Pizza INTEGER NOT NULL REFERENCES Pizza (ID_Pizza)
);
