const psql = require("./conector")

async function cadastraMedico(dados){
    const conexao = psql.conectaBanco();
    let resultado = {sucesso: true};
    try{
        resultado = await conexao.query(`insert into medico (crm,nome,email,cpf,telefone,senha,especialidade) values ('${dados.crm}','${dados.nome}','${dados.email}','${dados.cpf}','${dados.telefone}','${dados.senha}','${dados.especialidade}')`);
        resultado.sucesso = true;
        resultado.mensagem = "Médico Cadastrado com sucesso!"; 
    }
    catch(erro){
        resultado.sucesso = false;
        if (erro.hasOwnProperty("detail") === true && typeof erro.detail == "string" && erro.detail.match(/already exists/gi) != null) {
            resultado.mensagem = "Médico já cadastrado";
        }
        else {
            resultado.mensagem = "Erro não identificado. Favor consultar administrador!";
        } 
    }
    conexao.end();
    return resultado;
}

async function getMedicos(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select medico.crm as crm_medico, medico.nome as nome_medico, medico.email as email_medico, medico.cpf as cpf_medico, medico.telefone as telefone_medico, medico.especialidade as especialidade_medico from medico");
    conexao.end();
    return resultado.rows;
}

async function getMedico(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from medico where crm = '${dados.crm}'`);
    conexao.end();
    return resultado.rows;
}

async function removeMedico(dados){
    const conexao = psql.conectaBanco();
    const query = `
    delete from medico where crm = '${dados.crm}'`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

exports.cadastraMedico = cadastraMedico;
exports.getMedicos = getMedicos;
exports.getMedico = getMedico;
exports.removeMedico = removeMedico;