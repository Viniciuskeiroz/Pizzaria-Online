USE pizzaria_online;

-- 1. Consultar os pedidos e seus respectivos clientes
SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.valor_total,
    p.status
FROM Pedido p
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente;

-- 2. Consultar os produtos e seus respectivos estoques
SELECT
    p.nome AS produto,
    p.preco,
    p.categoria,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Produto p
INNER JOIN Estoque e
ON p.id_produto = e.id_produto;

-- 3. Consultar os pagamentos realizados
SELECT
    pg.id_pagamento,
    c.nome AS cliente,
    pg.forma_pagamento,
    pg.valor,
    pg.data_pagamento
FROM Pagamento pg
INNER JOIN Pedido p
ON pg.id_pedido = p.id_pedido
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente;

-- 4. Consultar as entregas e seus entregadores
SELECT
    e.id_entrega,
    p.id_pedido,
    c.nome AS cliente,
    en.nome AS entregador,
    e.status_entrega,
    e.data_saida,
    e.data_entrega
FROM Entrega e
INNER JOIN Pedido p
ON e.id_pedido = p.id_pedido
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente
LEFT JOIN Entregador en
ON e.id_entregador = en.id_entregador;

-- 5. Consultar os cupons cadastrados
SELECT
    codigo,
    valor_desconto,
    data_validade,
    status
FROM Cupom;

-- 6. Consultar o estoque de ingredientes
SELECT
    i.nome AS ingrediente,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Ingrediente i
INNER JOIN Estoque e
ON i.id_ingrediente = e.id_ingrediente;

-- 7. Consultar as promoções e seus produtos
SELECT
    pr.nome AS promocao,
    p.nome AS produto,
    pr.valor_desconto,
    pr.data_inicio,
    pr.data_fim,
    pr.status
FROM Promocao pr
INNER JOIN Produto p
ON pr.id_produto = p.id_produto;

-- 8. Consultar os itens de cada pedido
SELECT
    p.id_pedido,
    pr.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    ip.subtotal
FROM Item_Pedido ip
INNER JOIN Pedido p
ON ip.id_pedido = p.id_pedido
INNER JOIN Produto pr
ON ip.id_produto = pr.id_produto;

-- 9. Consultar os endereços dos clientes
SELECT
    c.nome AS cliente,
    c.cpf,
    c.telefone,
    e.logradouro,
    e.numero,
    e.bairro,
    e.cidade
FROM Cliente c
INNER JOIN Endereco e
ON c.id_cliente = e.id_cliente;

-- 10. Consultar a quantidade de pedidos por situação
SELECT
    status,
    COUNT(*) AS quantidade_pedidos
FROM Pedido
GROUP BY status;