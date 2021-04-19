DROP TYPE tp_Pessoa;
--DROP TYPE tp_Codigo_postal;
DROP TYPE tp_Endereco_pessoa;
DROP TYPE tp_Telefone_pessoa;
DROP TYPE tp_Cliente;
DROP TYPE tp_Email_cliente;
DROP TYPE tp_Endereco_entrega;
DROP TYPE varray_fones;
DROP TYPE tp_Produto;
DROP TYPE tp_Pedido;
DROP TYPE nt_lista_Pedido;
DROP TYPE tp_Funcionario;
DROP TYPE tp_Dependente;
DROP TYPE tp_Setor;
DROP TYPE tp_Operador;
DROP TYPE tp_Gerente;
DROP TYPE tp_Diploma;
DROP TYPE nt_lista_diploma;
DROP TYPE tp_Fornecedor;
DROP TYPE tp_Endereco_fornecedor;
DROP TYPE tp_Email_fornecedor;
DROP TYPE tp_Solicita;
DROP TYPE tp_Registra;

-- CRIAÇÃO DOS TIPOS

CREATE OR REPLACE TYPE tp_Telefone_pessoa AS OBJECT(
    id_pessoa VARCHAR2(11),
	telefone VARCHAR2(15)
);
/

CREATE OR REPLACE TYPE varray_Telefone AS VARRAY (5) OF tp_Telefone_pessoa;
/

CREATE OR REPLACE TYPE tp_Endereco_pessoa AS OBJECT(
	id_pessoa VARCHAR2(11),
	cep NUMBER,
	numero NUMBER,
    complemento VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_Pessoa AS OBJECT (
    cpf VARCHAR2(11),
    nome VARCHAR2(30) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nascimento DATE NOT NULL,
    endereco REF tp_Endereco_pessoa,
    telefones REF varray_Telefone,
MEMBER PROCEDURE mostrar (SELF tp_Pessoa)
)NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_Pessoa AS 
MEMBER PROCEDURE mostrar (SELF tp_Pessoa) IS

n INTEGER;
i INTEGER;
BEGIN
	--INFORMAÇÕES
	DBMS_OUTPUT.put_line(‘NOME: ’ || nome);
    DBMS_OUTPUT.put_line(‘CPF: ’ || cpf);
    DBMS_OUTPUT.put_line(‘SEXO: ’ || sexo);
    DBMS_OUTPUT.put_line(‘DATA DE NASCIMENTO: ’ || TO_CHAR(data_nasci));

    n:=telefones.COUNT;
    DBMS_OUTPUT.put_line(‘TELEFONES: ’);
        IF n > 0 THEN
			FOR i in 1..n LOOP
				DBMS_OUTPUT.put_line(i || telefones(i).telefone);
			END LOOP;
		ELSE
			DBMS_OUTPUT.put_line(‘Não há telefones registrados.’);
		END IF;

	--ENDERECO
    DBMS_OUTPUT.put_line(‘ID: ’ || Endereco_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line(‘CEP: ’ || Endereco_pesso.cep);
	DBMS_OUTPUT.put_line(‘NUMERO: ’ || Endereco_pesso.numero);
	DBMS_OUTPUT.put_line(‘COMPLEMENTO: ’ || Endereco_pesso.complemento);

    --TELEFONE
	DBMS_OUTPUT.put_line(‘ID: ’ || Telefone_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line(‘TELEFONE: ’ || Telefone_pessoa.telefone);
	END;
END;
/

CREATE OR REPLACE TYPE tp_Pedido AS OBJECT(
    id NUMBER, 
    id_cliente VARCHAR2(11),
    cod_produto NUMBER,
    data_pedido DATE,
    valor_total NUMBER,
    meio_pagamento VARCHAR(50) CHECK (meio_pagamento in ('Cartão de crédito', 'Boleto', 'Cartão de Débito'))
);
/

CREATE OR REPLACE TYPE nt_lista_Pedido AS TABLE OF tp_Pedido;
/

CREATE OR REPLACE TYPE tp_Cliente UNDER tp_Pessoa (
    id VARCHAR2(11),
	lista_pedidos nt_lista_Pedido
);
/

CREATE OR REPLACE TYPE tp_Email_cliente AS OBJECT(
    id_cliente VARCHAR2(11),
	email VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_Endereco_entrega AS OBJECT(
    id_pessoa VARCHAR2(11),
	cep NUMBER,
    numero NUMBER,
    complemento VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_Produto AS OBJECT(
    id NUMBER,
    nome VARCHAR2(50),
    preco_compra NUMBER,
    preco_venda NUMBER,
    estoque NUMBER,
    fabricante VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE nt_Produto AS TABLE OF tp_Produto;
/

CREATE OR REPLACE TYPE tp_Funcionario UNDER tp_Pessoa (
	salario NUMBER,
	data_admissao DATE,
    ctps VARCHAR2(8)

);
/

CREATE OR REPLACE TYPE tp_Dependente UNDER tp_Pessoa (
    cpf VARCHAR2(11),
    nome VARCHAR2(50),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    data_nascimento DATE
);
/

CREATE OR REPLACE TYPE tp_Setor AS OBJECT(
    categoria VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_Operador UNDER tp_Funcionario (
    categoria_setor VARCHAR2(20),
    turno VARCHAR2(14) CHECK (turno IN ('Dia', 'Noite'))
);
/

CREATE OR REPLACE TYPE tp_Diploma AS OBJECT(
	diploma VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE nt_lista_diploma AS TABLE OF tp_Diploma;
/

CREATE OR REPLACE TYPE tp_Gerente UNDER tp_Funcionario (
    categoria_setor VARCHAR2(20),
    diplomas nt_lista_diploma
);
/

CREATE OR REPLACE TYPE tp_Fornecedor AS OBJECT (
	cnpj VARCHAR2(14),
    razao_social VARCHAR(50),
    inscricao_estadual VARCHAR2(12),
    telefone NUMBER,
    produtos nt_Produto
);
/

CREATE OR REPLACE TYPE tp_Endereco_fornecedor AS OBJECT (
    id_fornecedor VARCHAR2(14),
    numero NUMBER,
    complemento VARCHAR2(50),
    cep NUMBER NOT NULL
);
/

CREATE OR REPLACE TYPE tp_Email_fornecedor AS OBJECT (
    id_fornecedor VARCHAR2(14),
    email VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_Solicita AS OBJECT (
    cod_produto NUMBER,
    setor_categoria VARCHAR2(20),
    cnpj_fornecedor VARCHAR2(14),
    data_solicitacao DATE
);
/

CREATE OR REPLACE TYPE tp_Registra AS OBJECT (
    cpf_funcionario VARCHAR2(11), 
    codigo_produto NUMBER, 
    categoria_setor VARCHAR2(20),
    data_registro DATE

);
/

-- CRIAÇÃO DAS TABELAS

CREATE TABLE tb_Enderecos_pessoa OF tp_Endereco_pessoa 
(id_pessoa PRIMARY KEY);
/

CREATE TABLE tb_Produtos OF tp_Produto 
(id PRIMARY KEY);
/

CREATE TABLE tb_Clientes OF tp_Cliente 
(cpf PRIMARY KEY) NESTED TABLE lista_pedidos STORE AS lista_pedido_st;
/

CREATE TABLE tb_Gerentes OF tp_Gerente
(cpf PRIMARY KEY) NESTED TABLE diplomas STORE AS diplomas_st;
/

CREATE TABLE tb_Operadores OF tp_Operador
(cpf PRIMARY KEY);
/

CREATE TABLE tb_Produto OF tp_Produto 
(cnpj PRIMARY KEY) NESTED TABLE produtos STORE AS produto_st ;
/

-- POVOAMENTO DAS TABELAS