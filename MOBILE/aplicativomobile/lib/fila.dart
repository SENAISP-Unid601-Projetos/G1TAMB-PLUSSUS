import 'package:aplicativomobile/perfil.dart';
import 'package:aplicativomobile/servi%C3%A7os.dart';
import 'package:aplicativomobile/sobrenos.dart';
import 'package:flutter/material.dart';
import 'inicio.dart';
import 'medicamentos.dart';

class Fila extends StatelessWidget {
  const Fila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUS App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FilaAtendimento(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FilaAtendimento extends StatelessWidget {
  const FilaAtendimento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF13570E), // Cor similar ao fundo da navbar
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Image.asset('thumbnail_logo.png',
                width: 150, height: 80), // Logo do app
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Perfil(), // Substitua "Fila" pela sua página
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF13570E)),
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 100, color: Colors.white),
                  Text('Nome do Usuário',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyApp(), // Substitua "Fila" pela sua página
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SobreNos()));
              },
            ),
            ListTile(
              title: const Text('Serviços'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Servicos()));
              },
            ),
            ListTile(
              title: const Text('Medicamentos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Medicamentos()));
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyApp(), // Substitua "Fila" pela sua página
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fila de Atendimento',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF13570E),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: const Row(
                children: [
                  Icon(Icons.people, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Fila de Pacientes',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Horário')),
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Médico')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Paciente 1')),
                    DataCell(Text('10:00')),
                    DataCell(Text('12/11/2024')),
                    DataCell(Text('Dr. Silva')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Paciente 2')),
                    DataCell(Text('10:30')),
                    DataCell(Text('12/11/2024')),
                    DataCell(Text('Dr. Costa')),
                  ]),
                  // Adicionar mais linhas conforme necessário
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF13570E),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© +SUS All Right Reserved.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
