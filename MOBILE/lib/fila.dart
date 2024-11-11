import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUS App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF13570E), // Cor similar ao fundo da navbar
        title: Row(
          children: [
            Image.asset('thumbnail_logo.png',
                width: 150, height: 80), // Logo do app
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Ação para abrir o menu de usuário
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
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
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sobre'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Serviços'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Medicamentos'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Fila de Atendimento'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sair'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fila de Atendimento',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF13570E),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
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
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Horário')),
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Médico')),
                ],
                rows: [
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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF13570E),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
