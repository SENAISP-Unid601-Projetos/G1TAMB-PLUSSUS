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
where (consultas.data >= CURRENT_DATE and
	  consultas.horario >= CURRENT_TIME)
and consultas.data <= CURRENT_DATE + interval '1 day'
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

async function getConsultasPaciente(dados){
    const conexao = psql.conectaBanco();
    const query = `
    select consultas.id_consulta as id_consulta, consultas.horario as horario_consulta, consultas.data as data_consulta, consultas.descricao as sintomas_consulta, medico.nome as nome_medico from consultas 
inner join medico on
consultas.fk_crm_medico = medico.crm
where consultas.data >= now()
and consultas.fk_cpf_paciente = '${dados.cpf}'
order by (consultas.data, consultas.horario) asc;`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

async function removeConsultas(dados){
    const conexao = psql.conectaBanco();
    const query = `
    delete from consultas where id_consulta = ${dados.id_consulta}`;
    const resultado = await conexao.query(query);
    conexao.end();
    return resultado.rows;
}

async function getHorarios(dados){
    const conexao = psql.conectaBanco();
    const query = `
    select horario from consultas where data = '${dados.data}' and fk_crm_medico = '${dados.crm}';`;
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
exports.getConsultasPaciente = getConsultasPaciente;
exports.getConsulta = getConsulta;
exports.getHorarios = getHorarios;
exports.removeConsultas = removeConsultas;