const psql = require("./conector")

async function cadastraPaciente(dados){
    const conexao = psql.conectaBanco();
    let resultado = {sucesso: true};
    try{
        resultado = await conexao.query(`insert into paciente (cpf,nome,email,carteirinha_sus,telefone,senha) values ('${dados.cpf}','${dados.nome}','${dados.email}','${dados.carteirinha_sus}','${dados.telefone}','${dados.senha}')`);
        resultado.sucesso = true;
        resultado.mensagem = "Paciente cadastrado com sucesso!"; 
    }
    catch(erro){
        
        resultado.sucesso = false;
        if (erro.hasOwnProperty("detail") === true && typeof erro.detail == "string" && erro.detail.match(/already exists/gi) != null) {
            resultado.mensagem = "Paciente já cadastrado";
        }
        else {
            resultado.mensagem = "Erro não identificado. Favor consultar administrador!";
        }
    }
    conexao.end();
    return resultado;
}

async function getPacientes(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select paciente.cpf as cpf_paciente, paciente.nome as nome_paciente, paciente.email as email_paciente, paciente.carteirinha_sus as carteirinha_paciente, paciente.telefone as telefone_paciente from paciente");
    conexao.end();
    return resultado.rows;
}

async function getPaciente(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from paciente where cpf = '${dados.cpf}'`);
    conexao.end();
    return resultado.rows;
}

async function removePaciente(dados){
    const conexao = psql.conectaBanco();
    const query = `
    delete from paciente where cpf = '${dados.cpf}'`;
    console.log(query);
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

exports.cadastraPaciente = cadastraPaciente;
exports.getPacientes = getPacientes;
exports.getPaciente = getPaciente;
exports.removePaciente = removePaciente;