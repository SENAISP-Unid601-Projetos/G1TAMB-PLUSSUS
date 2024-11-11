const psql = require("./conector")

async function upsertFicha(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`INSERT INTO ficha_medica_paciente (
    fez_cirurgia, cirurgia, teve_internacao, internacao, toma_remedio, remedio, tem_alergia, alergia,
    fez_tratamento, tratamento, possui_problema_respiratorio, problema_respiratorio, possui_problema_figado_rin,
    problema_figado_rin, fuma, tem_hepatite, tem_diabetes, possui_problema_cardiaco, problema_cardiaco, tipo_sanguineo, fk_cpf
) 
VALUES (
    '${dados.fez_cirurgia}', '${dados.cirurgia}', '${dados.teve_internacao}', '${dados.internacao}',
    '${dados.toma_remedio}', '${dados.remedio}', '${dados.tem_alergia}', '${dados.alergia}',
    '${dados.fez_tratamento}', '${dados.tratamento}', '${dados.possui_problema_respiratorio}', '${dados.problema_respiratorio}',
    '${dados.possui_problema_figado_rin}', '${dados.problema_figado_rin}', '${dados.fuma}', '${dados.tem_hepatite}',
    '${dados.tem_diabetes}', '${dados.possui_problema_cardiaco}', '${dados.problema_cardiaco}', '${dados.tipo_sanguineo}', '${dados.fk_cpf}'
)
ON CONFLICT (fk_cpf) DO UPDATE SET
    fez_cirurgia = EXCLUDED.fez_cirurgia,
    cirurgia = EXCLUDED.cirurgia,
    teve_internacao = EXCLUDED.teve_internacao,
    internacao = EXCLUDED.internacao,
    toma_remedio = EXCLUDED.toma_remedio,
    remedio = EXCLUDED.remedio,
    tem_alergia = EXCLUDED.tem_alergia,
    alergia = EXCLUDED.alergia,
    fez_tratamento = EXCLUDED.fez_tratamento,
    tratamento = EXCLUDED.tratamento,
    possui_problema_respiratorio = EXCLUDED.possui_problema_respiratorio,
    problema_respiratorio = EXCLUDED.problema_respiratorio,
    possui_problema_figado_rin = EXCLUDED.possui_problema_figado_rin,
    problema_figado_rin = EXCLUDED.problema_figado_rin,
    fuma = EXCLUDED.fuma,
    tem_hepatite = EXCLUDED.tem_hepatite,
    tem_diabetes = EXCLUDED.tem_diabetes,
    possui_problema_cardiaco = EXCLUDED.possui_problema_cardiaco,
    problema_cardiaco = EXCLUDED.problema_cardiaco,
    tipo_sanguineo = EXCLUDED.tipo_sanguineo;
`);
        

    conexao.end();
    return resultado;
}

async function getFicha(dados){
    const conexao = psql.conectaBanco();
    const resultado = await conexao.query(`select * from ficha_medica_paciente where fk_cpf = '${dados}'; `);
    conexao.end();
    return resultado.rows;
}

exports.upsertFicha = upsertFicha;
exports.getFicha = getFicha;
