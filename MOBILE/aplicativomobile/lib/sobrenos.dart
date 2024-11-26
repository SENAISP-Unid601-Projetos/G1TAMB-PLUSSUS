import 'package:aplicativomobile/cadastro.dart';
import 'package:aplicativomobile/inicio.dart';
import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget {
  const SobreNos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo SUS',
      debugShowCheckedModeBanner: false, // Removendo o botão de debug
      theme: ThemeData(
        primaryColor: Color(0xFF13570e),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFF13570e), // Fundo verde para toda a tela
        body: SobreNosPage(),
      ),
    );
  }
}

class SobreNosPage extends StatelessWidget {
  const SobreNosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Seção Sobre
          Container(
            padding: const EdgeInsets.all(20),
            color: Color(0xFF13570e), // Fundo verde
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre o SUS',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white), // Texto branco
                ),
                SizedBox(height: 10),
                Text(
                  'O Sistema Único de Saúde (SUS) é o maior sistema público de saúde do mundo, atendendo milhões de brasileiros de forma gratuita. O site oficial do SUS é uma plataforma essencial que visa facilitar o acesso a informações, serviços e recursos de saúde para a população. Ele pode beneficiar os cidadãos brasileiros.',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white), // Texto branco
                ),
                SizedBox(height: 20),
                buildFeatureRow(Icons.check_circle_outline,
                    "Facilitar o acesso dos pacientes"),
                buildFeatureRow(
                    Icons.check_circle_outline, "Agendamento Online"),
                buildFeatureRow(Icons.check_circle_outline, "Receitas Online"),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Cadastro(), // Substitua "Fila" pela sua página
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF13570e), // Botão verde
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text("Cadastre-se",
                      style: TextStyle(color: Colors.white)), // Texto branco
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyApp(), // Substitua "Fila" pela sua página
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF13570e), // Botão verde
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: Text("Inicio",
                      style: TextStyle(color: Colors.white)), // Texto branco
                ),
              ],
            ),
          ),

          // Seção Serviços Principais
          Container(
            color: Colors.white, // Fundo branco
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Serviços Principais",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF13570e),
                      fontWeight: FontWeight.bold), // Texto verde
                ),
                SizedBox(height: 10),
                Text(
                  "Nosso objetivo é fornecer um ponto de acesso centralizado a informações sobre saúde pública, programas de prevenção e promoção da saúde, além de oferecer serviços online para os cidadãos.",
                  style: TextStyle(
                      fontSize: 16, color: Color(0xFF13570e)), // Texto verde
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildServiceCard(Icons.person, "Experiências", "Doutores"),
                    buildServiceCard(Icons.verified, "Qualidade", "Serviços"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildServiceCard(
                        Icons.medical_services, "Positiva", "Consultas"),
                    buildServiceCard(
                        Icons.support_agent, "24 Horas", "Suporte"),
                  ],
                ),
              ],
            ),
          ),

          // Seção Funcionalidades
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Funcionalidades",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF13570e)), // Texto verde
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    buildFunctionalityCard("Agendamento de Consultas",
                        "Os cidadãos podem verificar a disponibilidade de médicos e agendar consultas de forma prática e rápida, evitando filas e deslocamentos desnecessários."),
                    buildFunctionalityCard("Acesso ao Histórico de Saúde",
                        "Uma das funcionalidades mais importantes é o acesso ao histórico de saúde. Pacientes podem visualizar exames realizados, consultas anteriores, prescrições e tratamentos, centralizando essas informações em um só lugar."),
                    buildFunctionalityCard("Consulta de Unidades de Saúde",
                        "Podem localizar facilmente unidades de saúde, como hospitais, postos de saúde e clínicas, em sua região. O sistema oferece um mapa interativo com informações detalhadas sobre cada unidade, incluindo endereço, especialidades e horários de atendimento."),
                    buildFunctionalityCard("Vacinação e Campanhas de Saúde",
                        "Disponibiliza um calendário atualizado de vacinação e campanhas de saúde, além de oferecer lembretes personalizados para que o cidadão não perca as datas de vacinação ou de consultas preventivas."),
                  ],
                ),
              ],
            ),
          ),

          // Footer
          Container(
            color: Color(0xFF13570e), // Fundo verde
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contato",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold), // Texto branco
                ),
                Text(
                  "Endereço: Rua Principal, 123, Cidade - Estado",
                  style: TextStyle(color: Colors.white), // Texto branco
                ),
                Text(
                  "Telefone: (11) 1234-5678",
                  style: TextStyle(color: Colors.white), // Texto branco
                ),
                Text(
                  "E-mail: contato@sus.com.br",
                  style: TextStyle(color: Colors.white), // Texto branco
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white), // Ícone branco
        SizedBox(width: 10),
        Text(text,
            style:
                TextStyle(fontSize: 16, color: Colors.white)), // Texto branco
      ],
    );
  }

  Widget buildServiceCard(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Card(
        color: Colors.white, // Fundo branco para o cartão
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: Color(0xFF13570e), size: 30), // Ícone verde
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF13570e)), // Texto verde
              ),
              Text(subtitle,
                  style: TextStyle(color: Color(0xFF13570e))), // Texto verde
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFunctionalityCard(String title, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white, // Fundo branco para o cartão
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF13570e)), // Texto verde
        ),
        subtitle: Text(description,
            style: TextStyle(color: Color(0xFF13570e))), // Texto verde
      ),
    );
  }
}
