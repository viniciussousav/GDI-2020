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

-- USA UMA PESSOA JA CADASTRADA
CREATE OR REPLACE PROCEDURE insert_cliente (
  c_id  IN CLIENTE.id%TYPE
) IS
BEGIN
INSERT INTO
  Cliente (id)
VALUES
  (c_id);
COMMIT;
END insert_cliente;
/

EXECUTE insert_cliente (12345678910);

SELECT * FROM Cliente WHERE id = 12345678910;
