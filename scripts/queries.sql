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
