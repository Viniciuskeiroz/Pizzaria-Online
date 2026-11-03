USE pizzaria_online;

-- 1. Quantidade de pedidos por status
SELECT status, COUNT(*) AS quantidade_pedidos
FROM Pedido
GROUP BY status;

-- 2. Produtos mais vendidos
SELECT Produto.nome, SUM(Item_Pedido.quantidade) AS total_vendido
FROM Item_Pedido
INNER JOIN Produto ON Item_Pedido.id_produto = Produto.id_produto
GROUP BY Produto.id_produto, Produto.nome
ORDER BY total_vendido DESC;

-- 3. Estoque abaixo da quantidade mínima
SELECT *
FROM Estoque
WHERE quantidade_disponivel < quantidade_minima;

-- 4. Entregas ainda não concluídas
SELECT Pedido.id_pedido,
       Entrega.status_entrega,
       Entregador.nome AS entregador
FROM Entrega
INNER JOIN Pedido ON Entrega.id_pedido = Pedido.id_pedido
LEFT JOIN Entregador ON Entrega.id_entregador = Entregador.id_entregador
WHERE Entrega.status_entrega <> 'Entregue';
