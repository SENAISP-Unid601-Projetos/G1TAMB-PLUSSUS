const express = require("express");
const fs = require("fs");
const porta = 8080;
const app = express();
const path = require("path");
const model = path.join(__dirname, "model");
const view = path.join(__dirname,"view");
const control = path.join(__dirname,"control");
const pacientes = require("./model/pacientes")
const medicos = require("./model/medicos")
const consultas = require("./model/consultas")
const adm = require("./model/administradores");
const medicamentos = require("./model/medicamentos");
const fichaMedica = require("./model/fichaMedica");
const email = require("./model/email");


app.use(express.static(model));
app.use(express.static(view));
app.use(express.static(control));
app.use(express.json())
app.use(express.urlencoded({extended: true}));
//API

app.get("/lista_pacientes", async function(req, res){
    const resposta = await pacientes.getPacientes();
    res.json(resposta);
})

app.get("/pega_paciente", async function(req, res){
    const parametros = req.query;
    const listaPacientes = pacientes.getPaciente(parametros);
    res.json(listaPacientes);
})

app.get("/lista_medicos", async function(req, res){
    const resposta = await medicos.getMedicos();
    res.json(resposta);
})

app.get("/lista_consultas", async function(req, res){
    const resposta = await consultas.getConsultas();
    res.json(resposta);
})

app.get("/lista_medicamentos", async function(req, res){
    const dados = req.query;
    const resposta = await medicamentos.getMedicamento(dados.nomeMedicamento);
    res.json(resposta);
})

app.get("/preenche_Ficha", async function(req, res){
    const dados = req.query;
    const resposta = await fichaMedica.getFicha(dados.cpf);
    res.json(resposta);
})

app.get("/lista_medicamentos2", async function(req, res){
    const dados = req.query;
    const resposta = await medicamentos.procuraMedicamentos(dados.nome, dados.dosagem);
    res.json(resposta);
})


app.get("/lista_horarios", async function(req, res){
    const dados = req.query;
    const resposta = await consultas.getHorarios(dados);
    res.json(resposta);
})

app.get("/lista_consultas_med", async function(req, res){
    const dados = req.query;
    const resposta = await consultas.getConsultasMed(dados);
    res.json(resposta);
})

app.get("/lista_consultas_paciente", async function(req, res){
    const dados = req.query;
    const resposta = await consultas.getConsultasPaciente(dados);
    res.json(resposta);
})

app.get("/pega_medico", async function(req, res){
    const parametros = req.query;
    const listaMedicos = medicos.getMedico(parametros);
    res.json(listaMedicos);
})

app.get("/lista_adm", async function(req, res){
    const resposta = await adm.getAdms();
    res.json(resposta);
})

app.get("/pega_adm", async function(req, res){
    const parametros = req.query;
    const administradores = adm.getAdm(parametros);
    res.json(administradores);
})

//POST

app.post("/cadastra_paciente", async function(req, res){
    const dados = req.body;
    const resposta = await pacientes.cadastraPaciente(dados);
    const status = resposta.sucesso === true ? 201:500;
    res.status(status).json(resposta);
})

app.post("/upsert_ficha", function(req, res){
    const dados = req.body;
    const resposta = fichaMedica.upsertFicha(dados);
    res.json({mensagem: resposta})
})

app.post("/cadastra_medico", async function(req, res){
    const dados = req.body;
    const resposta = await medicos.cadastraMedico(dados);
    const status = resposta.sucesso === true ? 201:500;
    res.status(status).json(resposta);
})

app.post("/cadastra_medicamento", async function(req, res){
    const dados = req.body;
    const resposta = medicamentos.cadastraMedicamento(dados);
    res.json({mensagem: resposta})
})

app.post("/edita_medicamento", async function(req, res){
    const dados = req.body;
    const resposta = await medicamentos.editarMedicamento(dados);
    res.json(resposta)
})

app.post("/remove_consultas", function(req, res){
    const dados = req.body;
    const resposta = consultas.removeConsultas(dados);
    res.json({mensagem: resposta})
})

app.post("/remove_paciente", async function(req, res){
    const dados = req.body;
    console.log(dados);
    const resposta = await pacientes.removePaciente(dados);
    res.json({mensagem: resposta})
})

app.post("/remove_medico", function(req, res){
    const dados = req.body;
    const resposta = medicos.removeMedico(dados);
    res.json({mensagem: resposta})
})


app.post("/cadastra_adm", function(req, res){
    const dados = req.body;
    const resposta = adm.cadastraAdm(dados);
    res.json({mensagem: resposta})
})

app.post("/login", async function(req, res) {
    const dados = req.body;
    const dadosPaciente = await pacientes.getPaciente(dados);
    res.json(dadosPaciente);
})

app.post("/login_medico", async function(req, res) {
    const dados = req.body;
    const dadosMedico = await medicos.getMedico(dados);
    res.json(dadosMedico);
})

app.post("/login_adm", async function(req, res) {
    const dados = req.body;
    const dadosAdm = await adm.getAdm(dados);
    res.json(dadosAdm);
})

app.post("/agenda", function(req, res){
    const dados = req.body;
    const resposta = consultas.cadastraConsulta(dados);
    res.json({mensagem: resposta})
})

app.post("/resetSenha", async (req, res) => {
    const dados = req.body;
    const enviaEmail = await email.enviaResetSenha(dados);
    res.json(enviaEmail);
})

app.post("/atualizaSenha", async (req, res) => {
    const dados = req.body;
    const enviaEmail = await email.atualizaSenha(dados);
    res.json(enviaEmail);
})


//Páginas HTML
app.get("/", function(req, res){
    const pagina = fs.readFileSync("./view/index.html", "utf-8");
    res.send(pagina);
});

app.get("/loginpaciente", function(req, res){
    const pagina = fs.readFileSync("./view/login.html", "utf-8");
    res.send(pagina);
});

app.get("/loginMed", function(req, res){
    const pagina = fs.readFileSync("./view/loginMédico.html", "utf-8");
    res.send(pagina);
});

app.get("/loginFuncionario", function(req, res){
    const pagina = fs.readFileSync("./view/loginAdm.html", "utf-8");
    res.send(pagina);
});

app.get("/registro", function(req, res){
    const pagina = fs.readFileSync("./view/registro.html", "utf-8");
    res.send(pagina);
});

app.get("/fila", function(req, res){
    const pagina = fs.readFileSync("./view/fila.html", "utf-8");
    res.send(pagina);
});

app.get("/medico", function(req, res){
    const pagina = fs.readFileSync("./view/.html", "utf-8");
    res.send(pagina);
});

app.get("/logado", function(req, res){
    const pagina = fs.readFileSync("./view/timeline.html", "utf-8");
    res.send(pagina);
});

app.get("/logadoMed", function(req, res){
    const pagina = fs.readFileSync("./view/timelineMédico.html", "utf-8");
    res.send(pagina);
});

app.get("/admLogado", function(req, res){
    const pagina = fs.readFileSync("./view/timelineAdm.html", "utf-8");
    res.send(pagina);
});

app.listen(porta, function(){
    console.log(`Escutando porta ${porta}`);
});