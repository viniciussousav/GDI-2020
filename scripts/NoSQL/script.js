/*

    Para rodar esse script tem que estar com um servidor mongodb
    instalado e executando na máquina através do mongodb shell,
    após isso utilizasse a seguinte função no shell:

    load("<local_do_arquivo>/script.js")

    Os comandos para manipular o db e suas collection no shell são 
    identicos a um arquivo js, inclusive a documentação assim orienta
    para executar scripts no mongodb shell.
*/



db.pacientes.remove({});
db.funcionarios.remove({});
db.agendamentos.remove({});
db.exames.remove({});

db.pacientes.insertMany(
    [
        {
            _id: 1,
            primeiro_nome: "Vinicius",
            sobrenome: "Vilela",
            idade: 21,
            sexo: "M",
            historico_exames: [],
            cpf: "111.111.111-11",
            rg: "1.111.111"
        },
        {
            _id: 2,
            primeiro_nome: "Luan",
            sobrenome: "Advincula",
            idade: 20,
            sexo: "M",
            historico_exames: [],
            cpf: "222.222.222-22",
            rg: "2.222.222"
        }
    ]
);

db.funcionarios.insertMany(
    [
        {
            _id: 1,
            primeiro_nome: "Paulo",
            sobrenome: "Aragão",
            idade: 21,
            sexo: "M",
            salario: 3500.00,
            especializacao: "Biomedicina",
            data_admissao: new Date(2018, 2, 25), // 25/03/2018 com -1 no mês na hora da criação
            exames_ids: []
        },
        {
            _id: 2,
            primeiro_nome: "Jorge",
            sobrenome: "Sampaoli",
            idade: 50,
            sexo: "M",
            salario: 4000.00,
            especializacao: "Pediatria",
            data_admissao: new Date(2015, 4, 10),
            exame_ids: []
        },
        {
            _id: 3,
            primeiro_nome: "Marcia",
            sobrenome: "Azevedo",
            idade: 29,
            sexo: "F",
            salario: 3000.00,
            especializacao: "Microbiologia",
            data_admissao: new Date(2019, 10, 27),
            exame_ids: []
        },
        {
            _id: 4,
            primeiro_nome: "Lucas",
            sobrenome: "Moraes",
            idade: 42,
            sexo: "M",
            salario: 3400.00,
            especializacao: "Biomedicina",
            data_admissao: new Date(2017, 2, 4),
            exame_ids: []
        },
        {
            _id: 5,
            primeiro_nome: "Marta",
            sobrenome: "Silva",
            idade: 20,
            sexo: "F",
            salario: 2000.00,
            especializacao: "Infectologia",
            data_admissao: new Date(2021, 3, 15),
            exame_ids: []
        }

    ]
);

db.agendamentos.insertMany([
    {
        _id: 1,
        tipo: "Exame sanguíneo",
        localizacao: {
            logradouro: "Avenida Conde da Boa Vista",
            cidade: "Recife",
            uf: "PE",
            numero: "357",
            complemento: "SALA 245  TÉRREO"
        },
        ordem: 1,
        data: new Date(2021, 4, 15),
        paciente_id: 1,
        funcionario_id: 1
    },
    {
        _id: 2,
        tipo: "Exame de urina de rotina",
        localizacao: {
            logradouro: "Avenida Conde da Boa Vista",
            cidade: "Recife",
            uf: "PE",
            numero: "357",
            complemento: "SALA 245  TÉRREO"
        },
        ordem: 2,
        data: new Date(2021, 4, 15),
        paciente_id: 2,
        funcionario_id: 2
    },
    {
        _id: 3,
        tipo: "Dosagem de Ferritina",
        localizacao: {
            logradouro: "Avenida Agamenom Magalhães",
            cidade: "Recife",
            uf: "PE",
            numero: "873"
        },
        ordem: 1,
        data: new Date(2021, 4, 16),
        paciente_id: 2,
        funcionario_id: 2
    },
    {
        _id: 4,
        tipo: "Exame de urina de rotina",
        localizacao: {
            logradouro: "Avenida Agamenom Magalhães",
            cidade: "Recife",
            uf: "PE",
            numero: "873"
        },
        ordem: 2,
        data: new Date(2021, 4, 16),
        paciente_id: 1,
        funcionario_id: 1
    }
]);

db.exames.insertMany([
    {
        _id: 1,
        tipo: "Exame sanguíneo",
        paciente_id: 1,
        funcionario_id: 1,
        data_realizacao: new Date(2021, 4, 15),
        resultados: {
            hemoglobina: 12,
            hematocrito: 46,
            leucocitos: 8.7,
            neutrofilos: 67,
            linfocitos: 28,
            monocitos: 2
        }
    },
    {
        _id: 2,
        tipo: "Exame de urina de rotina",
        paciente_id: 1,
        funcionario_id: 4,
        data_realizacao: new Date(2021, 2, 7),
        resultados: {
            densidade: 1.005,
            cor: "amarelo citrino",
            aspecto: "limpido",
            odor: "caracteristico",
            ph: 5.8
        }
    },
    {
        _id: 3,
        tipo: "Dosagem de Ferritina",
        paciente_id: 2,
        funcionario_id: 2,
        data_realizacao: new Date(2020, 13, 28),
        resultados: {
            dosagem: 164
        }
    },
    {
        _id: 4,
        tipo: "Dosagem de glicose",
        paciente_id: 2,
        funcionario_id: 5,
        data_realizacao: new Date(2021, 3, 1),
        resultados: {
            glicemia: 117
        }
    }
]);


// atualizar o HISTORICO_EXAMES de PACIENTES inserindo os id dos exames que ele realizaram

// atualizar o HISTORICO_EXAMES de FUNCIONARIOS inserindo os id dos exames que ele realizaram

// CONSULTAS

// find() e pretty() - Listando todas as collections em seu estado inicial
db.pacientes.find().pretty();
db.funcionarios.find().pretty();
db.agendamentos.find().pretty();
db.exames.find().pretty();

// update os pacientes e os funcionarios de acordo com os exames que eles estão alocados
db.pacientes.update(
    { id: 1 },
    { $push: { historico_exames: 1 } }
);

db.pacientes.update(
    { id: 1 },
    { $push: { historico_exames: 2 } }
);

db.pacientes.update(
    { id: 2 },
    { $push: { historico_exames: 3 } }
);

db.pacientes.update(
    { id: 2 },
    { $push: { historico_exames: 4 } }
);

//funcionarios
db.funcionarios.update( // ok
    { id: 1 },
    { $push: { historico_exames: 1 } }
);

db.funcionarios.update( //ok
    { id: 2 },
    { $push: { historico_exames: 3 } }
);

db.funcionarios.update( // ok
    { id: 4 },
    { $push: { historico_exames: 2 } }
);

db.funcionarios.update(
    { id: 5 },
    { $push: { historico_exames: 4 } }
);

//utilizando o size

cursor_pacientes_count = db.pacientes.find().count();
printjson("A quantidade de pacientes cadastrados é: " + cursor_pacientes_count);

cursor_funcionarios_count = db.funcionarios.find().count();
printjson("A quantidade de funcionarios cadastrados é: " + cursor_funcionarios_count);

cursor_agendamentos_count = db.agendamentos.find().count();
printjson("A quantidade de agendamentos cadastrados é: " + cursor_agendamentos_count);

cursor_exames_count = db.exames.find().count();
printjson("A quantidade de exames cadastrados é: " + cursor_exames_count);

//utilizando o aggregate para calcular a total dos salários por sexo
printjson("Calcular a quantidade dos salários por cada sexo:")
aggregate_cursor_1 = db.funcionarios.aggregate([
    {
        $match: {
            idade: {
                $gte: 21
            }
        }
    },
    {
        $group:
        {
            _id: "$sexo",
            total: { $sum: "$salario" },

        }
    }
]);

while (aggregate_cursor_1.hasNext()) {
    print(tojson(aggregate_cursor_1.next()));
}

//utilizando o aggregate para classificar a média dos salários dos funcionários de acordo com a especialidade
printjson("Listando o salário de cada especialização de acordo com a ordem da média dos salários")
aggregate_cursor_2 = db.funcionarios.aggregate([
    {
        $group: {
            _id: "$especializacao",
            soma_salarios: {
                $avg: "$salario"
            }
        }
    },
    {
        $project: {
            salario: "$soma_salarios"
        },
    },
    {
        $sort: {
            salario: -1
        }
    }
]);

while (aggregate_cursor_2.hasNext()) {
    print(tojson(aggregate_cursor_2.next()));
}





