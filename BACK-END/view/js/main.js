
(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();


    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.sticky-top').addClass('shadow-sm').css('top', '0px');
        } else {
            $('.sticky-top').removeClass('shadow-sm').css('top', '-100px');
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Date and time picker
    $('.date').datetimepicker({
        format: 'L'
    });
    $('.time').datetimepicker({
        format: 'LT'
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: false,
        animateOut: 'fadeOutLeft',
        items: 1,
        dots: true,
        loop: true,
        nav: true,
        navText: [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
    });


    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: false,
        smartSpeed: 1000,
        center: true,
        dots: false,
        loop: true,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            }
        }
    });


})(jQuery);

//Declaração das variaveis
var cadastroNome = document.getElementById("cadastroNome")
var cadastroEmail = document.getElementById("cadastroEmail")
var cadastroCpf = document.getElementById("cadastroCpf")
var cadastroCart = document.getElementById("cadastroCart")
var cadastroTel = document.getElementById("cadastroTel")
var cadastroSenha = document.getElementById("cadastroSenha")
var cadastroNomeM = document.getElementById("cadastroNomeM")
var cadastroEmailM = document.getElementById("cadastroEmailM")
var cadastroCpfM = document.getElementById("cadastroCpfM")
var cadastroCrm = document.getElementById("cadastroCrm")
var cadastroTelM = document.getElementById("cadastroTelM")
var cadastroSenhaM = document.getElementById("cadastroSenhaM")
var selectEspecialidade = document.getElementById("selectEspecialidade")
var mensagem = document.getElementById("msg")
var mensagem2 = document.getElementById("msg2")
var tbody = document.getElementById("tbody")
var mensagem3 = document.getElementById("msgAgendar")
var mensagem4 = document.getElementById("msg4")
var mensagem5 = document.getElementById("msg5")
var mensagem6 = document.getElementById("msg6")
var mensagem7 = document.getElementById("msg7")
var mensagem8 = document.getElementById("msg8")


function validarCPF(cpf) {
    cpf = cpf.replace(/[^\d]/g, '');

    if (cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) {
        return false;
    }

    var soma = 0;
    var resto;
    for (var i = 1; i <= 9; i++) {
        soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
    }
    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) {
        resto = 0;
    }
    if (resto !== parseInt(cpf.substring(9, 10))) {
        return false;
    }

    soma = 0;
    for (var i = 1; i <= 10; i++) {
        soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
    }
    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) {
        resto = 0;
    }
    if (resto !== parseInt(cpf.substring(10, 11))) {
        return false;
    }

    return true;
}

function validarTelefone(telefone) {
    telefone = telefone.replace(/[^\d]/g, '');
    const valido = telefone.length === 10 || telefone.length === 11;

    return valido;
}

function validarEmail(email) {
    const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    return regex.test(email);
}

function validarHorario(horario) {
    const regexHorario = /^([01]\d|2[0-3]):([0-5]\d)$/;

    if (regexHorario.test(horario)) {
        return true;
    } else {
        return false;
    }
}

//Fetch com GET
async function loginPaciente(strCpf) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            cpf: `${strCpf}`,
        })
    }
    const resposta = await fetch("/login", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function listaPacientes(){
    const resposta = await fetch(`/lista_pacientes`)  
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
                return dados;
        })
        .catch((erro) => {
            return erro;
        })
        return resposta;
}

async function listaMedicos2(){
    const resposta = await fetch(`/lista_medicos`)  
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
                return dados;
        })
        .catch((erro) => {
            return erro;
        })
        return resposta;
}


async function loginMedico(strCrm) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            crm: `${strCrm}`,
        })
    }
    const resposta = await fetch("/login_medico", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function loginAdm(strAdm) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            login: `${strAdm}`,
        })
    }
    const resposta = await fetch("/login_adm", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function listaConsultasMed(strCrm) {
    const resposta = await fetch(`/lista_consultas_med?crm=${strCrm}`)  
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function listaConsultasPaciente(strCpf) {
    const resposta = await fetch(`/lista_consultas_paciente?cpf=${strCpf}`)  
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function removerConsulta(strId) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            id_consulta: `${strId}`,
        })
    }
    const resposta = await fetch("/remove_consultas", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function removerPaciente(strCpf) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            cpf: `${strCpf}`,
        })
    }
    const resposta = await fetch("/remove_paciente", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            alert(JSON.stringify(dados));
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function removerMedico(strCrm) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            crm: `${strCrm}`,
        })
    }
    const resposta = await fetch("/remove_medico", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados;
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function listaMedicamentos2(nome, dosagem) {
    console.log(nome+dosagem);
    const resposta = await fetch(`/lista_medicamentos2?nome=${nome}&dosagem=${dosagem}`, {
        method: "GET"
    })
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {

            return dados
        })
        .catch((erro) => {
            return erro;
        });
    return resposta;
}




//Fetch com POST
function cadastrarPaciente(Cpf, Nome, Email, Cart, Tel, Senha) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            cpf: `${Cpf}`,
            nome: `${Nome}`,
            email: `${Email}`,
            carteirinha_sus: `${Cart}`,
            telefone: `${Tel}`,
            senha: `${Senha}`
        })
    }
    fetch("/cadastra_paciente", dados)
    .then(async (resposta) => {
        if (resposta.status >= 400) {
            throw await resposta.json();
        }
        return resposta.json();
    })
        .then(() => {
            open("/loginpaciente", "_self");
        })
        .catch((erro) => {
            mensagem2.textContent = erro.mensagem;
            console.error(erro);
        })
}

function cadastrarMedico(Crm, Cpf, Nome, Email, Tel, Senha, Especialidade) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            crm: `${Crm}`,
            nome: `${Nome}`,
            email: `${Email}`,
            cpf: `${Cpf}`,
            telefone: `${Tel}`,
            senha: `${Senha}`,
            especialidade: `${Especialidade}`
        })
    }
    fetch("/cadastra_medico", dados)
    .then(async (resposta) => {
        if (resposta.status >= 400) {
            throw await resposta.json();
        }
        return resposta.json();
    })
    .then(() => {
            open("/loginMed", "_self");
    })
    .catch((erro) => {
            mensagem7.textContent = erro.mensagem;
            console.error(erro);
        })
}

function cadastrarMedicamento(nome, marca, qnt, fk_login_adm, dose) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            nome: `${nome}`,
            marca: `${marca}`,
            quantidade: `${qnt}`,
            fk_login_adm: `${fk_login_adm}`,
            dosagem: `${dose}`,
        })
    }
    fetch("/cadastra_medicamento", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            console.log(dados);
        })
        .catch((erro) => {
            console.error(erro);
        })
}


function agendar(horario, desc, data, cpf, crm) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            horario: `${horario}`,
            descricao: `${desc}`,
            data: `${data}`,
            fk_cpf_paciente: `${cpf}`,
            fk_crm_medico: `${crm}`
        })
    }
    fetch("/agenda", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            console.log(dados);
        })
        .catch((erro) => {
            console.error(erro);
        })
}

function editaMedicamento(nome, marca, qnt, dose) {
    const dados = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            nome: `${nome}`,
            marca: `${marca}`,
            quantidade: `${qnt}`,
            dosagem: `${dose}`
        })
    }
    fetch("/edita_medicamento", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            console.log(dados);
        })
        .catch((erro) => {
            console.error(erro);
        })
}

function listaMedicos() {
    const campoMedico = document.getElementById("especialidade");
    fetch("/lista_medicos")
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            if ((campoMedico.length - 1) == dados.length) {
                return
            }
            else {
                for (let i = 0; i < dados.length; i++) {
                    opcao = new Option(`${dados[i].nome_medico} - ${dados[i].especialidade_medico}`, `${dados[i].crm_medico}`)
                    campoMedico.appendChild(opcao);
                }
            }

        })
        .catch((erro) => {
            console.error(erro);
        })
}

function listaHorarios(medico, data) {
    const selectElement = document.getElementById('horario');
    selectElement.innerHTML = '';
    const hrs = [
        '07:00:00', '07:30:00', '08:00:00', '08:30:00', '09:00:00', '09:30:00',
        '10:00:00', '10:30:00', '11:00:00', '11:30:00', '12:00:00', '12:30:00',
        '13:00:00', '13:30:00', '14:00:00', '14:30:00', '15:00:00', '15:30:00',
        '16:00:00', '16:30:00', '17:00:00', '17:30:00', '18:00:00'
    ];
    const now = new Date();
    //hora atual
    const oneHourLater = new Date(now);
    oneHourLater.setHours(now.getHours() + 1);
    const hours = String(oneHourLater.getHours()).padStart(2, '0');
    const minutes = String(oneHourLater.getMinutes()).padStart(2, '0');
    const seconds = String(oneHourLater.getSeconds()).padStart(2, '0');
    const currentTime = `${hours}:${minutes}:${seconds}`;

    //data atual
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const currentDate = `${year}-${month}-${day}`;

    const campoHorarios = document.getElementById("horario");
    fetch(`/lista_horarios?crm=${medico}&data=${data}`)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            if (dados.length == 0) {
                for (let j = 0; j < hrs.length; j++) {
                    if (data > currentDate) {
                        opcao = new Option(`${hrs[j]}`, `${hrs[j]}`)
                        campoHorarios.appendChild(opcao);
                    }
                    else {
                        if (hrs[j] >= currentTime) {
                            opcao = new Option(`${hrs[j]}`, `${hrs[j]}`)
                            campoHorarios.appendChild(opcao);
                        }
                    }
                }
            }
            else{
                for (let i = 0; i < dados.length; i++) {
                    for (let j = 0; j < hrs.length; j++) {
                        if ((hrs[j] >= currentTime || data > currentDate) && dados[i].horario != hrs[j]) {
                        //if ((dados[i].horario != hrs[j] && hrs[j] >= currentTime) || (data > currentDate && dados[i].horario != hrs[j])) {
                            opcao = new Option(`${hrs[j]}`, `${hrs[j]}`)
                            campoHorarios.appendChild(opcao);
                        }
                    }
                }
            }
        })
        .catch((erro) => {
            console.error(erro);
        })
}

async function listaConsultas() {
    const resposta = await fetch("/lista_consultas")
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            return dados
        })
        .catch((erro) => {
            return erro;
        })
    return resposta;
}

async function listaMedicamentos(dados) {
    const resposta = await fetch(`/lista_medicamentos?nomeMedicamento=${dados}`, {
        method: "GET"
    })
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {

            return dados
        })
        .catch((erro) => {
            return erro;
        });
    return resposta;
}

function direcionaHome() {
    if (localStorage.getItem("dadosUsuario") != null) {
        open("/logado", "_self");
    }
    else if (localStorage.getItem("dadosMedico") != null) {
        open("/logadoMed", "_self");
    }
    else{
        open("/","_self")
    }
}

async function cadastraAtualizaFicha(fez_cirurgia, cirurgia, teve_internacao, internacao, toma_remedio, remedio, tem_alergia, alergia,
    fez_tratamento, tratamento, possui_problema_respiratorio, problema_respiratorio, gestante, possui_problema_figado_rin,
    problema_figado_rin, fuma, tem_hepatite, tem_diabetes, possui_problema_cardiaco, problema_cardiaco, tipo_sanguineo, fk_cpf){

        const dados = {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                fez_cirurgia: `${fez_cirurgia}`,
                cirurgia: `${cirurgia}`,
                teve_internacao: `${teve_internacao}`,
                internacao: `${internacao}`,
                toma_remedio: `${toma_remedio}`,
                remedio: `${remedio}`,
                tem_alergia: `${tem_alergia}`,
                alergia: `${alergia}`,
                fez_tratamento: `${fez_tratamento}`,
                tratamento: `${tratamento}`,
                possui_problema_respiratorio: `${possui_problema_respiratorio}`,
                problema_respiratorio: `${problema_respiratorio}`,
                gestante: `${gestante}`,
                possui_problema_figado_rin: `${possui_problema_figado_rin}`,
                problema_figado_rin: `${problema_figado_rin}`,
                fuma: `${fuma}`,
                tem_hepatite: `${tem_hepatite}`,
                tem_diabetes: `${tem_diabetes}`,
                possui_problema_cardiaco: `${possui_problema_cardiaco}`,
                problema_cardiaco: `${problema_cardiaco}`,
                tipo_sanguineo: `${tipo_sanguineo}`,
                fk_cpf: `${fk_cpf}`
            })
        };
    fetch("/upsert_ficha", dados)
        .then((resposta) => {
            return resposta.json();
        })
        .then((dados) => {
            console.log(dados);
            window.location.reload();
        })
        .catch((erro) => {
            console.error(erro);
        })
}

async function preencheFicha(cpf) {
        const resposta = await fetch(`/preenche_Ficha?cpf=${cpf}`, {
            method: "GET"
        })
            .then((resposta) => {
                return resposta.json();
            })
            .then((dados) => {
                return dados
            })
            .catch((erro) => {
                return erro;
            });
        return resposta;
}

async function enviaEmailSenha() {
    const campoEmail = document.querySelector("#email_recuperacao");
    const email = campoEmail.value;

    if (email != "") {
        const dados = {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(
                {
                    email: email
                }
            )
        }
    
        await fetch("/resetSenha", dados)
        .then( (resp) => {
            return resp.json();
        })
        .then( (dados) => {
            console.log(dados);
            alert("Solicitação feita com sucesso!\nSe seu email estiver cadastrado no PlusSUS, você receberá um email para recuperar sua senha!");
            open("/", "_self");
        })
        .catch( (erro) => {
            console.log(erro);
            alert("Email de Recuperação não pôde ser enviado!");
        })
    }
    else {
        alert("Favor preencher o campo de email!");
    }
}

async function atualizaSenha() {
    const campoSenha = document.querySelector("#novaSenha");
    const campoConfirmaSenha = document.querySelector("#confirmaSenha");

    if (campoSenha.value == "" || campoConfirmaSenha.value == "") {
        alert("Favor preencher todos os campos!");
    }
    else if (campoSenha.value != campoConfirmaSenha.value) {
        alert("As senhas inseridas não coincidem!");
    }
    else {
        const dados = JSON.parse(atob(window.location.href.split("?id=")[1]));
        dados.novaSenha = campoSenha.value;
        const dadosRequisicao = {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(dados)
        }
        
        await fetch("/atualizaSenha", dadosRequisicao)
        .then( (resp) => {
            return resp.json();
        })
        .then( (dados) => {
            console.log(dados);
            alert("Senha atualizada com sucesso!");
            open("login.html", "_self");
        })
        .catch( (erro) => {
            alert("Não foi possível atualizar a senha! Contate o administrador para mais detalhes!\nMotivo: " + erro);
        })
    }
}

window.addEventListener("DOMContentLoaded", async () => {
    try {
        const campoMedico = document.getElementById("especialidade")
        campoMedico.addEventListener("click", async () => {
            await listaMedicos();
        })

        //consultas = await listaConsultas();
    }
    catch (erro) {
        console.log(erro)
    }


    try {
        const botaoLoginPaciente = document.querySelector("#botaoLoginPaciente");
        botaoLoginPaciente.addEventListener("click", async () => {
            const campoCpf = document.querySelector("#cpfLoginPaciente");
            const campoSenha = document.querySelector("#senhaLoginPaciente");
            const consulta = await loginPaciente(campoCpf.value);

            if (consulta.length == 0 || consulta[0].senha != campoSenha.value) {
                mensagem.textContent = "Usuário ou senha não encontrados";
                campoCpf.value = ""
                campoSenha.value = ""
            }
            else {
                localStorage.setItem("dadosUsuario", JSON.stringify(consulta));
                open("/logado", "_self")
            }
        })
    }
    catch (erro) {
        console.log(erro);
    }


    try {
        const botaoLoginMedico = document.querySelector("#botaoLoginMedico");
        botaoLoginMedico.addEventListener("click", async () => {
            const campoCrm = document.querySelector("#crmLoginMedico");
            const campoSenha = document.querySelector("#senhaLoginMedico");
            const consultaMed = await loginMedico(campoCrm.value);

            if (consultaMed.length == 0 || consultaMed[0].senha != campoSenha.value) {
                mensagem6.textContent = "Usuário ou senha não encontrados";
                campoCrm.value = ""
                campoSenha.value = ""
            }
            else {
                localStorage.setItem("dadosMedico", JSON.stringify(consultaMed));
                open("/logadoMed", "_self")
            }
        })
    }
    catch (erro) {
        console.log(erro);
    }

    try {
        const botaoLoginAdm = document.querySelector("#botaoLoginAdm");
        botaoLoginAdm.addEventListener("click", async () => {
            const campoAdm = document.querySelector("#LoginAdm");
            const campoSenha = document.querySelector("#senhaLoginAdm");
            const consultaAdm = await loginAdm(campoAdm.value);

            if (consultaAdm.length == 0 || consultaAdm[0].senha != campoSenha.value) {
                mensagem5.textContent = "Usuário ou senha não encontrados";
                campoAdm.value = ""
                campoSenha.value = ""
            }
            else {
                localStorage.setItem("dadosAdm", consultaAdm[0].login);
                open("/admLogado", "_self")
            }
        })
    }
    catch (erro) {
        console.log(erro);
    }


    try {
        const botaoRegistroPaciente = document.getElementById("botaoRegistroPaciente")
        botaoRegistroPaciente.addEventListener("click", async () => {
            if (validarCPF(cadastroCpf.value) && validarTelefone(cadastroTel.value) && validarEmail(cadastroEmail.value)) {
                await cadastrarPaciente(cadastroCpf.value, cadastroNome.value, cadastroEmail.value, cadastroCart.value, cadastroTel.value, cadastroSenha.value)
            } else {
                mensagem2.textContent = "Cpf, telefone ou email inválido"
            }
        })
    }
    catch (erro) {
        console.log(erro);
    }


    try {
        const botaoRegistroMedico = document.getElementById("botaoRegistroMedico")
        botaoRegistroMedico.addEventListener("click", async () => {
            if (validarCPF(cadastroCpfM.value) && validarTelefone(cadastroTelM.value) && validarEmail(cadastroEmailM.value)) {
                await cadastrarMedico(cadastroCrm.value, cadastroCpfM.value, cadastroNomeM.value, cadastroEmailM.value, cadastroTelM.value, cadastroSenhaM.value, selectEspecialidade.value)
                
            } else {
                mensagem7.textContent = "Dados inválido(s)";
            }
        })
    }
    catch (erro) {
        console.log(erro);
    }

    try {
        botaoConsulta = document.getElementById("botaoConsulta");
        especialidade = document.getElementById("especialidade");
        dataAtendimento = document.getElementById("dataAtendimento");
        horaAtendimento = document.getElementById("horario");
        descricao = document.getElementById("descricao");
        botaoConsulta.addEventListener("click", function () {
            dadosPaciente = JSON.parse(localStorage.getItem("dadosUsuario"));

            if (especialidade.value == "" || dataAtendimento.value == "" || horaAtendimento.value == "" || descricao.value == "") {
                mensagem3.textContent = "Favor preencher todos os campos!";
            }
            else {
                agendar(horaAtendimento.value, descricao.value, dataAtendimento.value, dadosPaciente[0].cpf, especialidade.value);
                dataAtendimento.value = ""
                horaAtendimento.value = ""
                especialidade.value = "0"
                descricao.value = ""
                mensagem3.textContent = "Consulta agendada com sucesso!!";
            }
        })
    }
    catch (erro) {
        console.log(erro)
    }

    try {
        let consultas = await listaConsultas();
        var tbodyFila = document.getElementById("tbodyFila");

        for (var i = 0; i < consultas.length; i++) {
            tr = document.createElement("tr");
            tdNome = document.createElement("td")
            tdNome.setAttribute("class", "item")
            tdHorario = document.createElement("td")
            tdHorario.setAttribute("class", "item")
            tdData = document.createElement("td")
            tdData.setAttribute("class", "item")
            tdMedico = document.createElement("td")
            tdMedico.setAttribute("class", "item")
            tdNome.innerText = consultas[i].nome_paciente;
            tdHorario.innerText = consultas[i].horario_consulta;
            tdData.innerText = new Date(consultas[i].data_consulta).toLocaleDateString();
            tdMedico.innerText = consultas[i].nome_medico;
            tr.appendChild(tdNome);
            tr.appendChild(tdHorario);
            tr.appendChild(tdData);
            tr.appendChild(tdMedico);
            tbodyFila.appendChild(tr);
        }
    }
    catch (erro) {
        console.log(erro)
    }

    try {
        var btnMed = document.getElementById("btnMedicamentos")
        var tbodyMed = document.getElementById("tbodyMed");

        btnMed.addEventListener("click", async function () {
            var medicamentos = await listaMedicamentos(document.getElementById("nomeMedicamento").value)

            if (medicamentos.length == 0) {
                mensagem4.textContent = "Medicamento não encontrado"
            }
            else {
                for (var i = 0; i < medicamentos.length; i++) {
                    tr = document.createElement("tr");
                    tdNomeMed = document.createElement("td")
                    tdNomeMed.setAttribute("class", "item")
                    tdMarca = document.createElement("td")
                    tdMarca.setAttribute("class", "item")
                    tdDose = document.createElement("td")
                    tdDose.setAttribute("class", "item")
                    tdQnt = document.createElement("td")
                    tdQnt.setAttribute("class", "item")
                    tdNomeMed.innerText = medicamentos[i].nome;
                    tdMarca.innerText = medicamentos[i].marca;
                    tdDose.innerText = medicamentos[i].dosagem;
                    tdQnt.innerText = medicamentos[i].quantidade;
                    tr.appendChild(tdNomeMed);
                    tr.appendChild(tdMarca);
                    tr.appendChild(tdDose);
                    tr.appendChild(tdQnt);
                    tbodyMed.appendChild(tr);
                }
            }
        })
    }

    catch (erro) {
        console.log(erro)
    }

    try {
        logout = document.getElementById("sair")
        logout.addEventListener("click", function () {
            localStorage.clear();
            open("/", "_self")
        })
    }
    catch (erro) {
        console.log(erro)
    }

    try {
        dadosMedico = JSON.parse(localStorage.getItem("dadosMedico"));
        var nomePerfilMed = document.getElementById("nomePerfilMed")
        var crmPerfilMed = document.getElementById("crmPerfilMed")
        var emailPerfilMed = document.getElementById("emailPerfilMed")
        var telPerfilMed = document.getElementById("telPerfilMed")
        var espPerfilMed = document.getElementById("espPerfilMed")
        nomePerfilMed.textContent = dadosMedico[0].nome
        crmPerfilMed.textContent = dadosMedico[0].crm
        emailPerfilMed.textContent = dadosMedico[0].email
        telPerfilMed.textContent = dadosMedico[0].telefone
        espPerfilMed.textContent = dadosMedico[0].especialidade
    }
    catch(erro) {
        console.log(erro);
    }

    try {
        var tbodyConsultasMed = document.getElementById("tbodyConsultasMed")

        var consultasMed = await listaConsultasMed(dadosMedico[0].crm)

        for (var i = 0; i < consultasMed.length; i++) {
            tr = document.createElement("tr");
            tdNome = document.createElement("td")
            tdNome.setAttribute("class", "item")
            tdSintomas = document.createElement("td")
            tdSintomas.setAttribute("class", "item")
            tdHorario = document.createElement("td")
            tdHorario.setAttribute("class", "item")
            tdData = document.createElement("td")
            tdData.setAttribute("class", "item")
            tdTelefone = document.createElement("td")
            tdTelefone.setAttribute("class", "item")
            tdEmail = document.createElement("td")
            tdEmail.setAttribute("class", "item")
            tdNome.innerText = consultasMed[i].nome_paciente;
            tdSintomas.innerText = consultasMed[i].sintomas_consulta;
            tdHorario.innerText = consultasMed[i].horario_consulta;
            tdData.innerText = new Date(consultasMed[i].data_consulta).toLocaleDateString();
            tdTelefone.innerText = consultasMed[i].telefone_paciente;
            tdEmail.innerText = consultasMed[i].email_paciente;

            tr.appendChild(tdNome);
            tr.appendChild(tdSintomas);
            tr.appendChild(tdHorario);
            tr.appendChild(tdData);
            tr.appendChild(tdTelefone);
            tr.appendChild(tdEmail);
            tbodyConsultasMed.appendChild(tr);
        }
    }
    catch(erro) {
        console.log(erro);
    }
    try{
        dadosUsuario = JSON.parse(localStorage.getItem("dadosUsuario"));
        var nomePerfilPaciente = document.getElementById("nomePerfilPaciente");
        var cpfPerfilPaciente = document.getElementById("cpfPerfilPaciente");
        var emailPerfilPaciente = document.getElementById("emailPerfilPaciente");
        var telPerfilPaciente = document.getElementById("telPerfilPaciente");
        var cartPerfilPaciente = document.getElementById("cartPerfilPaciente");
        nomePerfilPaciente.textContent = dadosUsuario[0].nome;
        cpfPerfilPaciente.textContent = dadosUsuario[0].cpf;
        emailPerfilPaciente.textContent = dadosUsuario[0].email;
        telPerfilPaciente.textContent = dadosUsuario[0].telefone;
        cartPerfilPaciente.textContent = dadosUsuario[0].carteirinha_sus;

        var consultaFicha = await preencheFicha(dadosUsuario[0].cpf);

        var campoFichaCirurgia = document.getElementById("campoFichaCirurgia");
        var campoFichaCirurgia2 = document.getElementById("campoFichaCirurgia2");
        var campoFichaInternacao = document.getElementById("campoFichaInternacao");
        var campoFichaInternacao2 = document.getElementById("campoFichaInternacao2");
        var campoFichaRemedio = document.getElementById("campoFichaRemedio");
        var campoFichaRemedio2 = document.getElementById("campoFichaRemedio2");
        var campoFichaAlergia = document.getElementById("campoFichaAlergia");
        var campoFichaAlergia2 = document.getElementById("campoFichaAlergia2");
        var campoFichaTratamento = document.getElementById("campoFichaTratamento");
        var campoFichaTratamento2 = document.getElementById("campoFichaTratamento2");
        var campoFichaProblemaRespiratorio = document.getElementById("campoFichaProblemaRespiratorio");
        var campoFichaProblemaRespiratorio2 = document.getElementById("campoFichaProblemaRespiratorio2");
        var campoFichaGestante = document.getElementById("campoFichaGestante");
        var campoFichaFigadoRin = document.getElementById("campoFichaFigadoRin");
        var campoFichaFigadoRin2 = document.getElementById("campoFichaFigadoRin2");
        var campoFichaFuma = document.getElementById("campoFichaFuma");
        var campoFichaHepatite = document.getElementById("campoFichaHepatite");
        var campoFichaDiabetes = document.getElementById("campoFichaDiabetes");
        var campoFichaCardiaco = document.getElementById("campoFichaCardiaco");
        var campoFichaCardiaco2 = document.getElementById("campoFichaCardiaco2");
        var campoFichaTipoSanguineo = document.getElementById("campoFichaTipoSanguineo");
        var botaoUpsert = document.getElementById("botaoUpsert");

        if(consultaFicha.length != 0){
            campoFichaCirurgia.value = consultaFicha[0].fez_cirurgia
            campoFichaCirurgia2.value = consultaFicha[0].cirurgia
            campoFichaInternacao.value = consultaFicha[0].teve_internacao
            campoFichaInternacao2.value = consultaFicha[0].internacao
            campoFichaRemedio.value = consultaFicha[0].toma_remedio
            campoFichaRemedio2.value = consultaFicha[0].remedio
            campoFichaAlergia.value = consultaFicha[0].tem_alergia
            campoFichaAlergia2.value = consultaFicha[0].alergia
            campoFichaTratamento.value = consultaFicha[0].fez_tratamento
            campoFichaTratamento2.value = consultaFicha[0].tratamento
            campoFichaProblemaRespiratorio.value = consultaFicha[0].possui_problema_respiratorio
            campoFichaProblemaRespiratorio2.value = consultaFicha[0].problema_respiratorio
            campoFichaGestante.value = consultaFicha[0].gestante
            campoFichaFigadoRin.value = consultaFicha[0].possui_problema_figado_rin
            campoFichaFigadoRin2.value = consultaFicha[0].problema_figado_rin
            campoFichaFuma.value = consultaFicha[0].fuma
            campoFichaHepatite.value = consultaFicha[0].tem_hepatite
            campoFichaDiabetes.value = consultaFicha[0].tem_diabetes
            campoFichaCardiaco.value = consultaFicha[0].possui_problema_cardiaco
            campoFichaCardiaco2.value = consultaFicha[0].problema_cardiaco
            campoFichaTipoSanguineo.value = consultaFicha[0].tipo_sanguineo
        }
        else{
        }

        document.querySelectorAll("div.emvolta select").forEach((e) => {
                try{
                    const idInput = e.id;
                    const valueInput = e.value;
                    const campoEscondido = document.getElementById(idInput + "2");
                    console.log(e.id);
        
                    if (valueInput == "S") {
                        campoEscondido.style.display = "flex";
                    }
                    else {
                        campoEscondido.style.display = "none";
                    }
                }
                catch(erro) {
                    console.log(erro)
                }
            
        });

        document.querySelector("div.emvolta").addEventListener("change", (e) => {
            if (e.target.tagName == "SELECT") {
                try{
                    const idInput = e.target.id;
                    const valueInput = e.target.value;
                    const campoEscondido = document.getElementById(idInput + "2");
                    console.log(e.target.id);
        
                    if (valueInput == "S") {
                        campoEscondido.style.display = "flex";
                    }
                    else {
                        campoEscondido.style.display = "none";
                    }
                }
                catch(erro) {
                    console.log(erro)
                }
            }
        });
    
        botaoUpsert.addEventListener("click", function(){
            const campos = document.querySelectorAll("input:not([style*='display: none']), select:not([style*='display: none'])");
            let camposVazios = campos.length;

            campos.forEach( (campo) => {
                if (campo.value != "") {
                    camposVazios--;
                }
            })

            if (camposVazios > 0) {
                alert("Favor preencher todos os campos!");
            }
            else {
                cadastraAtualizaFicha(campoFichaCirurgia.value, 
                    campoFichaCirurgia2.value, 
                    campoFichaInternacao.value, 
                    campoFichaInternacao2.value, 
                    campoFichaRemedio.value, 
                    campoFichaRemedio2.value, 
                    campoFichaAlergia.value, 
                    campoFichaAlergia2.value, 
                    campoFichaTratamento.value, 
                    campoFichaTratamento2.value, 
                    campoFichaProblemaRespiratorio.value, 
                    campoFichaProblemaRespiratorio2.value, 
                    campoFichaGestante.value, 
                    campoFichaFigadoRin.value, 
                    campoFichaFigadoRin2.value, 
                    campoFichaFuma.value, 
                    campoFichaHepatite.value, 
                    campoFichaDiabetes.value, 
                    campoFichaCardiaco.value, 
                    campoFichaCardiaco2.value,
                    campoFichaTipoSanguineo.value,
                    dadosUsuario[0].cpf)
                    window.location.reload();
            }
        
        })
        
    }
    catch(erro){
        console.log(erro)
    }

    try {
        const botaoCadastraMed = document.getElementById("botaoCadastraMed")
        
        botaoCadastraMed.addEventListener("click", async () => {
            var dadosAdm = localStorage.getItem("dadosAdm")
            var nomeMed = document.getElementById("nomeMed")
            var doseMed = document.getElementById("doseMed")
            var marcaMed = document.getElementById("marcaMed")
            var qntMed = document.getElementById("qntMed")
            var div = document.getElementById("divBotoesMed")
            var lista = await listaMedicamentos2(nomeMed.value, doseMed.value)
            
            if(lista.length == 0){
                await cadastrarMedicamento(nomeMed.value, marcaMed.value, qntMed.value, dadosAdm, doseMed.value)
                window.location.reload();

            }
            else{
                mensagem8.textContent = "Medicamento já cadastrado no sistema. Deseja edita-lo?"
                var botaoEdit = document.createElement("button")
                botaoEdit.setAttribute("type", "button")
                botaoEdit.setAttribute("class", "btnEditMed")
                botaoEdit.setAttribute("id", "nuPeguei")
                botaoEdit.textContent = "Editar"
                var botaoNao = document.createElement("button")
                botaoNao.setAttribute("type","button")
                botaoNao.setAttribute("class","btnNao")
                botaoNao.textContent = "Não"
                div.append(botaoEdit, botaoNao)
                var idbtn = document.getElementById("nuPeguei")
                idbtn.addEventListener("click", function(){
                    editaMedicamento(nomeMed.value, marcaMed.value, qntMed.value, doseMed.value)
                    window.location.reload();
                })
            }
            
        })
    }
    catch (erro) {
        console.log(erro);
    }

    try {
        document.getElementById("searchBarPacientes").addEventListener("keyup", function () {
            const query = this.value.toLowerCase();
            const rows = document.querySelectorAll("#tbodyListaPacientes tr");
          
            rows.forEach((row) => {
              const cells = row.querySelectorAll("td");
              const matches = Array.from(cells).some((cell) =>
                cell.textContent.toLowerCase().includes(query)
              );
              row.style.display = matches ? "" : "none";
            });
          });

        var tbodyListaPacientes = document.getElementById("tbodyListaPacientes")

        var lista = await listaPacientes();
        for (var i = 0; i < lista.length; i++) {
            
            tr = document.createElement("tr");
            tdCpf = document.createElement("td");
            tdCpf.setAttribute("class", "item");
            tdNome = document.createElement("td");
            tdNome.setAttribute("class", "item");
            tdEmail = document.createElement("td");
            tdEmail.setAttribute("class", "item");
            tdCarteirinha = document.createElement("td");
            tdCarteirinha.setAttribute("class", "item");
            tdTelefone = document.createElement("td");
            tdTelefone.setAttribute("class", "item");
            tdOpc = document.createElement("td");
            tdOpc.setAttribute("class", "item");
            
            btnRemoverPaciente = document.createElement("button");
            btnRemoverPaciente.setAttribute("type", "button");
            btnRemoverPaciente.setAttribute("id", lista[i].cpf_paciente);
            btnRemoverPaciente.setAttribute("onclick", `removerPaciente("${lista[i].cpf_paciente}");window.location.reload();`);
            
            tdCpf.innerText = lista[i].cpf_paciente;
            tdNome.innerText = lista[i].nome_paciente;
            tdEmail.innerText = lista[i].email_paciente;
            tdCarteirinha.innerText = lista[i].carteirinha_paciente;
            tdTelefone.innerText = lista[i].telefone_paciente;
            btnRemoverPaciente.textContent = "Excluir";
    
            tdOpc.append(btnRemoverPaciente)
            tr.appendChild(tdCpf);
            tr.appendChild(tdNome);
            tr.appendChild(tdEmail);
            tr.appendChild(tdCarteirinha);
            tr.appendChild(tdTelefone);
            tr.appendChild(tdOpc);
            tbodyListaPacientes.appendChild(tr);
        }
    }
    catch(erro) {
        console.log(erro);
    }

    try {
        document.querySelector("#doseMed").addEventListener("input", () => {
            const campoDosagem = document.querySelector("#doseMed");
            campoDosagem.value = (campoDosagem.value).replace(/[^\d]/gi, "");
        })
    
        document.querySelector("#qntMed").addEventListener("input", () => {
            const campoDosagem = document.querySelector("#qntMed");
            campoDosagem.value = (campoDosagem.value).replace(/[^\d]/gi, "");
        })
    }
    catch(erro) {
        console.log(erro);
    }

    try {
        if (localStorage.getItem("dadosAdm") != null && window.location.pathname == "/fila.html") {
            const barraNav = document.querySelector("#navbarCollapse > div.navbar-nav.ms-auto.p-4.p-lg-0");
            const opcoes = barraNav.querySelectorAll("a");

            opcoes.forEach( (opcao) => {
                if (opcao.innerText.toUpperCase() != "FILA DE ATENDIMENTO") {
                    opcao.remove();
                }
            })
            barraNav.innerHTML += `<a href="timelineADM.html" class="nav-item nav-link">Cadastro de Medicamentos</a>`
            barraNav.innerHTML += `<a href="listaPacientes.html" class="nav-item nav-link">Lista de Pacientes</a>`
            barraNav.innerHTML += `<a href="listaMedicos.html" class="nav-item nav-link">Lista de Médicos</a>`
        }
    }
    catch(erro) {
        console.log(erro);
    }  
    
    try {
        var tbodyConsultasPaciente = document.getElementById("tbodyConsultasPaciente")

        var consultasPaciente = await listaConsultasPaciente(dadosUsuario[0].cpf)

        for (var i = 0; i < consultasPaciente.length; i++) {
            tr = document.createElement("tr");
            tr.setAttribute("class", "linhaTabelaConsultasPaciente")
            tdSintomas = document.createElement("td")
            tdSintomas.setAttribute("class", "item itemTabelaConsultasPaciente")
            tdHorario = document.createElement("td")
            tdHorario.setAttribute("class", "item itemTabelaConsultasPaciente")
            tdData = document.createElement("td")
            tdData.setAttribute("class", "item itemTabelaConsultasPaciente")
            tdMedico = document.createElement("td" )
            tdMedico.setAttribute("class", "item itemTabelaConsultasPaciente")
            tdOpc = document.createElement("td")
            tdOpc.setAttribute("class", "item itemTabelaConsultasPaciente")
            btnRemover = document.createElement("button");
            btnRemover.setAttribute("type", "button")
            btnRemover.setAttribute("id", consultasPaciente[i].id_consulta)
            btnRemover.setAttribute("onclick", `removerConsulta(${btnRemover.id}); window.location.reload();`);
            tdSintomas.innerText = consultasPaciente[i].sintomas_consulta;
            tdHorario.innerText = consultasPaciente[i].horario_consulta;
            tdData.innerText = new Date(consultasPaciente[i].data_consulta).toLocaleDateString();
            tdMedico.innerText = consultasPaciente[i].nome_medico;
            btnRemover.textContent = "Excluir"

            tdOpc.append(btnRemover)
            tr.appendChild(tdSintomas);
            tr.appendChild(tdHorario);
            tr.appendChild(tdData);
            tr.appendChild(tdMedico);
            tr.appendChild(tdOpc);
            tbodyConsultasPaciente.appendChild(tr);
        }
    }
    catch(erro) {
        console.log(erro);
    }

    try {
        document.getElementById("searchBar").addEventListener("keyup", function () {
            const query = this.value.toLowerCase();
            const rows = document.querySelectorAll("#tbodyListaMedicos tr");
          
            rows.forEach((row) => {
              const cells = row.querySelectorAll("td");
              const matches = Array.from(cells).some((cell) =>
                cell.textContent.toLowerCase().includes(query)
              );
              row.style.display = matches ? "" : "none";
            });
          });
        
        var tbodyListaMedicos = document.getElementById("tbodyListaMedicos")

        var lista2 = await listaMedicos2();

        for (var i = 0; i < lista2.length; i++) {
            tr = document.createElement("tr");
            tdCrm = document.createElement("td");
            tdCrm.setAttribute("class", "item");
            tdNome = document.createElement("td");
            tdNome.setAttribute("class", "item");
            tdEmail = document.createElement("td");
            tdEmail.setAttribute("class", "item");
            tdCpf = document.createElement("td");
            tdCpf.setAttribute("class", "item");
            tdTelefone = document.createElement("td");
            tdTelefone.setAttribute("class", "item");
            tdEsp = document.createElement("td");
            tdEsp.setAttribute("class", "item");
            tdOpc = document.createElement("td");
            tdOpc.setAttribute("class", "item");
            
            btnRemoverMedico = document.createElement("button");
            btnRemoverMedico.setAttribute("type", "button");
            btnRemoverMedico.setAttribute("id", lista2[i].crm_medico);
            btnRemoverMedico.setAttribute("onclick", `removerMedico('${lista2[i].crm_medico}');window.location.reload();`);
            
            tdCrm.innerText = lista2[i].crm_medico;
            tdNome.innerText = lista2[i].nome_medico;
            tdEmail.innerText = lista2[i].email_medico;
            tdCpf.innerText = lista2[i].cpf_medico;
            tdTelefone.innerText = lista2[i].telefone_medico;
            tdEsp.innerText = lista2[i].especialidade_medico
            btnRemoverMedico.textContent = "Excluir";
    
            tdOpc.append(btnRemoverMedico)
            tr.appendChild(tdCrm);
            tr.appendChild(tdNome);
            tr.appendChild(tdEmail);
            tr.appendChild(tdCpf);
            tr.appendChild(tdTelefone);
            tr.appendChild(tdEsp);
            tr.appendChild(tdOpc);
            tbodyListaMedicos.appendChild(tr);
        }
    }
    catch(erro) {
        console.log(erro);
    }
})



/*foto*/
function mudarFoto() {
    const novaFoto = "caminho/imagem.jpg"; // Caminho da nova imagem
    document.getElementById("fotoPerfil").style.backgroundImage = `url(${novaFoto})`;
}