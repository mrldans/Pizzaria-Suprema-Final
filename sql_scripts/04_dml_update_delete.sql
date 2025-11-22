-- COMANDOS UPDATE (Demonstra Alteração de Dados)
-- 1. Mudar o status do Pedido 1 (Daniel) para "Entregue".
UPDATE Pedido
SET Status = 'Entregue'
WHERE ID_Pedido = 1;

-- 2. Corrigir o telefone da cliente 'Maria Joana' (ID=2).
UPDATE Cliente
SET Telefone = '62999001122'
WHERE ID_Cliente = 2;

-- 3. Aplicar um aumento de 10% no preço da pizza 'Quatro Queijos'.
UPDATE Pizza
SET Preco = Preco * 1.10
WHERE Nome = 'Quatro Queijos';


-- COMANDOS DELETE (Demonstra Exclusão Segura)
-- 1. Remover o item 'Calabresa' do Pedido 1 (o cliente desistiu de 1 item).
DELETE FROM ItemPedido
WHERE ID_Pedido = 1 AND ID_Pizza = 1;

-- 2. Remover o endereço secundário de Daniel (ID=1) que fica em 'Goiânia'.
DELETE FROM Endereco
WHERE ID_Cliente = 1 AND Cidade = 'Goiânia';

-- 3. Remover um Ingrediente (Tomate) que está obsoleto (e que não está ligado a nenhuma pizza, o que é seguro).
DELETE FROM Ingrediente
WHERE Nome = 'Tomate';
