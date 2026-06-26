CREATE DATABASE loja_online;
USE loja_online;

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20)
);

CREATE TABLE produtos (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(10,2),
estoque INT
);

CREATE TABLE funcionarios (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
cargo VARCHAR(50),
comissao DECIMAL(10,2)
);

CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
data_pedido DATE,
valor_total DECIMAL(10,2),
id_cliente INT,
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
id_item INT AUTO_INCREMENT PRIMARY KEY,
id_pedido INT,
id_produto INT,
quantidade INT,
subtotal DECIMAL(10,2),

```
FOREIGN KEY (id_pedido)
    REFERENCES pedidos(id_pedido),

FOREIGN KEY (id_produto)
    REFERENCES produtos(id_produto)
```

);

INSERT INTO clientes(nome,email,telefone) VALUES
('Ana Silva','[ana1@email.com](mailto:ana1@email.com)','11999990001'),
('Bruno Souza','[bruno2@email.com](mailto:bruno2@email.com)','11999990002'),
('Carlos Lima','[carlos3@email.com](mailto:carlos3@email.com)','11999990003'),
('Daniela Costa','[daniela4@email.com](mailto:daniela4@email.com)','11999990004'),
('Eduardo Santos','[eduardo5@email.com](mailto:eduardo5@email.com)','11999990005'),
('Fernanda Rocha','[fernanda6@email.com](mailto:fernanda6@email.com)','11999990006'),
('Gabriel Alves','[gabriel7@email.com](mailto:gabriel7@email.com)','11999990007'),
('Helena Oliveira','[helena8@email.com](mailto:helena8@email.com)','11999990008'),
('Igor Martins','[igor9@email.com](mailto:igor9@email.com)','11999990009'),
('Juliana Ferreira','[juliana10@email.com](mailto:juliana10@email.com)','11999990010');

INSERT INTO produtos(nome,preco,estoque) VALUES
('Notebook',3500.00,15),
('Mouse Gamer',120.00,50),
('Teclado Mecânico',280.00,40),
('Monitor 24"',900.00,20),
('Headset',250.00,35),
('Webcam',180.00,30),
('SSD 480GB',300.00,25),
('Cadeira Gamer',1200.00,10),
('Impressora',650.00,12),
('Roteador',220.00,18);

INSERT INTO funcionarios(nome,cargo,comissao) VALUES
('João Pedro','Vendedor',500.00),
('Maria Clara','Vendedor',600.00),
('Lucas Henrique','Gerente',1500.00),
('Camila Gomes','Vendedor',450.00),
('Pedro Henrique','Caixa',300.00);

INSERT INTO pedidos(data_pedido,valor_total,id_cliente) VALUES
('2026-01-10',3500.00,1),
('2026-01-12',120.00,2),
('2026-01-15',900.00,3),
('2026-01-18',250.00,4),
('2026-01-20',1800.00,5);

INSERT INTO itens_pedido(id_pedido,id_produto,quantidade,subtotal) VALUES
(1,1,1,3500.00),
(2,2,1,120.00),
(3,4,1,900.00),
(4,5,1,250.00),
(5,8,1,1200.00);

SELECT * FROM clientes;

SELECT * FROM produtos
WHERE preco > 500;

SELECT COUNT(*) AS total_clientes
FROM clientes;

SELECT AVG(preco) AS media_precos
FROM produtos;

SELECT SUM(valor_total) AS faturamento_total
FROM pedidos;

SELECT *
FROM produtos
WHERE preco BETWEEN 200 AND 1000;

SELECT p.id_pedido,
c.nome,
p.valor_total
FROM pedidos p
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente;

SELECT pr.nome,
SUM(ip.quantidade) AS total_vendido
FROM itens_pedido ip
INNER JOIN produtos pr
ON ip.id_produto = pr.id_produto
GROUP BY pr.nome;

SELECT c.nome,
SUM(p.valor_total) AS total_gasto
FROM clientes c
INNER JOIN pedidos p
ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

SELECT AVG(valor_total) AS ticket_medio
FROM pedidos;
