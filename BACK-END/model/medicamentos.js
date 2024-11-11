const psql = require("./conector")

async function cadastraMedicamento(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`insert into medicamentos (nome,marca,quantidade,fk_login_adm,dosagem) values ('${dados.nome}','${dados.marca}',${dados.quantidade},'${dados.fk_login_adm}','${dados.dosagem}')`);
    conexao.end();
    return resultado;
}

async function editarMedicamento(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`update medicamentos set marca = '${dados.marca}', quantidade = ${dados.quantidade}, dosagem = '${dados.dosagem}' where nome = '${dados.nome} '`);
    conexao.end();
    return resultado;
}

async function getMedicamentos(){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query("select * from medicamentos");
    conexao.end();
    return resultado.rows;
}

async function getMedicamento(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from medicamentos where upper(nome) like upper('%${dados}%')`);
    conexao.end();
    return resultado.rows;
}

async function procuraMedicamentos(nome, dosagem){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from medicamentos where upper(nome) like upper('%${nome}%') and upper(dosagem) = upper('${dosagem}')`);
    conexao.end();
    return resultado.rows;
}

exports.cadastraMedicamento = cadastraMedicamento;
exports.editarMedicamento = editarMedicamento;
exports.getMedicamentos = getMedicamentos;
exports.procuraMedicamentos = procuraMedicamentos;
exports.getMedicamento = getMedicamento;