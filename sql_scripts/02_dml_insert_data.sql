INSERT INTO Cliente (Nome, Telefone) VALUES
('Daniel Silva', '62988776655'),
('Maria Joana', '62999887766'),
('Carlos Pereira', '62987654321');

INSERT INTO Entregador (Nome, Telefone, PlacaMoto) VALUES
('João da Moto', '62911112222', 'XYZ-1234'),
('Ana Motoboy', '62933334444', 'ABC-5678');

INSERT INTO FormaPagamento (Tipo) VALUES
('Crédito'),
('Débito'),
('Dinheiro'),
('PIX');

INSERT INTO Pizza (Nome, Descricao, Preco) VALUES
('Calabresa', 'Muçarela, calabresa e cebola.', 45.00),
('Quatro Queijos', 'Muçarela, provolone, parmesão e catupiry.', 55.00),
('Vegetariana', 'Muçarela, brócolis, tomate, pimentão.', 52.50);

INSERT INTO Ingrediente (Nome, QuantidadeDisponivel, EstoqueMinimo) VALUES
('Muçarela', 50.0, 10.0),
('Calabresa', 30.0, 5.0),
('Tomate', 40.0, 8.0);


-- Inserção na tabela Endereco: (ID_Cliente = 1, 2, 3)
INSERT INTO Endereco (Logradouro, Cidade, CEP, ID_Cliente) VALUES
('Rua Principal, 101', 'Anápolis', '75000-000', 1),
('Avenida B, 45', 'Anápolis', '75000-000', 2),
('Rua das Flores, 7', 'Goiânia', '74000-000', 1);

-- Inserção na tabela Pizza_Ingrediente (Ligação N:N)
-- ID_Pizza=1 (Calabresa), ID_Ingrediente=1 (Muçarela), ID_Ingrediente=2 (Calabresa)
INSERT INTO Pizza_Ingrediente (ID_Pizza, ID_Ingrediente, QuantidadeUsada) VALUES
(1, 1, 0.3), 
(1, 2, 0.2); 

-- Inserção na tabela Pedido (FKs: ID_Cliente, ID_Entregador, ID_FormaPagamento)
-- Pedido 1: Cliente Daniel (ID=1), Entregador João (ID=1), PIX (ID=4)
INSERT INTO Pedido (Data, Status, ValorTotal, ID_Cliente, ID_Entregador, ID_FormaPagamento) VALUES
(NOW(), 'Em preparo', 100.00, 1, 1, 4); 

-- Pedido 2: Cliente Maria (ID=2), Entregador Ana (ID=2), Crédito (ID=1)
INSERT INTO Pedido (Data, Status, ValorTotal, ID_Cliente, ID_Entregador, ID_FormaPagamento) VALUES
(NOW(), 'Saiu para entrega', 75.00, 2, 2, 1); 


-- Inserção na tabela ItemPedido (Ligando Pedido e Pizza)
-- Itens do Pedido 1 (ID_Pedido=1): 1x Calabresa (ID=1) e 1x Quatro Queijos (ID=2)
INSERT INTO ItemPedido (Quantidade, ID_Pedido, ID_Pizza) VALUES
(1, 1, 1), 
(1, 1, 2);

-- Itens do Pedido 2 (ID_Pedido=2): 1x Calabresa (ID=1)
INSERT INTO ItemPedido (Quantidade, ID_Pedido, ID_Pizza) VALUES
(1, 2, 1);
