const psql = require("./conector")

async function cadastraAdm(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`insert into adm (login,senha) values ('${dados.login}','${dados.senha}')`);
    conexao.end();
    return resultado;
}

async function getAdms(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select * from adm");
    conexao.end();
    return resultado.rows;
}

async function getAdm(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from adm where upper(login) = upper('${dados.login}')`);
    conexao.end();
    return resultado.rows;
}

exports.cadastraAdm = cadastraAdm;
exports.getAdms = getAdms;
exports.getAdm = getAdm;