DROP TABLE Pessoa;
DROP TABLE Codigo_postal;
DROP TABLE Endereco_pessoa;
DROP TABLE Telefone_pessoa;
DROP TABLE Cliente;
DROP TABLE Email_cliente;
DROP TABLE Endereco_entrega;
DROP TABLE Produto;
DROP TABLE Pedido;
DROP TABLE Funcionario;
DROP TABLE Dependente;
DROP TABLE Setor;
DROP TABLE Operador;
DROP TABLE Gerente;
DROP TABLE Fornecedor;
DROP TABLE Endereco_fornecedor;
DROP TABLE Email_fornecedor;
DROP TABLE Solicita;
DROP TABLE Registra;


CREATE TABLE Pessoa (
    cpf VARCHAR2(14),
    nome VARCHAR(30) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nascimento DATE NOT NULL,

    CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE Codigo_postal (
    cep NUMBER,
    rua VARCHAR2(50),
    bairro VARCHAR2(20),
    cidade VARCHAR2(20),
    estado VARCHAR2(20),

    CONSTRAINT codigo_postal_pk PRIMARY KEY (cep)
);

CREATE TABLE Endereco_pessoa (
    id_pessoa VARCHAR2(14),
    cep NUMBER,
    numero NUMBER,
    complemento VARCHAR2(50),

    CONSTRAINT endereco_pk PRIMARY KEY (id_pessoa),
    CONSTRAINT endereco_fk FOREIGN KEY (id_pessoa) REFERENCES Pessoa(cpf),
    CONSTRAINT endereco_cep_fk FOREIGN KEY (cep) REFERENCES Codigo_postal(cep)
);

CREATE TABLE Telefone_pessoa (
    id_pessoa VARCHAR2(14),
    telefone NUMBER,

    CONSTRAINT telefone_pessoa_pk PRIMARY KEY (id_pessoa, telefone),
    CONSTRAINT telefone_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES Pessoa(cpf)
);

CREATE TABLE Cliente (
    id VARCHAR2(14),

    CONSTRAINT cliente_pk PRIMARY KEY (id),
    CONSTRAINT cliente_fk FOREIGN KEY (id) REFERENCES Pessoa(cpf)
);

CREATE TABLE Email_cliente (
    id_cliente VARCHAR2(14),
    email VARCHAR2(50),

    CONSTRAINT email_cliente_pk PRIMARY KEY (id_cliente, email),
    CONSTRAINT email_cliente_fk FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Endereco_entrega (
    id_pessoa VARCHAR2(14),
    cep NUMBER,
    numero NUMBER,
    complemento VARCHAR2(50),

    CONSTRAINT endereco_entrega_pk PRIMARY KEY (id_pessoa),
    CONSTRAINT endereco_entrega_pessoa_fk FOREIGN KEY (id_pessoa) REFERENCES Pessoa(cpf),
    CONSTRAINT endereco_entrega_cep_fk FOREIGN KEY (cep) REFERENCES Codigo_postal(cep)
);

CREATE TABLE Produto (
    id NUMBER,
    nome VARCHAR2(50),
    preco_compra NUMBER,
    preço_venda NUMBER,
    estoque NUMBER,
    fabricante VARCHAR2(50),

    CONSTRAINT produto_pk PRIMARY KEY (id) 
);

CREATE TABLE Pedido (
    id NUMBER, 
    id_cliente VARCHAR2(14),
    cod_produto NUMBER,
    data_pedido DATE,
    valor_total NUMBER,
    meio_pagamento VARCHAR(50) CHECK (meio_pagamento in ('Cartão de crédito', 'Boleto', 'Cartão de Débito')),

    CONSTRAINT pedido_pk PRIMARY KEY (id, cod_produto),
    CONSTRAINT pedido_cliente_fk FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    CONSTRAINT pedido_produto_fk FOREIGN KEY (cod_produto) REFERENCES Produto(id)
);

CREATE TABLE Funcionario (
    id VARCHAR2(14),
    salario NUMBER, 
    data_admissao DATE,
    ctps VARCHAR2(14),

    CONSTRAINT funcionario_pk PRIMARY KEY (id),
    CONSTRAINT funcionario_fk FOREIGN KEY (id) REFERENCES Pessoa(cpf)
);

CREATE TABLE Dependente (
    id NUMBER, 
    id_funcionario VARCHAR2(14),
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nascimento DATE,

    CONSTRAINT dependente_pk PRIMARY KEY (id, id_funcionario),
    CONSTRAINT dependente_func_fk FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id)
);

CREATE TABLE Setor (
    categoria VARCHAR2(20),

    CONSTRAINT setor_pk PRIMARY KEY (categoria)
);

CREATE TABLE Operador (
    id VARCHAR2(14),
    categoria_setor VARCHAR2(20),
    turno VARCHAR2(14) CHECK (turno IN ('Dia', 'Noite')), 

    CONSTRAINT operador_pk PRIMARY KEY (id),
    CONSTRAINT operador_cpf_fk FOREIGN KEY (id) REFERENCES Funcionario(id),
    CONSTRAINT operador_categoria_fk FOREIGN KEY (categoria_setor) REFERENCES Setor(categoria)
);

CREATE TABLE Gerente (
    id VARCHAR2(14),
    categoria_setor VARCHAR2(20),
    diploma VARCHAR2(20) NOT NULL,

    CONSTRAINT gerente_pk PRIMARY KEY (id),
    CONSTRAINT gerente_cpf_fk FOREIGN KEY (id) REFERENCES Funcionario(id),
    CONSTRAINT gerente_categoria_fk FOREIGN KEY (categoria_setor) REFERENCES Setor(categoria)
);

ALTER TABLE Setor ADD (
    id_gerente VARCHAR2(14),

    CONSTRAINT setor_fk FOREIGN KEY (id_gerente) REFERENCES Gerente(id)
);

CREATE TABLE Fornecedor (
    cnpj VARCHAR2(14),
    razao_social VARCHAR(50),
    inscricao_estadual VARCHAR2(14),
    telefone NUMBER,

    CONSTRAINT fornecedor_pk PRIMARY KEY (cnpj)
);

CREATE TABLE Endereco_fornecedor (
    id_fornecedor VARCHAR2(14),
    numero NUMBER,
    complemento VARCHAR2(50),
    cep NUMBER NOT NULL,

    CONSTRAINT endereco_fornecedor_pk PRIMARY KEY (id_fornecedor),
    CONSTRAINT endereco_fornecedor_cnpj_fk FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(cnpj),
    CONSTRAINT endereco_fornecedor_cep_fk FOREIGN KEY (cep) REFERENCES Codigo_postal(cep)
);

CREATE TABLE Email_fornecedor (
    id_fornecedor VARCHAR2(14),
    email VARCHAR2(50),

    CONSTRAINT email_fornecedor_pk PRIMARY KEY (id_fornecedor, email),
    CONSTRAINT email_fornecedor_fk FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(cnpj)
);

CREATE TABLE Solicita (
    cod_produto NUMBER,
    setor_categoria VARCHAR2(20),
    cnpj_fornecedor VARCHAR2(14),
    data_solicitacao DATE,

    CONSTRAINT solicita_pk PRIMARY KEY (data_solicitacao, cod_produto, cnpj_fornecedor),
    CONSTRAINT cod_produto_fk FOREIGN KEY (cod_produto) REFERENCES Produto(id),
    CONSTRAINT cnpj_fornecedor FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj) 
);

CREATE TABLE Registra (
    cpf_funcionario VARCHAR2(14), 
    codigo_produto NUMBER, 
    categoria_setor VARCHAR2(20),
    data_registro DATE,

    CONSTRAINT registra_pk PRIMARY KEY (data_registro, cpf_funcionario, codigo_produto),
    CONSTRAINT registra_funcionario_fk  FOREIGN KEY (cpf_funcionario) REFERENCES Funcionario(id),
    CONSTRAINT registra_produto_fk  FOREIGN KEY (codigo_produto) REFERENCES Produto(id),
    CONSTRAINT registra_setor_fk  FOREIGN KEY (categoria_setor) REFERENCES Setor(categoria)
);