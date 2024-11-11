const pg = require("pg");

function conectaBanco(){
    const dados = {
        host: "127.0.0.1",
        port: "5432",
        user: "postgres",
        password: "Nogueira07",
        database: "sus"
    };
    
    const conexao = new pg.Pool(dados);
    return conexao;
};

exports.conectaBanco = conectaBanco;