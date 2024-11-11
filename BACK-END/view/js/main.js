
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

// function validarCrm(crm) {
//     crm = crm.trim();
//     const regexCRM = /^[0-9]{4,6}[A-Z]{2}$/i;

//     if (!regexCRM.test(crm)) {
//         return false;
//     }
//     return true;
// }


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
                    opcao = new Option(`${dados[i].nome} - ${dados[i].especialidade}`, `${dados[i].crm}`)
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
            else {
                for (let i = 0; i < dados.length; i++) {
                    for (let j = 0; j < hrs.length; j++) {
                        if (dados[i].horario != hrs[j] && hrs[j] >= currentTime) {
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
            console.log(dados);
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

window.addEventListener("DOMContentLoaded", async () => {
    let consultas;

    try {
        const campoMedico = document.getElementById("especialidade")
        campoMedico.addEventListener("click", async () => {
            await listaMedicos();
        })

        consultas = await listaConsultas();
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
                open("/loginpaciente", "_self")
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
                open("/loginMed", "_self")
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
        var tbody = document.querySelector("tbody:not(#tbodyMed)")

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
            tbody.appendChild(tr);
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
})

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
            mensagem8.textContent = "Medicamento adicionado"
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
                nomeMed.value = ""
                doseMed.value = ""
                marcaMed.value = ""
                qntMed.value = ""
            })
        }
        
    })
}
catch (erro) {
    console.log(erro);
}

try{
    
    dadosUsuario = JSON.parse(localStorage.getItem("dadosUsuario"));
    var nomePerfilPaciente = document.getElementById("nomePerfilPaciente")
    var cpfPerfilPaciente = document.getElementById("cpfPerfilPaciente")
    var emailPerfilPaciente = document.getElementById("emailPerfilPaciente")
    var telPerfilPaciente = document.getElementById("telPerfilPaciente")
    var cartPerfilPaciente = document.getElementById("cartPerfilPaciente")
    nomePerfilPaciente.textContent = dadosUsuario[0].nome
    cpfPerfilPaciente.textContent = dadosUsuario[0].cpf
    emailPerfilPaciente.textContent = dadosUsuario[0].email
    telPerfilPaciente.textContent = dadosUsuario[0].telefone
    cartPerfilPaciente.textContent = dadosUsuario[0].carteirinha_sus

    var consultaFicha = preencheFicha(dadosUsuario[0].cpf)

    

    document.querySelector("div.emvolta").addEventListener("change", (e) => {
        if (e.target.tagName == "SELECT") {
            try{
                const idInput = e.target.id;
                const valueInput = e.target.value;
                const campoEscondido = document.getElementById(idInput + "2");
                console.log(e.target.id);
    
                if (valueInput == "S") {
                    campoEscondido.style.display = "";
                }
                else {
                    campoEscondido.style.display = "none";
                }
            }
            catch(erro) {

            }
        }
    });

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
    var botaoUpsert = document.getElementById("botaoUpsert")

        campoFichaCirurgia.value = consultaFicha.fe
        campoFichaCirurgia2.value =
        campoFichaInternacao.value =
        campoFichaInternacao2.value =
        campoFichaRemedio.value = 
        campoFichaRemedio2.value = 
        campoFichaAlergia.value = 
        campoFichaAlergia2.value = 
        campoFichaTratamento.value = 
        campoFichaTratamento2.value = 
        campoFichaProblemaRespiratorio.value = 
        campoFichaProblemaRespiratorio2.value = 
        campoFichaGestante.value = 
        campoFichaFigadoRin.value = 
        campoFichaFigadoRin2.value = 
        campoFichaFuma.value = 
        campoFichaHepatite.value = 
        campoFichaDiabetes.value = 
        campoFichaCardiaco.value = 
        campoFichaCardiaco2.value =
        campoFichaTipoSanguineo.value = 

    botaoUpsert.addEventListener("click", function(){
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
    
    })
    
}
catch(erro){
    console.log(erro)
}


/*foto*/
function mudarFoto() {
    const novaFoto = "caminho/imagem.jpg"; // Caminho da nova imagem
    document.getElementById("fotoPerfil").style.backgroundImage = `url(${novaFoto})`;
}