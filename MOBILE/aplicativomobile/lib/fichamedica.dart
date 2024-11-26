import 'package:aplicativomobile/inicio.dart';
import 'package:flutter/material.dart';

class FichaMedica extends StatelessWidget {
  const FichaMedica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativo Médico',
      theme: ThemeData(
        primaryColor: const Color(0xFF13570E), // Cor verde
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF13570E)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF13570E), // Cor do texto do botão
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ),
      home: const MedicalFormScreen(),
    );
  }
}

class MedicalFormScreen extends StatefulWidget {
  const MedicalFormScreen({super.key});

  @override
  _MedicalFormScreenState createState() => _MedicalFormScreenState();
}

class _MedicalFormScreenState extends State<MedicalFormScreen> {
  final TextEditingController _cirurgiaController = TextEditingController();
  final TextEditingController _internacaoController = TextEditingController();
  final TextEditingController _remedioController = TextEditingController();
  final TextEditingController _alergiaController = TextEditingController();
  final TextEditingController _tratamentoController = TextEditingController();
  final TextEditingController _problemaRespController = TextEditingController();
  final TextEditingController _problemaFigadoRinController =
      TextEditingController();
  final TextEditingController _problemaCardiacoController =
      TextEditingController();
  final TextEditingController _tipoSanguineoController =
      TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  bool fezCirurgia = false;
  bool teveInternacao = false;
  bool tomaRemedio = false;
  bool temAlergia = false;
  bool fezTratamento = false;
  bool possuiProblemaRespiratorio = false;
  bool gestante = false;
  bool possuiProblemaFigadoRin = false;
  bool fuma = false;
  bool temHepatite = false;
  bool temDiabetes = false;
  bool possuiProblemaCardiaco = false;

  void _saveData() {
    final dados = {
      'fez_cirurgia': fezCirurgia,
      'cirurgia': _cirurgiaController.text,
      'teve_internacao': teveInternacao,
      'internacao': _internacaoController.text,
      'toma_remedio': tomaRemedio,
      'remedio': _remedioController.text,
      'tem_alergia': temAlergia,
      'alergia': _alergiaController.text,
      'fez_tratamento': fezTratamento,
      'tratamento': _tratamentoController.text,
      'possui_problema_respiratorio': possuiProblemaRespiratorio,
      'problema_respiratorio': _problemaRespController.text,
      'gestante': gestante,
      'possui_problema_figado_rin': possuiProblemaFigadoRin,
      'problema_figado_rin': _problemaFigadoRinController.text,
      'fuma': fuma,
      'tem_hepatite': temHepatite,
      'tem_diabetes': temDiabetes,
      'possui_problema_cardiaco': possuiProblemaCardiaco,
      'problema_cardiaco': _problemaCardiacoController.text,
      'tipo_sanguineo': _tipoSanguineoController.text,
      'fk_cpf': _cpfController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Ficha Médica', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF13570E),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo CPF
            TextField(
              controller: _cpfController,
              decoration: const InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Fez Cirurgia Switch
            SwitchListTile(
              title: const Text('Fez Cirurgia',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: fezCirurgia,
              onChanged: (val) => setState(() => fezCirurgia = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _cirurgiaController,
              decoration: const InputDecoration(
                labelText: 'Descrição da Cirurgia',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Teve Internação Switch
            SwitchListTile(
              title: const Text('Teve Internação',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: teveInternacao,
              onChanged: (val) => setState(() => teveInternacao = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Internação
            TextField(
              controller: _internacaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição da Internação',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Toma Remédio Switch
            SwitchListTile(
              title: const Text('Toma Remédio',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: tomaRemedio,
              onChanged: (val) => setState(() => tomaRemedio = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição do Remédio
            TextField(
              controller: _remedioController,
              decoration: const InputDecoration(
                labelText: 'Descrição do Remédio',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            //INICIO
            SwitchListTile(
              title: const Text('Tem alergia?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: temAlergia,
              onChanged: (val) => setState(() => temAlergia = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _alergiaController,
              decoration: const InputDecoration(
                labelText: 'Quais alergias?',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            //FIM
            SwitchListTile(
              title: const Text('Faz tratamento?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: fezTratamento,
              onChanged: (val) => setState(() => fezTratamento = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _tratamentoController,
              decoration: const InputDecoration(
                labelText: 'Qual tratamento?',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            //INICIO
            SwitchListTile(
              title: const Text('Possui problemas respiratórios?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: possuiProblemaRespiratorio,
              onChanged: (val) =>
                  setState(() => possuiProblemaRespiratorio = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _problemaRespController,
              decoration: const InputDecoration(
                labelText: 'Quais Problemas?',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('É gestante?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: gestante,
              onChanged: (val) => setState(() => gestante = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('Problemas no rin ou fígado?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: possuiProblemaFigadoRin,
              onChanged: (val) => setState(() => possuiProblemaFigadoRin = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _problemaFigadoRinController,
              decoration: const InputDecoration(
                labelText: 'Quais problemas?',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('Voce fuma?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: fuma,
              onChanged: (val) => setState(() => fuma = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('Tem hepatite?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: temHepatite,
              onChanged: (val) => setState(() => temHepatite = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),

            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('Tem diabetes?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: temDiabetes,
              onChanged: (val) => setState(() => temDiabetes = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            //FIM

            //INICIO
            SwitchListTile(
              title: const Text('Algum problema cardíaco?',
                  style: TextStyle(color: Color(0xFF13570E))),
              value: possuiProblemaCardiaco,
              onChanged: (val) => setState(() => possuiProblemaCardiaco = val),
              activeColor: const Color(0xFF13570E),
              inactiveThumbColor: Colors.grey, // Cor do thumb desativado
              inactiveTrackColor: Colors.grey[400], // Cor da faixa desativada
            ),
            // Descrição da Cirurgia
            TextField(
              controller: _problemaCardiacoController,
              decoration: const InputDecoration(
                labelText: 'Qual problema?',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            //FIM
            //INICIO
            // Descrição da Cirurgia
            TextField(
              controller: _tipoSanguineoController,
              decoration: const InputDecoration(
                labelText: 'Tipo Sanguíneo',
                labelStyle: TextStyle(color: Color(0xFF13570E)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF13570E)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            //FIM

            // Botão de Salvar
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Salvar Ficha Médica'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cirurgiaController.dispose();
    _internacaoController.dispose();
    _remedioController.dispose();
    _alergiaController.dispose();
    _tratamentoController.dispose();
    _problemaRespController.dispose();
    _problemaFigadoRinController.dispose();
    _problemaCardiacoController.dispose();
    _tipoSanguineoController.dispose();
    _cpfController.dispose();
    super.dispose();
  }
}
