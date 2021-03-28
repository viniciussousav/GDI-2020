-- POVOANDO A TABELA PESSOA
INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (86505080066, 'João Silva', 'M', DATE '1983-01-20');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (28788212033, 'José Souza', 'M', DATE '1990-03-28');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (30378752081, 'Maria Farias', 'F', DATE '1991-05-03');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (90459533070, 'Ana Leite', 'F', DATE '1988-07-25');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (12345678910, 'Joe Biden', 'M', DATE '1942-11-20');

-- POVOANDO A TABELA CODIGO_POSTAL
INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (45821630, 'Rua dos Coqueiros', 'Doutor Gusmão', 'Eunápolis', 'BA');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (29141860, 'Rua Novo Horizonte', 'Padre Gabriel', 'Cariacica', 'ES');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (63504130, 'Avenida Dário Rabelo', 'Cocobó', 'Iguatu', 'CE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (13900325, 'Rua Capitão Alceu Vieira', 'Centro', 'Amparo', 'SP');

-- POVOANDO A TABELA ENDERECO_PESSOA
INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (86505080066, 45821630, 7, 'APT 503');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (28788212033, 29141860, 3, 'APT 211');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (30378752081, 63504130, 30, 'APT 702');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (90459533070, 13900325, 22, 'APT 105');

-- POVOANDO A TABELA TELEFONE_PESSOA
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (86505080066, 071994021699);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (28788212033, 027986158007);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (30378752081, 088981407529);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (90459533070, 015991625781);

-- POVOANDO A TABELA CLIENTE
INSERT INTO
  Cliente (id)
VALUES
  (86505080066);
INSERT INTO
  Cliente (id)
VALUES
  (28788212033);
INSERT INTO
  Cliente (id)
VALUES
  (30378752081);
INSERT INTO
  Cliente (id)
VALUES
  (90459533070);

-- POVOANDO A TABELA EMAIL_CLIENTE
INSERT INTO
  Email_cliente (id_cliente, email)
VALUES
  (86505080066, 'joaosilva@hotmail.com');
INSERT INTO
  Email_cliente (id_cliente, email)
VALUES
  (28788212033, 'josesouza@outlook.com');
INSERT INTO
  Email_cliente (id_cliente, email)
VALUES
  (30378752081, 'mariafarias@gmail.com');
INSERT INTO
  Email_cliente (id_cliente, email)
VALUES
  (90459533070, 'analeite@live.com');

-- POVOANDO A TABELA ENDERECO_ENTREGA
INSERT INTO
  Endereco_entrega (id_pessoa, cep, numero, complemento)
VALUES
  (86505080066, 45821630, 7, 'APT 503');

INSERT INTO
  Endereco_entrega (id_pessoa, cep, numero, complemento)
VALUES
  (28788212033, 29141860, 3, 'APT 211');

INSERT INTO
  Endereco_entrega (id_pessoa, cep, numero, complemento)
VALUES
  (30378752081, 63504130, 30, 'APT 702');

INSERT INTO
  Endereco_entrega (id_pessoa, cep, numero, complemento)
VALUES
  (90459533070, 13900325, 22, 'APT 105');

UPDATE Endereco_entrega
SET complemento = 'APT 404'
WHERE numero = 3;

DELETE FROM Endereco_entrega WHERE complemento = 'APT 105';
