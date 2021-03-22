CREATE SEQUENCE END_ID_SEQ;

INSERT INTO
  Endereco (id_endereco, rua, numero, complemento, bairro, cidade, estado)
VALUES
  (END_ID_SEQ.NEXTVAL, 'Rua Cassilandia', 275, 'Casa', 'Várzea', 'Recife', 'Pernambuco', 55740430);

INSERT INTO
  Endereco (id_endereco, rua, numero, complemento, bairro, cidade, estado)
VALUES
  (END_ID_SEQ.NEXTVAL, 'Av. Duas Unas', 88, 'Apartamento', 'Santo Aleixo', 'Jaboatão dos Guararapes', 'Pernambuco', 54120560);

INSERT INTO
  Endereco (id_endereco, rua, numero, complemento, bairro, cidade, estado)
VALUES
  (END_ID_SEQ.NEXTVAL, 'R. Dr. José Mariano', 77, 'Casa', 'Centro', 'Caruaru', 'Pernambuco', 55641150);

INSERT INTO
  Endereco (id_endereco, rua, numero, bairro, cidade, estado)
VALUES
  (END_ID_SEQ.NEXTVAL, 'Av. Prof. Moraes Rego', 55, 'Várzea', 'Recife', 'Pernambuco', 50670-420);
