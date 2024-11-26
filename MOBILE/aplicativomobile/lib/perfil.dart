import 'package:aplicativomobile/agendamento.dart';
import 'package:aplicativomobile/contato.dart';
import 'package:aplicativomobile/fichamedica.dart';
import 'package:aplicativomobile/fila.dart';
import 'package:aplicativomobile/inicio.dart';
import 'package:aplicativomobile/medicamentos.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF13570E), // Cor verde substituída
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MyApp(), // Substitua "Fila" pela sua página
              ),
            ); // Volta para a tela anterior
          },
        ),
      ),
      body: Column(
        children: [
          // Cabeçalho do Perfil ajustado para ficar mais próximo do topo e alinhado
          Container(
            color: const Color(0xFF13570E),
            padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                bottom: 10), // Reduz o padding vertical para aproximar do topo
            alignment: Alignment.centerLeft, // Alinha o conteúdo à esquerda
            child: const Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinha os itens no topo
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: Color(0xFF13570E)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nome do Usuário",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "ID Cartão: 123456789",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Grade de Opções
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildOptionCard(context, Icons.home, "Início"),
                _buildOptionCard(context, Icons.local_hospital, "Agendamento"),
                _buildOptionCard(
                    context, Icons.medical_services, "Medicamentos"),
                _buildOptionCard(context, Icons.people, "Fila de espera"),
                _buildOptionCard(context, Icons.support, "Contate-nos"),
                _buildOptionCard(
                    context, Icons.medical_information, "Ficha Médica"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir o Card de cada opção
  Widget _buildOptionCard(BuildContext context, IconData icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          if (label == "Início") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          } else if (label == "Agendamento") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Agendamento()),
            );
          } else if (label == "Medicamentos") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Medicamentos()),
            );
          } else if (label == "Fila de espera") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Fila()),
            );
          } else if (label == "Contate-nos") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Contato()),
            );
          } else if (label == "Ficha Médica") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FichaMedica()),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: const Color(0xFF13570E)),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
