
USE pizzaria_online;

INSERT INTO Cliente (nome, cpf, telefone, email)
VALUES ('João Silva', '12345678901', '11987654321', 'joao@email.com');

INSERT INTO Endereco (
    id_cliente, cep, logradouro, numero,
    complemento, bairro, cidade
)
VALUES (
    1, '03301000', 'Rua das Flores', '100',
    'Casa', 'Tatuapé', 'São Paulo'
);

UPDATE Endereco
SET
    cep = '03071-000',
    logradouro = 'R. Cesário Galero',
    numero = '448/475',
    complemento = 'Universidade',
    bairro = 'Tatuapé',
    cidade = 'São Paulo'
WHERE id_endereco = 1;

INSERT INTO Produto (nome, descricao, preco, categoria, disponivel)
VALUES ('Pizza de Calabresa', 'Pizza de calabresa com queijo e cebola', 39.90, 'Salgada', TRUE);

INSERT INTO Pedido (
    id_cliente, id_endereco, data_pedido,
    valor_total, valor_desconto, status,
    cep_entrega, logradouro_entrega, numero_entrega,
    complemento_entrega, bairro_entrega, cidade_entrega
)
VALUES (
    1, 1, NOW(), 39.90, 0, 'Em andamento',
    '03071-000', 'R. Cesário Galero', '448/475',
    'Universidade', 'Tatuapé', 'São Paulo'
);

INSERT INTO Item_Pedido (
    id_pedido, id_produto, quantidade,
    preco_unitario, subtotal
)
VALUES (1, 1, 1, 39.90, 39.90);

INSERT INTO Pagamento (
    id_pedido, forma_pagamento, valor, data_pagamento
)
VALUES (1, 'Pix', 39.90, NOW());

INSERT INTO Entrega (
    id_pedido, id_entregador, status_entrega
)
VALUES (1, NULL, 'Aguardando retirada');

INSERT INTO Entregador (nome, telefone, status)
VALUES ('Carlos Santos', '11999999999', 'Ativo');

UPDATE Entrega
SET id_entregador = 1
WHERE id_pedido = 1;

INSERT INTO Cupom (codigo, valor_desconto, data_validade, status)
VALUES ('PIZZA10', 10.00, '2026-12-31', 'Ativo');

UPDATE Pedido
SET
    id_cupom = 1,
    valor_desconto = 3.99,
    valor_total = 35.91
WHERE id_pedido = 1;

INSERT INTO Estoque (
    id_produto, quantidade_disponivel, quantidade_minima
)
VALUES (1, 50, 10);

INSERT INTO Ingrediente (nome)
VALUES ('Queijo mussarela');

INSERT INTO Estoque (
    id_ingrediente, quantidade_disponivel, quantidade_minima
)
VALUES (1, 20, 5);

INSERT INTO Promocao (
    id_produto, nome, valor_desconto,
    data_inicio, data_fim, status
)
VALUES (
    1, 'Promoção de inauguração', 15.00,
    '2026-11-02', '2026-11-30', 'Ativo'
);

UPDATE Pagamento
SET valor = 35.91
WHERE id_pedido = 1;
