const psql = require("./conector")

async function cadastraPaciente(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`insert into paciente (cpf,nome,email,carteirinha_sus,telefone,senha) values ('${dados.cpf}','${dados.nome}','${dados.email}','${dados.carteirinha_sus}','${dados.telefone}','${dados.senha}')`);
    conexao.end();
    return resultado;
}

async function getPacientes(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select * from paciente");
    conexao.end();
    return resultado.rows;
}

async function getPaciente(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from paciente where cpf = '${dados.cpf}'`);
    conexao.end();
    return resultado.rows;
}

exports.cadastraPaciente = cadastraPaciente;
exports.getPacientes = getPacientes;
exports.getPaciente = getPaciente;