CREATE DATABASE pizzaria_online;

USE pizzaria_online;

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    disponivel BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    id_cupom INT,
    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    valor_desconto DECIMAL(10,2) NOT NULL DEFAULT 0,
    status ENUM('Em andamento', 'Entregue', 'Cancelado') NOT NULL,
    cep_entrega VARCHAR(10) NOT NULL,
    logradouro_entrega VARCHAR(150) NOT NULL,
    numero_entrega VARCHAR(10) NOT NULL,
    complemento_entrega VARCHAR(100),
    bairro_entrega VARCHAR(100) NOT NULL,
    cidade_entrega VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Item_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    forma_pagamento ENUM(
        'Pix',
        'Dinheiro',
        'Cartão de crédito',
        'Cartão de débito'
    ) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Entregador (
    id_entregador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo'
);

CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE,
    id_entregador INT,
    status_entrega ENUM(
        'Aguardando retirada',
        'Saiu para entrega',
        'Entregue'
    ) NOT NULL DEFAULT 'Aguardando retirada',
    data_saida DATETIME,
    data_entrega DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_entregador) REFERENCES Entregador(id_entregador)
);

CREATE TABLE Cupom (
    id_cupom INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    valor_desconto DECIMAL(5,2) NOT NULL,
    data_validade DATE NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo'
);

CREATE TABLE Ingrediente (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT UNIQUE,
    id_ingrediente INT UNIQUE,
    quantidade_disponivel DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantidade_minima DECIMAL(10,2) NOT NULL DEFAULT 0,
    data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente),
    CHECK (
        (id_produto IS NOT NULL AND id_ingrediente IS NULL)
        OR
        (id_produto IS NULL AND id_ingrediente IS NOT NULL)
    )
);

CREATE TABLE Promocao (
    id_promocao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    valor_desconto DECIMAL(5,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

ALTER TABLE Pedido
ADD CONSTRAINT fk_pedido_cupom
FOREIGN KEY (id_cupom) REFERENCES Cupom(id_cupom);

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
    id_cliente,
    id_endereco,
    data_pedido,
    valor_total,
    valor_desconto,
    status,
    cep_entrega,
    logradouro_entrega,
    numero_entrega,
    complemento_entrega,
    bairro_entrega,
    cidade_entrega
)
VALUES (
    1,
    1,
    NOW(),
    39.90,
    0,
    'Em andamento',
    '03071-000',
    'R. Cesário Galero',
    '448/475',
    'Universidade',
    'Tatuapé',
    'São Paulo'
);


INSERT INTO Item_Pedido (
    id_pedido,
    id_produto,
    quantidade,
    preco_unitario,
    subtotal
)
VALUES (1, 1, 1, 39.90, 39.90);

INSERT INTO Pagamento (
    id_pedido,
    forma_pagamento,
    valor,
    data_pagamento
)
VALUES (
    1,
    'Pix',
    39.90,
    NOW()
);

INSERT INTO Entrega (
    id_pedido,
    id_entregador,
    status_entrega
)
VALUES (
    1,
    NULL,
    'Aguardando retirada'
);

INSERT INTO Entregador (nome, telefone, status)
VALUES ('Carlos Santos', '11999999999', 'Ativo');

UPDATE Entrega
SET id_entregador = 1
WHERE id_pedido = 1;


INSERT INTO Cupom (
    codigo,
    valor_desconto,
    data_validade,
    status
)
VALUES (
    'PIZZA10',
    10.00,
    '2026-12-31',
    'Ativo'
);


UPDATE Pedido
SET
    id_cupom = 1,
    valor_desconto = 3.99,
    valor_total = 35.91
WHERE id_pedido = 1;


INSERT INTO Estoque (
    id_produto,
    quantidade_disponivel,
    quantidade_minima
)
VALUES (
    1,
    50,
    10
);

INSERT INTO Ingrediente (nome)
VALUES ('Queijo mussarela');


INSERT INTO Estoque (
    id_ingrediente,
    quantidade_disponivel,
    quantidade_minima
)
VALUES (
    1,
    20,
    5
);

INSERT INTO Promocao (
    id_produto,
    nome,
    valor_desconto,
    data_inicio,
    data_fim,
    status
)
VALUES (
    1,
    'Promoção de inauguração',
    15.00,
    '2026-11-02',
    '2026-11-30',
    'Ativo'
);

SELECT * FROM Cliente;
SELECT * FROM Endereco;
SELECT * FROM Produto;
SELECT * FROM Pedido;
SELECT * FROM Item_Pedido;
SELECT * FROM Pagamento;
SELECT * FROM Entregador;
SELECT * FROM Entrega;
SELECT * FROM Cupom;
SELECT * FROM Ingrediente;
SELECT * FROM Estoque;
SELECT * FROM Promocao;


DELETE FROM Promocao
WHERE id_promocao = 2;

SELECT * FROM Promocao;

UPDATE Pagamento
SET valor = 35.91
WHERE id_pedido = 1;


SELECT
    p.id_pedido,
    c.nome AS cliente,
    pr.nome AS produto,
    ip.quantidade,
    p.valor_desconto,
    p.valor_total,
    pg.forma_pagamento,
    pg.valor AS valor_pago,
    e.status_entrega,
    en.nome AS entregador
FROM Pedido p
JOIN Cliente c ON p.id_cliente = c.id_cliente
JOIN Item_Pedido ip ON p.id_pedido = ip.id_pedido
JOIN Produto pr ON ip.id_produto = pr.id_produto
JOIN Pagamento pg ON p.id_pedido = pg.id_pedido
JOIN Entrega e ON p.id_pedido = e.id_pedido
LEFT JOIN Entregador en ON e.id_entregador = en.id_entregador
WHERE p.id_pedido = 1;


SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.valor_total,
    p.status
FROM Pedido p
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente;


SELECT
    p.nome AS produto,
    p.preco,
    p.categoria,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Produto p
INNER JOIN Estoque e
ON p.id_produto = e.id_produto;


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

SELECT
    codigo,
    valor_desconto,
    data_validade,
    status
FROM Cupom;


SELECT
    i.nome AS ingrediente,
    e.quantidade_disponivel,
    e.quantidade_minima
FROM Ingrediente i
INNER JOIN Estoque e
ON i.id_ingrediente = e.id_ingrediente;

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

SELECT
    status,
    COUNT(*) AS quantidade_pedidos
FROM Pedido
GROUP BY status;