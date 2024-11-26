import 'package:aplicativomobile/contato.dart';
import 'package:aplicativomobile/fila.dart';
import 'package:aplicativomobile/inicio.dart';
import 'package:aplicativomobile/perfil.dart';
import 'package:aplicativomobile/servi%C3%A7os.dart';
import 'package:aplicativomobile/sobrenos.dart';
import 'package:flutter/material.dart';

class Medicamentos extends StatelessWidget {
  const Medicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de Medicamentos',
      theme: ThemeData(
        primaryColor: const Color(0xFF13570e),
      ),
      home: const MedicamentosPage(),
      debugShowCheckedModeBanner: false, // Remover a barra de debug
    );
  }
}

class MedicamentosPage extends StatefulWidget {
  const MedicamentosPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MedicamentosPage> {
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
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Consulta de Medicamentos',
          style: TextStyle(color: Colors.white), // Cor do texto da AppBar
        ),
        backgroundColor: Color(0xFF13570e),
        actions: [
          IconButton(
            icon: const Icon(Icons.person,
                color: Colors.white), // Cor do ícone da AppBar
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
        backgroundColor: Color(0xFF13570e), // Cor do fundo do Drawer
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF13570e),
              ),
              child: Image.asset('assets/thumbnail_logo.png', width: 200),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyApp(), // Substitua "Fila" pela sua página
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Sobre',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SobreNos()));
              },
            ),
            ListTile(
              title: const Text(
                'Serviços',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Servicos()));
              },
            ),
            ListTile(
              title: const Text(
                'Contate-nos',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Contato(), // Substitua "Fila" pela sua página
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Fila de Atendimento',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Fila(), // Substitua "Fila" pela sua página
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Medicamentos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 3, 6, 3), // Cor verde para o título
              ),
            ),
            const SizedBox(height: 10),
            const Text('Consulte seus medicamentos'),
            const SizedBox(height: 20),
            TextField(
              controller: _medicamentoController,
              decoration: const InputDecoration(
                labelText: 'Nome do Medicamento',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _consultarMedicamento,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF13570e),
              ),
              child: const Row(
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
            const SizedBox(height: 30),
            _resultados.isNotEmpty
                ? _resultados[0]['Marca'] == 'Não encontrada'
                    ? const Text(
                        'Medicamento não encontrado',
                        style: TextStyle(
                          color: Colors.black, // Cor preta para o texto de erro
                          fontSize: 18,
                        ),
                      )
                    : DataTable(
                        columns: const [
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
