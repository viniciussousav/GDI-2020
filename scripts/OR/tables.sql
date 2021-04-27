-- CRIAÇÃO DAS TABELAS
CREATE TABLE tb_Setor OF tp_Setor
(categoria PRIMARY KEY);
/

CREATE TABLE tb_Clientes OF tp_Cliente 
( PRIMARY KEY (cpf, email) );
/
    
CREATE TABLE tb_Gerentes OF tp_Gerente
( PRIMARY KEY (cpf, ctps) ) NESTED TABLE diplomas STORE AS diplomas;
/

CREATE TABLE tb_Operadores OF tp_Operador
( PRIMARY KEY (cpf, ctps) );
/

CREATE TABLE tb_Produto OF tp_Produto 
( PRIMARY KEY (id, nome) );
/

CREATE TABLE tb_Fornecedor OF tp_Fornecedor
( cnpj PRIMARY KEY );
/

CREATE TABLE tb_Solicita OF tp_Solicita
( 
  PRIMARY KEY (solicitacao, data_solicitacao),
  fornecedor SCOPE IS tb_Fornecedor
);
/

CREATE TABLE tb_Registra OF tp_Registra
( PRIMARY KEY (registro, data_registro) );
/

CREATE TABLE tb_Pedido OF tp_Pedido
( PRIMARY KEY (pedido, data_pedido) );
/
