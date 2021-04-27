SELECT * FROM Codigo_postal;

SELECT * FROM Endereco_pessoa
WHERE complemento = 'APT 404';

SELECT * FROM Codigo_postal
WHERE cidade IN ('Cariacica', 'Iguatu');

SELECT * FROM Codigo_postal
WHERE estado LIKE 'S%' OR estado LIKE 's%';

SELECT * FROM Endereco_pessoa
WHERE complemento IS NULL;

SELECT * FROM Endereco_pessoa
WHERE numero IS NOT NULL;

SELECT * FROM (SELECT * FROM Codigo_postal
WHERE cidade IN ('Amparo', 'Eunápolis'));

SELECT cep FROM Codigo_postal WHERE cidade = ANY
(SELECT cidade FROM Endereco_pessoa WHERE numero IS NOT NULL);

SELECT complemento FROM Endereco_pessoa
WHERE numero BETWEEN 1 AND 100;
                 
SELECT * FROM Codigo_postal WHERE cidade != ALL
(SELECT DISTINCT id_pessoa FROM Endereco_pessoa WHERE complemento IS NOT NULL);

CREATE INDEX idx1 ON Fornecedor(razao_social);

SELECT * FROM Codigo_postal WHERE cidade IN
(SELECT cidade FROM Endereco_pessoa WHERE estado = 'CE');

SELECT * FROM Pessoa P INNER JOIN Cliente C ON P.cpf = C.id;
                 
SELECT Pessoa.cpf, Cliente.id
FROM Pessoa LEFT JOIN Cliente ON Pessoa.cpf = Cliente.id
ORDER BY Pessoa.nome ASC;
                 
SELECT MAX(preco_venda) FROM Produto;

SELECT MIN(preco_venda) FROM Produto;
                 
SELECT fabricante, MAX (preco_venda) AS preco FROM Produto GROUP BY fabricante ORDER BY fabricante ASC;

SELECT fabricante, MAX (preco_venda) AS preco FROM Produto GROUP BY fabricante HAVING MAX (preco_venda) > 500 ORDER BY fabricante ASC;

SELECT AVG(preco_venda) FROM Produto;

SELECT COUNT(preco_venda) FROM Produto P WHERE P.preco_venda > 200;
                 
SELECT MIN(preco_venda) FROM (SELECT preco_venda FROM Produto P WHERE P.preco_venda > 200);
                 
SELECT * FROM Produto WHERE preco_venda = ANY
(SELECT MAX (preco_venda) AS preco FROM Produto UNION SELECT MIN (preco_venda) AS preco FROM Produto);

CREATE VIEW Produto_Fornecedor AS
SELECT  Produto.id, Produto.nome, Produto.preco_compra, 
        Produto.preco_venda, (Produto.preco_venda - Produto.preco_compra) AS Lucro,
        Fornecedor.razao_social AS Fornecedor
FROM Produto INNER JOIN Fornecedor ON fabricante = Fornecedor.razao_social
ORDER BY Produto.id ASC;
                 
CREATE USER user_admin IDENTIFIED BY 12345678;
GRANT DROP ON PESSOA TO user_admin;
REVOKE DROP ON PESSOA FROM user_admin;
