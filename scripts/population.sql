-- POVOANDO A TABELA PESSOA
INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (50819283053, 'Flávio Augusto', 'M', DATE '1972-02-07');

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

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (32145897526, 'Débora Macedo', 'F', DATE '1978-01-20');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (98742658412, 'Carlos Augusto', 'M', DATE '1998-05-22');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (48721568497, 'Ilton Chagas', 'M', DATE '1968-07-02');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (74865132587, 'Jair Silva', 'M', DATE '1962-01-24');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (98745632158, 'Luis Bolsonaro', 'M', DATE '1971-04-20');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (78765124864, 'Silvio Santos', 'M', DATE '1991-05-25');

INSERT INTO
  Pessoa (cpf, nome, sexo, data_nascimento)
VALUES
  (88456973254, 'Patricia Duarte', 'F', DATE '1978-07-12');


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

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (54872069, 'Rua Alibaba', 'Aliexpress', 'Ecommerce', 'BA');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (85475021, 'Rua Uzumaki', 'Aldeia da Folha', 'Konoha', 'MG');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (78452069, 'Avenida Saitama', 'Caxangá', 'São Paulo', 'SC');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (57486025, 'Rua Dr José', 'Recife Antigo', 'Recife', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (14582658, 'Rua Padre Fábio', 'Barro', 'Recife', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (98752658, 'Rua Veriador Jarbas', 'Macaxeira', 'Recife', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (12536589, 'Rua Governador Pedro', 'Ibiribeira', 'Recife', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (45874256, 'Rua Dra Fátima', 'Peixinhos', 'Olinda', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (32569874, 'Rua Santo Antonio', 'Janga', 'Olinda', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (12564698, 'Rua Fernando Sales', 'Maranguape', 'Olinda', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (12547856, 'Rua Pedro Cabral Levi', 'Rio Doce', 'Olinda', 'PE');

INSERT INTO
  Codigo_postal (cep, rua, bairro, cidade, estado)
VALUES
  (31256987, 'Rua Dr Marcio', 'Mangueira', 'Recife', 'PE');


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

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (12345678910, 14582658, 202, 'APT 15');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (32145897526, 98752658, 221, 'APT 405');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (98742658412, 12536589, 322, 'APT 215');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (48721568497, 45874256, 122, 'APT 355');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (74865132587, 32569874, 41, 'APT 123');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (98745632158, 12564698, 85, 'APT 165');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (78765124864, 12547856, 95, 'APT 89');

INSERT INTO
  Endereco_pessoa (id_pessoa, cep, numero, complemento)
VALUES
  (88456973254, 31256987, 32, 'APT 10');


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
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (32145897526, 015965425781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (98742658412, 015991123781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (48721568497, 065491625781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (74865132587, 015923425781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (98745632158, 015991112781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (78765124864, 0158765625781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (88456973254, 015991456781);
INSERT INTO
  Telefone_pessoa (id_pessoa, telefone)
VALUES
  (12345678910, 015991345781);


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


-- POVOANDO A TABELA PRODUTO
INSERT INTO
  Produto (id, nome, preco_compra, preco_venda, estoque, fabricante)
VALUES
  (15494317833, 'Notebook CCIn', 3040, 4099, 214, 'Casa Central de Informatica');

INSERT INTO
  Produto (id, nome, preco_compra, preco_venda, estoque, fabricante)
VALUES
  (31487893249, 'Pen-drive', 52.20, 73.99, 68, 'CC Mídias');

INSERT INTO
  Produto (id, nome, preco_compra, preco_venda, estoque, fabricante)
VALUES
  (61876824893, 'Ventilador', 63, 85.99, 523, 'Só Venta LTDA');

INSERT INTO
  Produto (id, nome, preco_compra, preco_venda, estoque, fabricante)
VALUES
  (81561349816, 'Relogio', 80.90, 105.99, 121, 'Hora Certa Distribuidora');


-- POVOANDO A TABELA PEDIDO
INSERT INTO
  Pedido (id, id_cliente, cod_produto, data_pedido, valor_total, meio_pagamento)
VALUES
  (98715469873, 86505080066, 15494317833, DATE '2020-03-03', 4099, 'Cartão de crédito');

INSERT INTO
  Pedido (id, id_cliente, cod_produto, data_pedido, valor_total, meio_pagamento)
VALUES
  (78913216794, 28788212033, 31487893249, DATE '2019-04-05', 63.99, 'Boleto');

INSERT INTO
  Pedido (id, id_cliente, cod_produto, data_pedido, valor_total, meio_pagamento)
VALUES
  (24164167983, 30378752081, 61876824893, DATE '2018-08-06', 85.99, 'Boleto');

INSERT INTO
  Pedido (id, id_cliente, cod_produto, data_pedido, valor_total, meio_pagamento)
VALUES
  (12496873125, 90459533070, 81561349816, DATE '2018-08-06', 105.99, 'Cartão de Débito');


-- POVOANDO A TABELA FUNCIONARIO
INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (12345678910, 3200, DATE '2010-03-03', 12354868);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (32145897526, 3200, DATE '2015-04-05', 89456325);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (98742658412, 3200, DATE '2012-08-04', 25654795);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (48721568497, 3200, DATE '2018-07-01', 14868792);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (74865132587, 4300, DATE '2010-03-03', 87954568);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (98745632158, 4300, DATE '2011-04-05', 16874398);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (78765124864, 4300, DATE '2008-08-04', 33321596);

INSERT INTO
  Funcionario (id, salario, data_admissao,ctps)
VALUES
  (88456973254, 4300, DATE '2006-07-01', 16674563);


-- POVOANDO A TABELA DEPENDENTE
INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (110, 12345678910, 32417864, 'Enzo Biden', 'M', DATE '2018-08-06');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (111, 32145897526, 78585412, 'Valentina Macedo', 'F', DATE '2018-07-03');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (112, 98742658412, 85648725, 'Elizabete Augusto', 'F', DATE '2016-01-02');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (113, 48721568497, 98462964, 'Miguel Chagas', 'M', DATE '2020-03-11');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (114, 74865132587, 34578964, 'José Silva', 'M', DATE '2012-12-12');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (115, 98745632158, 94562964, 'Flavio Bolsonaro', 'M', DATE '2010-10-10');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (116, 78765124864, 76548964, 'Cristina Santos', 'F', DATE '2011-11-11');

INSERT INTO
  Dependente (id, id_funcionario, cpf, nome, sexo, data_nascimento)
VALUES
  (117, 88456973254, 34578964, 'Raquel Chagas', 'F', DATE '2021-01-01');


-- POVOANDO A TABELA SETOR
INSERT INTO
  Setor (categoria)
VALUES
  ('Eletroportateis');
INSERT INTO
  Setor (categoria)
VALUES
  ('Informatica');
INSERT INTO
  Setor (categoria)
VALUES
  ('Acessórios');
INSERT INTO
  Setor (categoria)
VALUES
  ('Armazenamentos');


-- POVOANDO A TABELA OPERADOR
INSERT INTO
  Operador (id, categoria_setor, turno)
VALUES
  (12345678910, 'Eletroportateis', 'Dia');

INSERT INTO
  Operador (id, categoria_setor, turno)
VALUES
  (32145897526, 'Informatica', 'Dia');

INSERT INTO
  Operador (id, categoria_setor, turno)
VALUES
  (98742658412, 'Acessórios', 'Noite');

INSERT INTO
  Operador (id, categoria_setor, turno)
VALUES
  (48721568497, 'Armazenamentos', 'Noite');


-- POVOANDO A TABELA GERENTE
INSERT INTO
  Gerente (id, categoria_setor, diploma)
VALUES
  (74865132587, 'Eletroportateis', 'Contabilidade');

INSERT INTO
  Gerente (id, categoria_setor, diploma)
VALUES
  (98745632158, 'Informatica', 'Administração');

INSERT INTO
  Gerente (id, categoria_setor, diploma)
VALUES
  (78765124864, 'Acessórios', 'Designe');

INSERT INTO
  Gerente (id, categoria_setor, diploma)
VALUES
  (88456973254, 'Armazenamentos', 'Marketing');


-- POVOANDO A TABELA FORNECEDOR
INSERT INTO
  Fornecedor (cnpj, razao_social, inscricao_estadual, telefone)
VALUES
  (74865865132587, 'Casa Central de Informatica', '7156489721-2', 986158615);

INSERT INTO
  Fornecedor (cnpj, razao_social, inscricao_estadual, telefone)
VALUES
  (98745478632158, 'CC Mídias', '8157899721-1', 998798725);

INSERT INTO
  Fornecedor (cnpj, razao_social, inscricao_estadual, telefone)
VALUES
  (74865985132587, 'Só Venta LTDA', '6547899778-2', 948653254);

INSERT INTO
  Fornecedor (cnpj, razao_social, inscricao_estadual, telefone)
VALUES
  (98745321632158, 'Hora Certa Distribuidora', '7847899715-0', 945682544);


-- POVOANDO A TABELA ENDEREÇO FORNECEDOR
INSERT INTO
  Endereco_fornecedor (id_fornecedor, numero, complemento, cep)
VALUES
  (74865865132587, 1205, 'Rua Santos Drumont, Boa Viagem', 54872069);

INSERT INTO
  Endereco_fornecedor (id_fornecedor, numero, complemento, cep)
VALUES
  (98745478632158, 8520, 'Avenida Nikola Tesla, Vazea', 85475021);

INSERT INTO
  Endereco_fornecedor (id_fornecedor, numero, complemento, cep)
VALUES
  (74865985132587, 102, 'Rua Michele Obama, Macaxeira', 78452069);

INSERT INTO
  Endereco_fornecedor (id_fornecedor, numero, complemento, cep)
VALUES
  (98745321632158, 654, 'Avenida São João, Caxangá', 57486025);


-- POVOANDO A TABELA EMAIL FORNECEDOR
INSERT INTO
  Email_fornecedor (id_fornecedor, email)
VALUES
  (74865865132587, 'ccinformatica@gmail.com');

INSERT INTO
  Email_fornecedor (id_fornecedor, email)
VALUES
  (98745478632158, 'ccmidias@outlook.com');

INSERT INTO
  Email_fornecedor (id_fornecedor, email)
VALUES
  (74865985132587, 'svltda@hotmail.com');

INSERT INTO
  Email_fornecedor (id_fornecedor, email)
VALUES
  (98745321632158, 'hcdistro@yahoo.com.br');


-- POVOANDO A TABELA SOLICITA
INSERT INTO
  Solicita (cod_produto, setor_categoria, cnpj_fornecedor, data_solicitacao)
VALUES
  (15494317833, 'Eletroportateis', 74865865132587, DATE '2020-08-06');

INSERT INTO
  Solicita (cod_produto, setor_categoria, cnpj_fornecedor, data_solicitacao)
VALUES
  (31487893249, 'Informatica', 98745478632158, DATE '2020-09-08');

INSERT INTO
  Solicita (cod_produto, setor_categoria, cnpj_fornecedor, data_solicitacao)
VALUES
  (61876824893, 'Acessórios', 74865985132587, DATE '2021-01-02');

INSERT INTO
  Solicita (cod_produto, setor_categoria, cnpj_fornecedor, data_solicitacao)
VALUES
  (81561349816, 'Armazenamentos', 98745321632158, DATE '2021-02-10');


-- POVOANDO A TABELA REGISTRA
INSERT INTO
  Registra (cpf_funcionario, codigo_produto, categoria_setor, data_registro)
VALUES
  (12345678910, 15494317833, 'Eletroportateis', DATE '2021-02-06');

INSERT INTO
  Registra (cpf_funcionario, codigo_produto, categoria_setor, data_registro)
VALUES
  (32145897526, 31487893249, 'Informatica', DATE '2021-01-08');

INSERT INTO
  Registra (cpf_funcionario, codigo_produto, categoria_setor, data_registro)
VALUES
  (98742658412, 61876824893, 'Acessórios', DATE '2021-01-02');

INSERT INTO
  Registra (cpf_funcionario, codigo_produto, categoria_setor, data_registro)
VALUES
  (48721568497, 81561349816, 'Armazenamentos', DATE '2021-03-10');
