import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de Medicamentos',
      theme: ThemeData(
        primaryColor: Color(0xFF13570e),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Remover a barra de debug
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _medicamentoController = TextEditingController();
  List<Map<String, String>> _resultados = [];

  // Simulação de uma pequena base de dados de medicamentos
  final List<Map<String, String>> _medicamentosData = [
    {
      'Nome': 'Ibuprofeno',
      'Marca': 'Genérico',
      'Dosagem': '200mg',
      'Quantidade': '20',
    },
    {
      'Nome': 'Paracetamol',
      'Marca': 'Tylenol',
      'Dosagem': '500mg',
      'Quantidade': '30',
    },
    {
      'Nome': 'Amoxicilina',
      'Marca': 'Genérico',
      'Dosagem': '500mg',
      'Quantidade': '15',
    },
    {
      'Nome': 'Aspirina',
      'Marca': 'Bayer',
      'Dosagem': '100mg',
      'Quantidade': '10',
    },
    // Adicione mais medicamentos conforme necessário
  ];

  void _consultarMedicamento() {
    String nomeMedicamento = _medicamentoController.text.toLowerCase();
    setState(() {
      _resultados = _medicamentosData
          .where((medicamento) =>
              medicamento['Nome']!.toLowerCase() == nomeMedicamento)
          .toList();

      // Se nenhum medicamento for encontrado, adiciona uma mensagem de "não encontrado"
      if (_resultados.isEmpty) {
        _resultados = [
          {
            'Nome': nomeMedicamento,
            'Marca': 'Não encontrada',
            'Dosagem': 'Não encontrada',
            'Quantidade': 'Não encontrada',
          },
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consulta de Medicamentos',
          style: TextStyle(color: Colors.white), // Cor do texto da AppBar
        ),
        backgroundColor: Color(0xFF13570e),
        actions: [
          IconButton(
            icon: Icon(Icons.person,
                color: Colors.white), // Cor do ícone da AppBar
            onPressed: () {
              // Implementar ação do ícone de perfil
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF13570e), // Cor do fundo do Drawer
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF13570e),
              ),
              child: Image.asset('assets/logo.png', width: 200),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Sobre',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Serviços',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Contate-nos',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Medicamentos',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Fila de Atendimento',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Medicamentos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 3, 6, 3), // Cor verde para o título
              ),
            ),
            SizedBox(height: 10),
            Text('Consulte seus medicamentos'),
            SizedBox(height: 20),
            TextField(
              controller: _medicamentoController,
              decoration: InputDecoration(
                labelText: 'Nome do Medicamento',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _consultarMedicamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF13570e),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Consultar',
                    style:
                        TextStyle(color: Colors.white), // Cor do texto do botão
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white, // Cor do ícone do botão
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _resultados.isNotEmpty
                ? _resultados[0]['Marca'] == 'Não encontrada'
                    ? Text(
                        'Medicamento não encontrado',
                        style: TextStyle(
                          color: Colors.black, // Cor preta para o texto de erro
                          fontSize: 18,
                        ),
                      )
                    : DataTable(
                        columns: [
                          DataColumn(label: Text('Nome')),
                          DataColumn(label: Text('Marca')),
                          DataColumn(label: Text('Dosagem')),
                          DataColumn(label: Text('Quantidade')),
                        ],
                        rows: _resultados
                            .map((medicamento) => DataRow(cells: [
                                  DataCell(Text(medicamento['Nome']!)),
                                  DataCell(Text(medicamento['Marca']!)),
                                  DataCell(Text(medicamento['Dosagem']!)),
                                  DataCell(Text(medicamento['Quantidade']!)),
                                ]))
                            .toList(),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }
}
