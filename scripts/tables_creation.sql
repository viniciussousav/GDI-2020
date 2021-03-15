CREATE TABLE Pessoa (
    cpf VARCHAR2(14),
    nome VARCHAR(30) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ("M", "F")),
    data_nascimento DATE NOT NULL,
    id_endereco VARCHAR2(14), 

    CONSTRAINT pessoa_pk PRIMARY KEY(cpf),
    CONSTRAINT pessoa_fk FOREIGN KEY id_endereco REFERENCES Endereco_pessoa(id_pessoa)
)

CREATE TABLE Endereco_pessoa (
    id_pessoa VARCHAR2(14),
    rua VARCHAR2(50),
    numero NUMBER,
    complemento VARCHAR2(50),
    bairro VARCHAR2(20),
    cidade VARCHAR2(20),
    estado VARCHAR2(20),
    cep NUMBER NOT NULL,

    CONSTRAINT endereco_pk PRIMARY KEY id_pessoa,
    CONSTRAINT endereco_fk FOREIGN KEY id_pessoa REFERENCES Pessoa(cpf)
)

CREATE TABLE Telefone_pessoa (
    id_pessoa VARCHAR2(14),
    telefone_pessoa NUMBER,

    CONSTRAINT telefone_pessoa_pk PRIMARY KEY (id_pessoa, telefone_pessoa),
    CONSTRAINT telefone_pessoa_fk FOREIGN KEY id_pessoa REFERENCES Pessoa(cpf)
)

CREATE TABLE Cliente (
    id_cliente VARCHAR2(14),
    id_email NUMBER, 

    CONSTRAINT client_pk PRIMARY KEY id_cliente,
    CONSTRAINT cliente_cpf_fk FOREIGN KEY id_cliente REFERENCES Pessoa(cpf),
    CONSTRAINT id_email FOREIGN KEY id_email REFERENCES Email_cliente(id_email)
)

CREATE TABLE Email_cliente ( -- AINDA FALTA AJEITAR
    id_email NUMBER,
    id_cliente VARCHAR2(14),
    email VARCHAR2(50),

    CONSTRAINT email_cliente_pk PRIMARY KEY (id_cliente, email),
    CONSTRAINT email_cliente_fk FOREIGN KEY id_cliente REFERENCES Cliente(id_cliente)
)

CREATE TABLE Endereco_entrega (
    id_pessoa VARCHAR2(14),
    rua VARCHAR2(50),
    numero NUMBER,
    complemento VARCHAR2(50),
    bairro VARCHAR2(20),
    cidade VARCHAR2(20),
    estado VARCHAR2(20),
    cep NUMBER NOT NULL,

    CONSTRAINT endereco_pk PRIMARY KEY id_pessoa,
    CONSTRAINT endereco_fk FOREIGN KEY id_pessoa REFERENCES Pessoa(cpf) 
)


CREATE TABLE Produto (
    id NUMBER,
    nome VARCHAR2(50),
    preco_compra NUMBER,
    preço_venda NUMBER,
    estoque NUMBER,
    fabricante VARCHAR2(50)

    CONSTRAINT produto_pk PRIMARY KEY id 
)

CREATE TABLE Pedido (
    id NUMBER, 
    cliente_id VARCHAR2(14),
    cod_produto NUMBER,
    data_pedido DATE,
    valor_total NUMBER,
    meio_pagamento VARCHAR(50) CHECK (meio_pagamento in ("Cartão de crédito", "Boleto", "Cartão de Débito")) 

    CONSTRAINT pedido_pk PRIMARY KEY id,
    CONSTRAINT pedido_cliente_fk FOREIGN KEY cliente_id REFERENCES Cliente(id_cliente),
    CONSTRAINT pedido_produto_fk FOREIGN KEY cod_produto REFERENCES Produto(id)
)

CREATE TABLE Funcionario (
    id_funcionario VARCHAR2(14),
    salario NUMBER, 
    data_admissao DATE,
    ctps VARCHAR2(14)

    CONSTRAINT funcionario_pk PRIMARY KEY id_funcionario,
    CONSTRAINT funcionario_cpf_fk FOREIGN KEY id_funcionario REFERENCES Pessoa(cpf)
)

CREATE TABLE Dependente (
    id NUMBER, 
    id_funcionario VARCHAR2(14),
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    sexo CHAR(1) CHECK (sexo IN ("M", "F")),
    data_nascimento DATE,

    CONSTRAINT dependente_pk PRIMARY KEY (id, id_funcionario),
    CONSTRAINT dependente_func_fk FOREIGN KEY id_funcionario REFERENCES Funcionario(id_funcionario)
)

CREATE TABLE Setor (
    setor VARCHAR2(20),

    CONSTRAINT setor_pk PRIMARY KEY setor
)

CREATE TABLE Operador (
    operador_cpf VARCHAR2(14),
    categoria_setor VARCHAR2(20),
    turno VARCHAR2(14) CHECK (turno IN ("Dia", "Noite")) -- TALVEZ DEVESSEMOS TROCAR PARA ESCALA (Ex. 12/36)

    CONSTRAINT operador_pk PRIMARY KEY operador_cpf,
    CONSTRAINT operador_cpf_fk FOREIGN KEY operador_cpf REFERENCES Funcionario(id_funcionario),
    CONSTRAINT operador_categoria_fk FOREIGN KEY categoria_setor REFERENCES Setor(categoria)
)

CREATE TABLE Gerente (
    gerente_cpf VARCHAR2(14),
    categoria_setor VARCHAR2(20),
    diploma VARCHAR2(20) NOT NULL,

    CONSTRAINT gerente_pk PRIMARY KEY gerente_cpf,
    CONSTRAINT gerente_cpf_fk FOREIGN KEY gerente_cpf REFERENCES Funcionario(id_funcionario),
    CONSTRAINT gerente_categoria_fk FOREIGN KEY categoria_setor REFERENCES Setor(categoria)
)

CREATE TABLE Fornecedor (
    id VARCHAR2(14),
    razao_social VARCHAR(50),
    cpnj VARCHAR2(14),
    inscricao_estadual VARCHAR2(14),
    id_endereco VARCHAR2(14),

    CONSTRAINT fornecedor_pk PRIMARY KEY id,
    CONSTRAINT fornecedor_endereco_fk FOREIGN KEY id_endereco REFERENCES Endereco_fornecedor(id_fornecedor)
)

CREATE TABLE Endereco_fornecedor (
    id_fornecedor VARCHAR2(14),
    rua VARCHAR2(50),
    numero NUMBER,
    complemento VARCHAR2(50),
    bairro VARCHAR2(20),
    cidade VARCHAR2(20),
    estado VARCHAR2(20),
    cep NUMBER NOT NULL,

    CONSTRAINT endereco_fornecedor_pk PRIMARY KEY id_fornecedor,
    CONSTRAINT endereco_fornecedor_fk FOREIGN KEY id_fornecedor REFERENCES Fornecedor(id) 
)

CREATE TABLE Email_fornecedor ( -- AINDA FALTA AJEITAR
    id_email NUMBER,
    id_fornecedor VARCHAR2(14),
    email VARCHAR2(50),

    CONSTRAINT email_fornecedor_pk PRIMARY KEY (id_fornecedor, email),
    CONSTRAINT email_fornecedor_fk FOREIGN KEY id_forncedor REFERENCES Fornecedor(id)
)