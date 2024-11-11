const psql = require("./conector")

async function cadastraMedico(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`insert into medico (crm,nome,email,cpf,telefone,senha,especialidade) values ('${dados.crm}','${dados.nome}','${dados.email}','${dados.cpf}','${dados.telefone}','${dados.senha}','${dados.especialidade}')`);
    conexao.end();
    return resultado;
}

async function getMedicos(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select * from medico");
    conexao.end();
    return resultado.rows;
}

async function getMedico(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from medico where crm = '${dados.crm}'`);
    conexao.end();
    return resultado.rows;
}

exports.cadastraMedico = cadastraMedico;
exports.getMedicos = getMedicos;
exports.getMedico = getMedico;