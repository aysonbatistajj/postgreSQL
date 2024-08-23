CREATE TABLE clientes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255),
	data_nascimento DATE,
	cidade VARCHAR(100)
);

CREATE TABLE pedidos(
	pedidoId SERIAL PRIMARY KEY,
	dataPedido DATE,
	valorTotal decimal(10,2),
	clienteId INTEGER,
	FOREIGN KEY (clienteId) REFERENCES clientes(id)
	ON DELETE CASCADE
);

INSERT INTO clientes (nome, email, data_nascimento, cidade) VALUES
('Fulano da Silva', 'fulano.silva@example.com', '1998-03-18', 'Jacarezinho'),
('Ciclano Gil', 'ciclano.gil@example.com', '2000-05-18', 'Paris'),
('Beltrano Fonseca', 'beltrano.fonseca@example.com', '1990-05-15', 'Vila Amazonia');

INSERT INTO pedidos (dataPedido, valorTotal, clienteId) VALUES
('2024-08-01', 199.75, 1),
('2024-08-02', 99.75, 2),
('2024-08-03', 229.99, 3);

SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT nome, email FROM clientes;

UPDATE clientes 
SET email = 'beltrano.fonseca.novo@example.com'
WHERE id = 3;

UPDATE pedidos
SET valorTotal = 30.99
WHERE pedidoid = 8;

DELETE FROM pedidos WHERE pedidoid = 7;

SELECT * FROM clientes WHERE cidade = 'Jacarezinho';
SELECT * FROM pedidos WHERE valorTotal > 100;

SELECT * FROM clientes ORDER BY nome;
SELECT * FROM pedidos ORDER BY valorTotal DESC;

SELECT c.nome, p.valorTotal
FROM clientes c
INNER JOIN pedidos p ON c.id = p.clienteId;


SELECT c.nome, p.pedidoId, p.valorTotal
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.clienteId;
	
DROP TABLE clientes;
DROP TABLE pedidos;

TRUNCATE pedidos;
TRUNCATE clientes;