SELECT
    E.Nome AS Entregador,
    COUNT(P.ID_Pedido) AS Total_Pedidos_Entregues,
    COALESCE(SUM(P.ValorTotal), 0) AS Faturamento_Total_R$
FROM
    Entregador E
LEFT JOIN
    Pedido P ON E.ID_Entregador = P.ID_Entregador
    AND P.Status = 'Saiu para entrega' -- Consulta apenas pedidos em status que exigem entregador
GROUP BY
    E.Nome
ORDER BY
    Faturamento_Total_R$ DESC;


-- 2. Top 3 Pizzas Mais Vendidas (Demonstra Agregação, JOIN e Ranking - LIMIT)
-- Mostra quais pizzas geram mais volume de venda.
SELECT
    P.Nome AS Nome_da_Pizza,
    SUM(IP.Quantidade) AS Quantidade_Total_Vendida
FROM
    Pizza P
JOIN
    ItemPedido IP ON P.ID_Pizza = IP.ID_Pizza
GROUP BY
    P.Nome
ORDER BY
    Quantidade_Total_Vendida DESC
LIMIT 3;


-- 3. Ingredientes em Nível Crítico de Estoque (Demonstra Condição WHERE)
-- Identifica ingredientes que estão abaixo do limite mínimo definido.
SELECT
    Nome AS Ingrediente,
    QuantidadeDisponivel,
    EstoqueMinimo
FROM
    Ingrediente
WHERE
    QuantidadeDisponivel < EstoqueMinimo; -- Nenhum deve aparecer se o estoque inicial for alto.


-- 4. Pedidos Pendentes (Status: Em preparo) com Endereço do Cliente (Demonstra JOIN em 3 Tabelas)
-- Usado para a cozinha ver quem está esperando e onde entregar.
SELECT
    P.ID_Pedido,
    P.Data AS Data_do_Pedido,
    C.Nome AS Cliente,
    A.Logradouro || ', ' || A.Cidade AS Endereco_Completo -- Concatena o endereço
FROM
    Pedido P
JOIN
    Cliente C ON P.ID_Cliente = C.ID_Cliente
JOIN
    Endereco A ON C.ID_Cliente = A.ID_Cliente
WHERE
    P.Status = 'Em preparo'
ORDER BY
    P.Data ASC;
