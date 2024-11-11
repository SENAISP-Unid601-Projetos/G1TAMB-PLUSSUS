const psql = require("./conector")

async function cadastraConsulta(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`insert into consultas (horario,descricao,data,fk_cpf_paciente,fk_crm_medico) values ('${dados.horario}','${dados.descricao}','${dados.data}','${dados.fk_cpf_paciente}','${dados.fk_crm_medico}')`);
    conexao.end();
    return resultado;
}

async function getConsultas(){
    const conexao = psql.conectaBanco();
    const query = `
    select paciente.nome as nome_paciente, consultas.horario as horario_consulta, consultas.data as data_consulta, medico.nome as nome_medico,
medico.especialidade as especialidade_medico from consultas
inner join paciente on
consultas.fk_cpf_paciente = paciente.cpf
inner join medico on
consultas.fk_crm_medico = medico.crm
where consultas.data >= now()
and consultas.data <= CURRENT_DATE
order by (consultas.data, consultas.horario) asc;`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

async function getConsultasMed(dados){
    const conexao = psql.conectaBanco();
    const query = `
    select paciente.nome as nome_paciente, consultas.horario as horario_consulta, consultas.data as data_consulta, consultas.descricao as sintomas_consulta,
paciente.telefone as telefone_paciente, paciente.email as email_paciente from consultas
inner join paciente on
consultas.fk_cpf_paciente = paciente.cpf
inner join medico on
consultas.fk_crm_medico = medico.crm
where consultas.data >= now()
and consultas.fk_crm_medico = '${dados.crm}'
order by (consultas.data, consultas.horario) asc;`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

async function getHorarios(dados){
    const conexao = psql.conectaBanco();
    const query = `
    select horario from consultas where data = '${dados.data}' and data >= NOW()
and fk_crm_medico = '${dados.crm}';`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

async function getConsulta(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from consultas where fk_cpf_paciente = ${dados.fk_cpf_paciente}`);
    conexao.end();
    return resultado.rows;
}


exports.cadastraConsulta = cadastraConsulta;
exports.getConsultas = getConsultas;
exports.getConsultasMed = getConsultasMed;
exports.getConsulta = getConsulta;
exports.getHorarios = getHorarios;