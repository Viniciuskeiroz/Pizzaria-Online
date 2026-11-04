
USE pizzaria_online;

-- 1. Conferir a quantidade de registros em cada tabela
SELECT 'Cliente' AS tabela, COUNT(*) AS total FROM Cliente
UNION ALL
SELECT 'Endereco', COUNT(*) FROM Endereco
UNION ALL
SELECT 'Produto', COUNT(*) FROM Produto
UNION ALL
SELECT 'Pedido', COUNT(*) FROM Pedido
UNION ALL
SELECT 'Item_Pedido', COUNT(*) FROM Item_Pedido
UNION ALL
SELECT 'Pagamento', COUNT(*) FROM Pagamento
UNION ALL
SELECT 'Entregador', COUNT(*) FROM Entregador
UNION ALL
SELECT 'Entrega', COUNT(*) FROM Entrega
UNION ALL
SELECT 'Cupom', COUNT(*) FROM Cupom
UNION ALL
SELECT 'Ingrediente', COUNT(*) FROM Ingrediente
UNION ALL
SELECT 'Estoque', COUNT(*) FROM Estoque
UNION ALL
SELECT 'Promocao', COUNT(*) FROM Promocao;

-- 2. Conferir pedidos e seus respectivos clientes
SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.valor_total,
    p.status
FROM Pedido p
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente;

-- 3. Conferir se existem pagamentos com valores diferentes dos pedidos
SELECT
    p.id_pedido,
    p.valor_total,
    pg.valor AS valor_pago
FROM Pedido p
INNER JOIN Pagamento pg
ON p.id_pedido = pg.id_pedido
WHERE p.valor_total <> pg.valor;

-- 4. Conferir produtos sem registro de estoque
SELECT
    p.id_produto,
    p.nome
FROM Produto p
LEFT JOIN Estoque e
ON p.id_produto = e.id_produto
WHERE e.id_estoque IS NULL;

-- 5. Conferir entregas sem entregador responsável
SELECT
    id_entrega,
    id_pedido,
    status_entrega
FROM Entrega
WHERE id_entregador IS NULL;

-- 6. Conferir cupons ativos e suas validades
SELECT
    codigo,
    valor_desconto,
    data_validade,
    status
FROM Cupom
WHERE status = 'Ativo';
