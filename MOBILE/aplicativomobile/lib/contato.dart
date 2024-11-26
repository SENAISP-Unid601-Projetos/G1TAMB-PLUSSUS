import 'package:aplicativomobile/inicio.dart';
import 'package:flutter/material.dart';

class Contato extends StatelessWidget {
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ContatoPage(),
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/thumbnail_logo.png',
              height: 50), // Insira o caminho da sua logo
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF13570e),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MyApp(), // Substitua "Fila" pela sua página
              ),
            ); // Volta para a tela anterior
          },
        ), // Cor verde definida
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centraliza o título na coluna
          children: [
            Center(
              child: Text(
                'Contate-nos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF13570e), // Cor verde para o título
                  fontFamily:
                      'Roboto', // Fonte Roboto ou personalizada (adicione no pubspec.yaml)
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.place,
                          color: Color(0xFF13570e)), // Cor verde unificada
                      title: Text(
                        'Local',
                        style: TextStyle(
                            color: Color(0xFF13570e)), // Cor verde no texto
                      ),
                      subtitle: Text('Tambaú - SP'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.phone,
                          color: Color(0xFF13570e)), // Cor verde unificada
                      title: Text(
                        'Telefone',
                        style: TextStyle(
                            color: Color(0xFF13570e)), // Cor verde no texto
                      ),
                      subtitle: Text('(51) 98405-4165'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.email,
                          color: Color(0xFF13570e)), // Cor verde unificada
                      title: Text(
                        'Email',
                        style: TextStyle(
                            color: Color(0xFF13570e)), // Cor verde no texto
                      ),
                      subtitle: Text('ouvidoria-sus@saude.rs.gov.br'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}