CREATE SEQUENCE ANO_CORRENTE_SEQ
  MINVALUE 2010
  MAXVALUE 2021
  START WITH 2010
  INCREMENT BY 1;

DECLARE TYPE Codigo_postal IS RECORD (
  cep    NUMBER,
  rua    VARCHAR2(50),
  bairro VARCHAR2(20),
  cidade VARCHAR2(20),
  estado VARCHAR2(20)
);

end1 Codigo_postal;

BEGIN
end1.cep    := 50690000;
end1.rua    := 'Avenida Caxangá';
end1.bairro := 'Iputinga';
end1.cidade := 'Recife';
end1.estado := 'PE';
END;
/

DECLARE
  cpf_pessoa VARCHAR2(11):= '11122233344';
  cpf_aux    VARCHAR2(11);
  TYPE pessoa_cpf IS TABLE OF Pessoa.cpf%TYPE INDEX BY VARCHAR2(11);
BEGIN
  SELECT cpf INTO cpf_aux
  FROM Pessoa 
  WHERE cpf_pessoa = Pessoa.cpf;
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    DBMS_OUTPUT.put_line ('Pessoa não cadastrada');
  WHEN OTHERS THEN 
    DBMS_OUTPUT.put_line ('ERRO');
END;
/

-- USA UMA PESSOA JA CADASTRADA PARA ADICIONAR COMO FUNCIONARIO
CREATE OR REPLACE PROCEDURE insert_funcionario (
  f_id              IN FUNCIONARIO.id%TYPE,
  f_salario         IN FUNCIONARIO.salario%TYPE,
  f_admissao        IN FUNCIONARIO.data_admissao%TYPE,
  f_ctps            IN FUNCIONARIO.ctps%TYPE
) IS
BEGIN
INSERT INTO
  Funcionario (id, salario, data_admissao, ctps)
VALUES
  (f_id, f_salario, f_admissao, f_ctps);
COMMIT;
END insert_funcionario;
/

EXECUTE insert_funcionario (50819283053, 10000, DATE '2010-01-01', 12345678);
SELECT * FROM Funcionario WHERE id = 50819283053;

CREATE OR REPLACE PACKAGE contabilidade AS
  FUNCTION get_pedidos_ano(ano NUMBER)
    RETURN NUMBER;
END contabilidade;
/

CREATE OR REPLACE PACKAGE BODY contabilidade AS
  -- LISTA PEDIDOS FEITO NUM DETERMINADO ANO
  FUNCTION get_pedidos_ano (
    ano NUMBER
  )
  RETURN NUMBER
  IS
    total_pedidos NUMBER := 0;
  BEGIN
    SELECT COUNT(id)
    INTO total_pedidos
    FROM Pedido
    WHERE EXTRACT(YEAR FROM data_pedido) = ano;

    RETURN total_pedidos;
  END;
END contabilidade;
/

DECLARE
  pedidos NUMBER := 0;
BEGIN
  pedidos := contabilidade.get_pedidos_ano(ANO_CORRENTE_SEQ.NEXTVAL);
  IF pedidos >= 1000 THEN
    DBMS_OUTPUT.PUT_LINE('Meta de vendas atingida! Número total de pedidos: ' || pedidos);
  ELSIF pedidos > 0 AND pedidos < 1000 THEN
    DBMS_OUTPUT.PUT_LINE('Meta de vendas não atingida! Número total de pedidos: ' || pedidos);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nenhum pedido realizado no período.');
  END IF;
END;
/

CREATE OR REPLACE PROCEDURE lista_produtos
IS
  CURSOR prod_cur IS SELECT nome, estoque FROM Produto;
  var_prod prod_cur%ROWTYPE;
BEGIN
  OPEN prod_cur;
  LOOP
    FETCH prod_cur INTO var_prod;
    EXIT WHEN prod_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Produto: ' || var_prod.nome);
    DBMS_OUTPUT.PUT_LINE('Estoque: ' || var_prod.estoque);
    DBMS_OUTPUT.PUT_LINE(char(10));
  END LOOP;
  CLOSE prod_cur;
END;
/

CALL lista_produtos;

-- CALCULA O VALOR COM DESCONTO DE PRODUTOS
DECLARE
  desconto NUMBER;
  CURSOR prodcur IS SELECT nome, preco_venda FROM Produto;
  varprod prodcur%ROWTYPE;
BEGIN
  OPEN prodcur;
  LOOP
    FETCH prodcur INTO varprod;
    EXIT WHEN prodcur%NOTFOUND;
    CASE
    WHEN varprod.preco_venda >= 3000 THEN
      desconto := 0.15;
    WHEN varprod.preco_venda >= 2000 AND varprod.preco_venda < 3000 THEN
      desconto := 0.10;
    WHEN varprod.preco_venda >= 1000 AND varprod.preco_venda < 2000 THEN
      desconto := 0.05;
    ELSE
      desconto := 0.00;
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Produto: ' || varprod.nome);
    DBMS_OUTPUT.PUT_LINE('Valor com desconto: ' || varprod.preco_venda * (1 - desconto));
  END LOOP;
  CLOSE prodcur;
END;
/

-- LOOP PARA CALCULO DA FOLHA SALARIAL
DECLARE
  folha_salarial NUMBER;
BEGIN
  folha_salarial := 0;
  FOR funcionarios IN (SELECT salario FROM Funcionario)
  LOOP
    folha_salarial := folha_salarial + funcionarios.salario;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Valor da folha salarial: R$' || folha_salarial);
END;
/

-- LOOP PARA CALCULO DO INVENTARIO DE PRODUTOS
DECLARE
  idx_produtos NUMBER;
  valor_inventario NUMBER;
  CURSOR prodcur IS SELECT nome, estoque, preco_venda FROM Produto;
  varprod prodcur%ROWTYPE;
BEGIN
  OPEN prodcur;
  valor_inventario := 0;
  SELECT COUNT(*) INTO idx_produtos FROM Produto;
  SELECT SUM(preco_venda) INTO valor_inventario FROM Produto;
  WHILE idx_produtos > 0
  LOOP
    FETCH prodcur INTO varprod;
    DBMS_OUTPUT.PUT_LINE('Produto: ' || varprod.nome);
    DBMS_OUTPUT.PUT_LINE('Estoque: ' || varprod.estoque);
    DBMS_OUTPUT.PUT_LINE('Preço de venda: ' || varprod.preco_venda);
    DBMS_OUTPUT.PUT_LINE('Valor total: ' || varprod.estoque * varprod.preco_venda);
    DBMS_OUTPUT.PUT_LINE(chr(10)); -- linha em branco
    idx_produtos := idx_produtos - 1;
  END LOOP;
  CLOSE prodcur;
END;
/
