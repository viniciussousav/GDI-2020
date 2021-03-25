SELECT * FROM Endereco;

SELECT * FROM Endereco
WHERE complemento = 'Apartamento';

SELECT * FROM Endereco
WHERE cidade IN ('Caruaru', 'Jaboatão');

SELECT * FROM Endereco
WHERE ESTADO LIKE 'P%' OR ESTADO LIKE 'p%';

SELECT * FROM Endereco
WHERE complemento IS NULL;

SELECT * FROM Endereco
WHERE numero IS NOT NULL;

SELECT * FROM (SELECT * FROM Endereco
WHERE cidade IN ('Várzea', 'Recife'));

SELECT * FROM Endereco WHERE cidade = ANY
(SELECT cidade FROM Endereco WHERE numero IS NOT NULL)

SELECT rua,cidade FROM Endereco
WHERE numero BETWEEN 50 AND 100;
                 
SELECT * FROM (SELECT * FROM Endereco
WHERE cidade IN ('Várzea', 'Recife'));
                 
SELECT * FROM Endereco
WHERE cidade = ANY
(SELECT cidade FROM Endereco WHERE numero IS NOT NULL);
                 
SELECT * FROM Endereco
WHERE cidade != ALL
(SELECT DISTINCT cidade FROM Endereco WHERE numero IS NOT NULL);
                 
SELECT * FROM Pessoa P INNER JOIN Endereco E ON P.id_endereco = E.id_endereco;
                 
SELECT Pessoa.nome, Endereco.id_endereco
FROM Pessoa LEFT JOIN Endereco ON Endereco.id_endereco = Pessoa.id_endereco
ORDER BY Pessoa.nome ASC;
                 
SELECT MAX(preco_venda) FROM produto;

SELECT MIN(preco_venda) FROM produto;
                 
SELECT fabricante, MAX (preco_venda) AS preco FROM Produto GROUP BY fabricante ORDER BY fabricante ASC;

SELECT fabricante, MAX (preco_venda) AS preco FROM Produto GROUP BY fabricante HAVING MAX (preco_venda) > 500 ORDER BY fabricante ASC;

SELECT AVG(preco_venda) FROM produto;

SELECT COUNT(preco_venda) FROM produto P WHERE P.preco_de_venda > 200;
                 
SELECT MIN(preco_venda) FROM (SELECT preco_venda FROM produto P WHERE P.preco_venda > 200);
                 
SELECT * FROM Produto WHERE preco_venda = ANY
(SELECT MAX (preco_venda) AS preco FROM Produto UNION SELECT MIN (preco_venda) AS preco FROM Produto);

CREATE VIEW Produto_Fornecedor AS
SELECT  Produto.id, Produto.nome, Produto.preco_compra, 
        Produto.preco_venda, (Produto.preco_venda - Produto.preco_compra) AS Lucro,
        Fornecedor.razao_social AS Fornecedor
FROM Produto INNER JOIN Fornecedor ON fabricante = nome_fantasia
ORDER BY Produto.id ASC;
                 
CREATE USER user_admin IDENTIFIED BY 12345678;
GRANT DROP ON PESSOA TO user_admin;
REVOKE DROP ON PESSOA FROM user_admin;
