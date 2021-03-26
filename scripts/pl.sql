DECLARE TYPE Endereco IS RECORD (
 	rua    VARCHAR2(50),
 	numero NUMBER,
 	bairro VARCHAR2(15),
 	cidade VARCHAR2(15),
 	estado VARCHAR2(15)
);

end1 Endereco;

BEGIN
end1.rua    := 'avenida caxangá';
end1.numero := 0;
end1.bairro := 'iputinga';
end1.cidade := 'recife';
end1.estado := 'PE';
END;
/

DECLARE
  cpf_pessoa VARCHAR2(14):= '111.222.333-44';
  cpf_aux    VARCHAR2(14);
  TYPE pessoa_cpf IS TABLE OF Pessoa.cpf%TYPE INDEX BY VARCHAR2(14);
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

CREATE OR REPLACE PROCEDURE insert_funcionario (
  f_id_funcionario  IN FUNCIONARIO.id_funcionario%TYPE,
  f_salario         IN FUNCIONARIO.salario%TYPE,
  f_ctps            IN FUNCIONARIO.ctps%TYPE
) IS
BEGIN
INSERT INTO
  Funcionario (id_funcionario, salario, ctps)
VALUES
  (f_id_funcionario, f_salario, f_ctps);
COMMIT;
END insert_funcionario;
/

EXECUTE insert_funcionario (1, 1000, 12345678);

SELECT * FROM Funcionario WHERE id_funcionario = 1;
