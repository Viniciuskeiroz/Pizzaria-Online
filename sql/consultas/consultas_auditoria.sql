
USE pizzaria_online;

-- 1. Verificar todos os pedidos e seus status
SELECT
    id_pedido,
    id_cliente,
    valor_total,
    valor_desconto,
    status
FROM Pedido;

-- 2. Verificar se os pagamentos correspondem aos pedidos
SELECT
    p.id_pedido,
    p.valor_total,
    pg.valor AS valor_pago,
    pg.forma_pagamento
FROM Pedido p
INNER JOIN Pagamento pg
ON p.id_pedido = pg.id_pedido
WHERE p.valor_total <> pg.valor;

-- 3. Verificar pedidos sem pagamento
SELECT
    p.id_pedido,
    p.valor_total,
    p.status
FROM Pedido p
LEFT JOIN Pagamento pg
ON p.id_pedido = pg.id_pedido
WHERE pg.id_pagamento IS NULL;

-- 4. Verificar pedidos sem entrega cadastrada
SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.status
FROM Pedido p
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente
LEFT JOIN Entrega e
ON p.id_pedido = e.id_pedido
WHERE e.id_entrega IS NULL;

-- 5. Verificar produtos com estoque abaixo do mínimo
SELECT
    p.nome AS produto,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Estoque e
INNER JOIN Produto p
ON e.id_produto = p.id_produto
WHERE e.quantidade_disponivel < e.quantidade_minima;

-- 6. Verificar ingredientes com estoque abaixo do mínimo
SELECT
    i.nome AS ingrediente,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Estoque e
INNER JOIN Ingrediente i
ON e.id_ingrediente = i.id_ingrediente
WHERE e.quantidade_disponivel < e.quantidade_minima;

-- 7. Verificar cupons vencidos
SELECT
    codigo,
    valor_desconto,
    data_validade,
    status
FROM Cupom
WHERE data_validade < CURDATE();

-- 8. Verificar promoções encerradas
SELECT
    nome,
    data_inicio,
    data_fim,
    status
FROM Promocao
WHERE data_fim < CURDATE();

-- 9. Contabilizar pedidos por status
SELECT
    status,
    COUNT(*) AS quantidade_pedidos
FROM Pedido
GROUP BY status;
