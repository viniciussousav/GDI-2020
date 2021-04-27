-- POVOAMENTO DAS TABELAS

INSERT INTO tb_Setor
VALUES (
    tp_Setor(
        'Eletrodomésticos'
    )
);

INSERT INTO tb_Setor
VALUES (
    tp_Setor(
        'Informática'
    )
);

INSERT INTO tb_Gerentes
VALUES (
    tp_Gerente(
        10000000000,
        'Paulo Victor da Silva Aragão',
        'M',
        to_date('01/01/2001', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone('00000000001'),
            tp_Telefone('00000000002')
        ),
        tp_Endereco(111111111, 1, 'APT 111', 'Rua 1', 'Bairro 1', 'Olinda', 'PE'),
        20000,
        to_date('01/01/2019', 'dd/mm/yyyy'),
        '00000001',
        NULL,
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Eletrodomésticos'),
        nt_lista_diploma(
            tp_Diploma(
                'Administração', 'UFPE'
            )
        )
));

INSERT INTO tb_Gerentes
VALUES (
    tp_Gerente(
        20000000000,
        'Luan Silva de Sena Almeida',
        'M',
        to_date('02/01/2001', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone('00000000003'),
            tp_Telefone('00000000004')
        ),
        tp_Endereco(222222222, 2, 'APT 222', 'Rua 2', 'Bairro 1', 'Recife', 'PE'),
        20000,
        to_date('02/01/2019', 'dd/mm/yyyy'),
        '00000002',
        NULL,
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Informática'),
        nt_lista_diploma(
            tp_Diploma(
                'Ciências Contábeis' , 'UFPE'
            ),
            tp_Diploma(
                'Administração' , 'UFPE'
            ),
            tp_Diploma(
                'Economia' , 'UNIBRA'
            )
        )
));

INSERT INTO tb_Operadores
VALUES (
    tp_Operador(
        30000000000,
        'Gabriel Amâncio',
        'M',
        to_date('03/01/2001', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone('00000000005'),
            tp_Telefone('00000000006')
        ),
        tp_Endereco(333333333, 3, 'APT 333', 'Rua 3', 'Bairro 2', 'Itaquitinga', 'PE'),
        30000,
        to_date('03/01/2019', 'dd/mm/yyyy'),
        '00000003',
        NULL,
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Eletrodomésticos'),
        'Manhã'
));

INSERT INTO tb_Operadores
VALUES (
    tp_Operador(
        40000000000,
        'Vinicius de Sousa Vilela',
        'M',
        to_date('04/01/2001', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone('00000000007'),
            tp_Telefone('00000000008')
        ),
        tp_Endereco(444444444, 4, 'APT 444', 'Rua 3', 'Bairro 3', 'Pombos', 'PE'),
        40000,
        to_date ('04/01/2019', 'dd/mm/yyyy'),
        '00000004',
        NULL,
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Informática'),
        'Noite'
    )
); 

INSERT INTO tb_Clientes 
VALUES (
   tp_Cliente(
        50000000000, 
        'João Silva', 
        'M', 
        to_date('20/01/1983', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone(
                '07199402169'
            )
        ),
        tp_Endereco(555555555, 5, 'APT 555', 'Rua da Praia', 'Santo Antônio', 'Recife', 'PE'),
        'j1@cin.ufpe.br'
   )
);

INSERT INTO tb_Clientes 
VALUES (
    tp_Cliente(
        60000000000, 
        'José Souza', 
        'M', 
        to_date('28/03/1990', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone(
                '02798615800'
            )
        ),
        tp_Endereco(666666666, 6, 'APT 666', 'Rua 2', 'Bairro 2', 'Olinda', 'PE'),
        'j2@cin.ufpe.br'
    )
);

INSERT INTO tb_Clientes VALUES (
    tp_Cliente(
         70000000000, 
        'Maria Farias', 
        'F', 
        to_date('03/05/1991', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone(
                '08898140752'
            )
        ),
        tp_Endereco(777777777, 7, 'APT 777', 'Rua 1', 'Bairro 4', 'Recife', 'PE'),
        'mf@cin.ufpe.br'
    )
);

INSERT INTO tb_Clientes VALUES (
    tp_Cliente(
        80000000000, 
        'Ana Leite', 
        'F', 
        to_date('25/04/1988', 'dd/mm/yyyy'),
        varray_Telefone(
            tp_Telefone(
                '01599162578'
            )
        ),
        tp_Endereco(888888888, 8, 'APT 888', 'Rua 2', 'Bairro 4', 'Olinda', 'PE'),
        'an@cin.ufpe.br'
    )
);


INSERT INTO tb_Fornecedor
VALUES (
    tp_Fornecedor(
        '16546477145898',
        'Samsungueira Ltda',
        '546477145898',
        tp_Telefone('081994753578'),
        tp_Endereco(
            999999999, 5, NULL, 'Rua da Saudade', 'Boa Vista', 'Recife', 'PE'
        ),
        varray_Email(
            tp_Email('sacs@gmail.com')
        )
    )
);

INSERT INTO tb_Fornecedor
VALUES (
    tp_Fornecedor(
        '21321312312365',
        'Electrolux',
        '131231236542',
        tp_Telefone(
            '011321321783'
        ),
        tp_Endereco(
            211111111, 7, NULL, 'Rua São Miguel', 'Bairro 8', 'Camaragibe', 'PE'
        ),
        varray_Email(
            tp_Email(
                'elux@gml.comai'
            )
        )
    )
);

INSERT INTO tb_Produto
VALUES (
    tp_Produto(
        1,
        'Celular Samsungueira Galaxia A300',
        600,
        800,
        50,
        'Sansungueira'
    )
);

INSERT INTO tb_Produto
VALUES (
    tp_Produto(
        2,
        'Maquina de Lavar Electrolux',
        1600,
        1800,
        30,
        'Electrolux'
    )
);

INSERT INTO tb_Pedido
VALUES (
    tp_Pedido(
        1,
        to_date('01/04/2021', 'dd/mm/yyyy'),
        2500,
        'Cartão de Crédito',
        (SELECT REF(M) FROM tb_Clientes M WHERE cpf = 50000000000),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 2)
    )
);

INSERT INTO tb_Pedido
VALUES (
    tp_Pedido(
        2,
        to_date('15/02/2020', 'dd/mm/yyyy'),
        1600,
        'Cartão de Débito',
        (SELECT REF(M) FROM tb_Clientes M WHERE cpf = 60000000000),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 1)
    )
);

INSERT INTO tb_Registra
VALUES (
    tp_Registra(
        1,
        to_date('20/02/2020', 'dd/mm/yyyy'),
        (SELECT REF(M) FROM tb_Operadores M WHERE cpf = 40000000000),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 1),
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Informática')
    )
);

INSERT INTO tb_Registra
VALUES (
    tp_Registra(
        2,
        to_date('11/02/2020', 'dd/mm/yyyy'),
        (SELECT REF(M) FROM tb_Operadores M WHERE cpf = 30000000000),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 2),
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Eletrodomésticos')
    )
);

INSERT INTO tb_Solicita
VALUES (
    tp_Solicita(
        1,
        to_date('15/01/2020', 'dd/mm/yyyy'),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 1 AND nome = 'Celular Samsungueira Galaxia A300'),
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Informática'),
        (SELECT REF(M) FROM tb_Fornecedor M WHERE cnpj = '16546477145898')
    )
);

INSERT INTO tb_Solicita
VALUES (
    tp_Solicita(
        2,
        to_date('20/02/2021', 'dd/mm/yyyy'),
        (SELECT REF(M) FROM tb_Produto M WHERE id = 2 AND nome = 'Maquina de Lavar Electrolux'),
        (SELECT REF(M) FROM tb_Setor M WHERE categoria = 'Eletrodomésticos'),
        (SELECT REF(M) FROM tb_Fornecedor M WHERE cnpj = '21321312312365')
    )
);

SELECT DEREF(M.cliente).cpf FROM tb_pedido M WHERE pedido = 1;
/

SELECT VALUE(C).nome, cpf, email FROM tb_Clientes C;
/

SELECT * FROM TABLE(SELECT diplomas FROM tb_Gerentes G WHERE G.cpf = 20000000000) D WHERE D.universidade = 'UFPE';
/