const nodemailer = require("nodemailer");
const psql = require("./conector");
//Guardar debaixo do travesseiro: mziq oafb hetq asas
function credenciaisEmail() {
    const transporter = nodemailer.createTransport({
        service: 'gmail', // Pode ser 'gmail', 'yahoo', etc., ou configurar com host/porta para provedores personalizados
        auth: {
            user: 'plussus.webmaster@gmail.com', // Substitua pelo seu e-mail
            pass: 'mziq oafb hetq asas' // Substitua pela sua senha ou use uma senha de aplicativo para mais segurança
        }
    });
    return transporter;
}

async function enviaResetSenha(dados) {
    const conexao = psql.conectaBanco();
    const resposta = {
        sucesso: true,
    }
    try {
        const verificaUsuario = await conexao.query(`
            select * from 
            (
	            select nome, email, cpf, 'PACIENTE' as "tipo_usuario" from paciente
	            union
	            select nome, email, cpf, 'MEDICO' as "tipo_usuario" from medico
            )
            where email = '${dados.email}';
            `
        );
        if (verificaUsuario.rows.length < 1) {
            throw "Usuário não está cadastrado no PlusSUS!";
        }
        const dadosUsuario = verificaUsuario.rows[0];
        const idUrl = Buffer.from(`{"tipo_usuario":"${dadosUsuario.tipo_usuario}", "email":"${dados.email}", "data_requisicao": ${new Date().getTime()}}`).toString("base64");
        console.log(verificaUsuario.rows[0].nome);
        const transporter = credenciaisEmail();
        // Configurações do e-mail
        const mailOptions = {
            from: 'Webmaster PlusSUS <plussus.webmaster@gmail.com>',
            to: `${dados.email}`,
            subject: 'Reset de senha do PlusSUS',
            html: `Olá, ${verificaUsuario.rows[0].nome.split(" ")[0]}!<br><br>Conforme requisitado, clique <a href="http://10.141.129.48:8080/senhanova.html?id=${idUrl}">aqui</a> para reiniciar sua senha`
        };

        // Envio do e-mail
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                throw 'Erro ao enviar o e-mail:', error;
            }
        });
        resposta.retorno = "Email enviado com sucesso!";
    }
    catch (erro) {
        resposta.sucesso = false;
        resposta.motivoErro = erro;
    }
    console.log(resposta);
    conexao.end();
    return resposta;
}

async function atualizaSenha(dados) {
    const conexao = psql.conectaBanco();
    const resposta = {
        sucesso: true
    }

    try {
        const atualizacao = await conexao.query(`
            UPDATE ${dados.tipo_usuario} SET
            senha = '${dados.novaSenha}'
            WHERE email = '${dados.email}'
            `);
        resposta.retorno = atualizacao;
    }
    catch(erro) {
        resposta.sucesso = false;
        resposta.motivoErro = erro;
    }
    conexao.end();
    return resposta;
}

exports.enviaResetSenha = enviaResetSenha;
exports.atualizaSenha = atualizaSenha;