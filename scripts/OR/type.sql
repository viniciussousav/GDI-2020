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
    cpf VARCHAR2(11),
    nome VARCHAR2(30), 
    sexo CHAR(1),
    data_nascimento DATE,
    telefones varray_Telefone,
    MEMBER PROCEDURE mostrar,
		ORDER MEMBER FUNCTION ordenar_por_idade (p tp_Pessoa) RETURN NUMBER,
    CONSTRUCTOR FUNCTION tp_pessoa
        (f_cpf VARCHAR2, f_nome VARCHAR2, f_sexo VARCHAR2, f_data_nascimento DATE, f_telefone varray_telefone)
        RETURN SELF AS RESULT,
    FINAL MEMBER FUNCTION get_nome RETURN VARCHAR2
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_Endereco AS OBJECT( --OK
	cep NUMBER,
  numero NUMBER,
  complemento VARCHAR2(50),
  rua VARCHAR2(50),
  bairro VARCHAR2(50),
  cidade VARCHAR2(50),
  estado VARCHAR2(20)
) NOT FINAL;
/

ALTER TYPE tp_Pessoa ADD ATTRIBUTE (
  endereco tp_Endereco
);
/

CREATE OR REPLACE TYPE BODY tp_Pessoa AS --OK
MEMBER PROCEDURE mostrar IS
DECLARE
	n INTEGER;
	i INTEGER;
BEGIN
	--INFORMAÇÕES
	DBMS_OUTPUT.put_line('NOME: ' || nome);
  DBMS_OUTPUT.put_line('CPF: ' || cpf);
  DBMS_OUTPUT.put_line('SEXO: ' || sexo);
  DBMS_OUTPUT.put_line('DATA DE NASCIMENTO: ' || TO_CHAR(data_nascimento));

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
	DBMS_OUTPUT.put_line('CEP: ' || endereco.cep);
	DBMS_OUTPUT.put_line('NUMERO: ' || endereco.numero);
	DBMS_OUTPUT.put_line('COMPLEMENTO: ' || endereco.complemento);

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
  (f_cpf VARCHAR2, f_nome VARCHAR2, f_sexo VARCHAR2, f_data_nascimento DATE, f_telefone varray_telefone)
  RETURN SELF AS RESULT IS
    BEGIN
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



CREATE OR REPLACE TYPE tp_Cliente UNDER tp_Pessoa (
  email VARCHAR2(50)
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

CREATE OR REPLACE TYPE tp_Pedido AS OBJECT( --OK
    pedido INTEGER,
    data_pedido DATE,
    valor_total NUMBER,
    meio_pagamento VARCHAR(50), 
    cliente REF tp_Cliente,
    produto REF tp_Produto
);
/


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


CREATE OR REPLACE TYPE tp_Dependente UNDER tp_Pessoa (
    parentesco VARCHAR2(50)
);
/

CREATE TYPE varray_dependentes AS VARRAY (5) OF tp_Dependente;
/

CREATE OR REPLACE TYPE tp_Setor AS OBJECT(
    categoria VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE tp_Funcionario UNDER tp_Pessoa(
	salario NUMBER,
	data_admissao DATE,
  ctps VARCHAR2(8),
  dependentes varray_dependentes,
  setor REF tp_Setor
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE BODY tp_Funcionario AS --OK
OVERRIDE MEMBER PROCEDURE mostrar IS

DECLARE
  n INTEGER;
  i INTEGER;
  d INTEGER;

BEGIN
	--INFORMAÇÕES PESSOAIS
	DBMS_OUTPUT.put_line('NOME: ' || nome);
  DBMS_OUTPUT.put_line('CPF: ' || cpf);
  DBMS_OUTPUT.put_line('SEXO: ' || sexo);
  DBMS_OUTPUT.put_line('DATA DE NASCIMENTO: ' || TO_CHAR(data_nasci));

	--ENDERECO
	DBMS_OUTPUT.put_line('CEP: ' || endereco.cep);
	DBMS_OUTPUT.put_line('NUMERO: ' || endereco.numero);
	DBMS_OUTPUT.put_line('COMPLEMENTO: ' || endereco.complemento);

  --TELEFONES
	n:=telefones.COUNT;
  DBMS_OUTPUT.put_line('TELEFONES: ');
  IF n > 0 THEN
		FOR i in 1..n LOOP
			DBMS_OUTPUT.put_line(i || telefones(i).telefone);
		END LOOP;
	ELSE
		DBMS_OUTPUT.put_line('Não há telefones registrados.');
	END IF;

	--INFORMACOES TRABALHISTAS
	DBMS_OUTPUT.put_line('SALARIO: ' || salario);
	DBMS_OUTPUT.put_line('DATA DE ADMISSAO: ' || data_admissao);
	DBMS_OUTPUT.put_line('CTPS: ' || ctps);

  -- DEPENDENTES
  d := dependentes.COUNT;
  DBMS_OUTPUT.put_line('DEPENNTES: ');
  IF d > 0 THEN
		FOR i in 1..d LOOP
			DBMS_OUTPUT.put_line(i || dependentes(i).nome || ' é ' || dependentes(i).parentesco );
		END LOOP;
	ELSE
		DBMS_OUTPUT.put_line('Não há telefones registrados.');
	END IF;

	END;
END;
/

CREATE OR REPLACE TYPE tp_Operador UNDER tp_Funcionario (
    turno VARCHAR2(14) 
);
/

CREATE OR REPLACE TYPE tp_Diploma AS OBJECT(
	diploma VARCHAR2(50),
  universidade VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE nt_lista_diploma AS TABLE OF tp_Diploma;
/

CREATE OR REPLACE TYPE tp_Gerente UNDER tp_Funcionario (
    diplomas nt_lista_diploma
);
/

CREATE OR REPLACE TYPE tp_Email AS OBJECT (
  email VARCHAR(14)
);
/

CREATE OR REPLACE TYPE varray_Email AS VARRAY (5) OF tp_Email;
/

CREATE OR REPLACE TYPE tp_Fornecedor AS OBJECT (
	  cnpj VARCHAR2(14),
    razao_social VARCHAR(50),
    inscricao_estadual VARCHAR2(12),
    telefone tp_Telefone,
    endereco tp_Endereco,
    email varray_Email
);
/

CREATE OR REPLACE TYPE tp_Solicita AS OBJECT (
    solicitacao INTEGER,
    data_solicitacao DATE,
    produto REF tp_Produto,
    setor REF tp_Setor,
    fornecedor REF tp_Fornecedor
);
/

CREATE OR REPLACE TYPE tp_Registra AS OBJECT (
    registro INTEGER,
    data_registro DATE,
    funcionario REF tp_Funcionario, 
    produto REF tp_Produto, 
    setor REF tp_Setor
);
/