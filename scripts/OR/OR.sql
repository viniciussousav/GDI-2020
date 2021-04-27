DROP TYPE tp_Pessoa;
DROP TYPE tp_Codigo_postal;
DROP TYPE tp_Endereco;
DROP TYPE tp_Telefone;
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

CREATE OR REPLACE TYPE tp_Telefone AS OBJECT( --OK
	telefone VARCHAR2(15)
);
/

CREATE OR REPLACE TYPE varray_Telefone AS VARRAY (5) OF tp_Telefone; --OK
/

--Remocao das restricoes nas criacoes de tipo
--varray nao eh referenciavel
CREATE OR REPLACE TYPE tp_Pessoa AS OBJECT ( --OK
    id_pessoa INTEGER,
    cpf VARCHAR2(11),
    nome VARCHAR2(30), 
    sexo CHAR(1),
    data_nascimento DATE,
    telefones varray_Telefone,
    MEMBER PROCEDURE mostrar,
		ORDER MEMBER FUNCTION ordenar_por_idade (p tp_Pessoa) RETURN NUMBER,
    CONSTRUCTOR FUNCTION tp_pessoa
        (f_id_pessoa NUMBER, f_cpf VARCHAR2, f_nome VARCHAR2, f_sexo VARCHAR2, f_data_nascimento DATE, f_telefone varray_telefone)
        RETURN SELF AS RESULT,
    FINAL MEMBER FUNCTION get_nome RETURN VARCHAR2
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_Endereco AS OBJECT( --OK
	cep NUMBER,
	numero NUMBER,
  complemento VARCHAR2(50)
);
/

ALTER TYPE tp_Pessoa ADD ATTRIBUTE (
  endereco REF tp_Endereco
);
/ 

CREATE OR REPLACE TYPE BODY tp_Pessoa AS --OK
MEMBER PROCEDURE mostrar IS
DECLARE
	n INTEGER;
	i INTEGER;
BEGIN
	--INFORMAÇÕES
  DBMS_OUTPUT.put_line('ID: ' || id_pessoa);
	DBMS_OUTPUT.put_line('NOME: ' || nome);
  DBMS_OUTPUT.put_line('CPF: ' || cpf);
  DBMS_OUTPUT.put_line('SEXO: ' || sexo);
  DBMS_OUTPUT.put_line('DATA DE NASCIMENTO: ' || TO_CHAR(data_nasci));

  n:=telefones.COUNT;
  DBMS_OUTPUT.put_line('TELEFONES: ');
  IF n > 0 THEN
		FOR i in 1..n LOOP
			DBMS_OUTPUT.put_line(i || telefones(i).telefone);
		END LOOP;
	ELSE
		DBMS_OUTPUT.put_line('Não há telefones registrados.');
	END IF;

	--ENDERECO
  DBMS_OUTPUT.put_line('ID: ' || Endereco_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line('CEP: ' || Endereco_pesso.cep);
	DBMS_OUTPUT.put_line('NUMERO: ' || Endereco_pesso.numero);
	DBMS_OUTPUT.put_line('COMPLEMENTO: ' || Endereco_pesso.complemento);

    --TELEFONE
	DBMS_OUTPUT.put_line('ID: ' || Telefone_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line('TELEFONE: ' || Telefone_pessoa.telefone);
	END;

	ORDER MEMBER FUNCTION ordenar_por_idade (p tp_Pessoa) RETURN NUMBER IS
	BEGIN
		IF SELF.data_nascimento <= p.data_nascimento THEN
			return (1);
		ELSE 
			return (-1);
		END IF;
	END;

  CONSTRUCTOR FUNCTION tp_pessoa
  (f_id_pessoa NUMBER, f_cpf VARCHAR2, f_nome VARCHAR2, f_sexo VARCHAR2, f_data_nascimento DATE, f_telefone varray_telefone)
  RETURN SELF AS RESULT IS
    BEGIN
        SELF.id_pessoa          := f_id_pessoa;
        SELF.cpf                := f_cpf;
        SELF.nome               := f_nome;
        SELF.sexo               := f_sexo;
        SELF.data_nascimento    := f_data_nascimento;
        SELF.telefone           := f_telefone;
    END;

  FINAL MEMBER FUNCTION get_nome RETURN VARCHAR2 IS
  BEGIN
    RETURN nome;
  END;
  
END;
/

CREATE OR REPLACE TYPE tp_Pedido AS OBJECT( --OK
    id NUMBER,
    data_pedido DATE,
    valor_total NUMBER,
    meio_pagamento VARCHAR(50) --CHECK (meio_pagamento in ('Cartão de crédito', 'Boleto', 'Cartão de Débito')) isso se faz na criacao de tabelas
);
/

CREATE OR REPLACE TYPE nt_lista_Pedido AS TABLE OF tp_Pedido;
/

CREATE OR REPLACE TYPE tp_Cliente UNDER tp_Pessoa (
  id VARCHAR2(11),
	lista_pedidos nt_lista_Pedido
);
/

ALTER TYPE tp_Pedido ADD ATTRIBUTE (cliente REF tp_Cliente) CASCADE;

CREATE OR REPLACE TYPE tp_Email_cliente AS OBJECT(
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
    fabricante VARCHAR2(50),
		MEMBER FUNCTION balanco (val NUMBER) RETURN NUMBER,
		MAP MEMBER FUNCTION comparar_valor_estoque RETURN NUMBER
);
/

ALTER TYPE tp_Pedido ADD ATTRIBUTE (cod_produto REF tp_Produto) CASCADE;

CREATE OR REPLACE TYPE BODY tp_Produto AS 
   MEMBER FUNCTION balanco return NUMBER IS
   DECLARE 
      resultado NUMBER
   BEGIN 
	 		resultado := (SELF.preco_venda * SELF.estoque) - (SELF.preco_compra * SELF.estoque);
      return resultado; 
   END balanco;
	
	MAP MEMBER FUNCTION comparar_valor_estoque RETURN NUMBER IS
	BEGIN
		return SELF.preco_venda * SELF.estoque;
	END;   
END; 
/ 

CREATE OR REPLACE TYPE nt_Produto AS TABLE OF tp_Produto;
/

CREATE OR REPLACE TYPE tp_Funcionario UNDER tp_Pessoa (
	salario NUMBER,
	data_admissao DATE,
  ctps VARCHAR2(8)
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_Funcionario AS --OK
OVERRIDE MEMBER PROCEDURE mostrar IS

BEGIN
	--INFORMAÇÕES PESSOAIS
	DBMS_OUTPUT.put_line('NOME: ' || nome);
  DBMS_OUTPUT.put_line('CPF: ' || cpf);
  DBMS_OUTPUT.put_line('SEXO: ' || sexo);
  DBMS_OUTPUT.put_line('DATA DE NASCIMENTO: ' || TO_CHAR(data_nasci));


	--ENDERECO
  DBMS_OUTPUT.put_line('ID: ' || Endereco_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line('CEP: ' || Endereco_pesso.cep);
	DBMS_OUTPUT.put_line('NUMERO: ' || Endereco_pesso.numero);
	DBMS_OUTPUT.put_line('COMPLEMENTO: ' || Endereco_pesso.complemento);

    --TELEFONE
	DBMS_OUTPUT.put_line('ID: ' || Telefone_pessoa.id_pessoa);
	DBMS_OUTPUT.put_line('TELEFONE: ' || Telefone_pessoa.telefone);

	--INFORMACOES TRABALHISTAS
	DBMS_OUTPUT.put_line('SALARIO: ' || salario);
	DBMS_OUTPUT.put_line('DATA DE ADMISSAO: ' || data_admissao);
	DBMS_OUTPUT.put_line('CTPS: ' || ctps);
	END;
END;
/

CREATE OR REPLACE TYPE tp_Dependente UNDER tp_Pessoa (
    titular REF tp_funcionario
);
/

CREATE OR REPLACE TYPE tp_Setor AS OBJECT(
    categoria VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_Operador UNDER tp_Funcionario (
    categoria_setor VARCHAR2(20),
    turno VARCHAR2(14) 
    --CHECK(sexo IN ('M', 'F'));
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
    cep NUMBER
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

-- DAQUI PRA CIMA, TUDO OK!!!

-- CRIAÇÃO DAS TABELAS

CREATE TABLE tb_Enderecos_pessoa OF tp_Endereco 
(cep PRIMARY KEY);
/

CREATE TABLE tb_Produtos OF tp_Produto 
(id PRIMARY KEY);
/

CREATE TABLE tb_Clientes OF tp_Cliente 
(cpf PRIMARY KEY) NESTED TABLE lista_pedidos STORE AS lista_pedido_st;
-- CHECK(sexo IN ('M', 'F')); -- DÁ ERRO (INVALID STATEMENT)
/

CREATE TABLE tb_Gerentes OF tp_Gerente
(cpf PRIMARY KEY) NESTED TABLE diplomas STORE AS diplomas_st;
-- CHECK(sexo IN ('M', 'F')); -- DÁ ERRO (INVALID STATEMENT)
/

CREATE TABLE tb_Operadores OF tp_Operador
(cpf PRIMARY KEY);
-- CHECK(sexo IN ('M', 'F')); -- DÁ ERRO (INVALID STATEMENT)
/

-- NESTED TABLE produtos STORE AS produto_st
CREATE TABLE tb_Produto OF tp_Produto 
(id PRIMARY KEY) nt_p;
/
	       
CREATE TABLE tb_Endereco_pessoa OF tp_Endereco (
    cep PRIMARY KEY
);
/

-- ATÉ AQUI, NENHUM ERRO DE COMPILAÇÃO, MAS FALTAM CONSERTAR AS TABELAS QUE SÃO CRIADAS (OU CHECAR SE PODEM SER ASSIM)

-- TROCAR A PK DE PESSOA PARA SER ID_PESSOA, E CPF PASSAR A SER APENAS UM ATRIBUTO
CREATE TABLE tb_Funcionario OF tp_Funcionario (
    id_pessoa                   PRIMARY KEY,
    endereco                    WITH ROWID REFERENCES tb_Endereco_pessoa
);
/

-- POVOAMENTO DAS TABELAS

INSERT INTO tb_Clientes VALUES 
    86505080066, 
    'João Silva', 
    'M', 
    DATE '1983-01-20', 
    tp_Endereco(86505080066, 45821630, 7, 'APT 503'),
    varray_Telefone(071994021699)
);

INSERT INTO tb_Clientes VALUES 
    28788212033, 
    'José Souza', 
    'M', 
    DATE '1990-03-28',
    tp_Endereco(28788212033, 29141860, 3, 'APT 211'),
    varray_Telefone(027986158007)
);

-- INSERT INTO tb_Clientes VALUES 
--     30378752081, 
--     'Maria Farias', 
--     'F', 
--     DATE '1991-05-03',
--     tp_Endereco(30378752081, 63504130, 30, 'APT 702'),
--     varray_Telefone(088981407529)
-- );

-- INSERT INTO tb_Clientes VALUES 
--     90459533070, 
--     'Ana Leite', 
--     'F', 
--     DATE '1988-07-25',
--     tp_Endereco(90459533070, 13900325, 22, 'APT 105'),
--     varray_Telefone(015991625781)
-- );
	       
CREATE SEQUENCE ENDERECO_ID_SEQ;
CREATE SEQUENCE FUNCIONARIO_ID_SEQ;

INSERT INTO tb_Endereco_pessoa
VALUES  (tp_endereco (ENDERECO_ID_SEQ.NEXTVAL, 50740370 , '78', 'Casa'));
			     
INSERT INTO tb_Endereco_pessoa
VALUES  (tp_endereco (ENDERECO_ID_SEQ.NEXTVAL, 78555456 , '555', 'Apartamento'));
			     
INSERT INTO tb_Endereco_pessoa
VALUES  (tp_endereco (ENDERECO_ID_SEQ.NEXTVAL, 12355578 , '4564', 'Sitio'));
			     
INSERT INTO tb_Endereco_pessoa
VALUES  (tp_endereco (ENDERECO_ID_SEQ.NEXTVAL, 56425244 , '85', 'Fazenda'));
			     
INSERT INTO tb_funcionario
VALUES  (tp_funcionario (FUNCIONARIO_ID_SEQ.NEXTVAL, '111.222.333-88', 'Matheus', 'Masculino', TO_DATE ('11/11/1997', 'DD/MM/YYYY'),
        (SELECT REF (E) FROM tb_Endereco_pessoa E WHERE E.id_endereco = 1),
        varray_telefone (tp_telefone ('9 0193-0039'), tp_telefone ('9 4559-6601'))));

INSERT INTO tb_funcionario
VALUES  (tp_funcionario (FUNCIONARIO_ID_SEQ.NEXTVAL, '777.888.999-00', 'Lucas', 'Masculino', TO_DATE ('29/07/1995', 'DD/MM/YYYY'),
        (SELECT REF (E) FROM tb_Endereco_pessoa E WHERE E.id_endereco = 2),
        varray_telefone (tp_telefone ('9 3455-8903'), tp_telefone ('9 5290-5084'))));

INSERT INTO tb_funcionario
VALUES  (tp_funcionario (FUNCIONARIO_ID_SEQ.NEXTVAL, '333.666.222-77', 'Pedro', 'Masculino', TO_DATE ('16/10/1995', 'DD/MM/YYYY'),
        (SELECT REF (E) FROM tb_Endereco_pessoa E WHERE E.id_endereco = 1),
        varray_telefone (tp_telefone ('9 2110-3341'), tp_telefone ('9 2390-5734'))));	 
								   
-- SELECTS
	       
SELECT F.id_pessoa, F.nome, T.telefone FROM tb_funcionario F, TABLE(F.varray_telefone) T;
	       
SELECT  F.id_pessoa, F.nome, F.cpf, F.sexo, F.data_nascimento,
        DEREF(F.endereco).numero AS NUMERO, DEREF(F.endereco).cep AS CEP, DEREF(F.endereco).complemento AS COMPLEMENTO,
        FROM tb_fruncionario F
        ORDER BY F.id_pessoa ASC;

-- FALTA TESTAR SE FUNCIONA ESSE VALUE
-- SELECT  p.preco_compra FROM tb_produto p ORDER BY VALUE(p);
