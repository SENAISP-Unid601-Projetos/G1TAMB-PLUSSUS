import 'package:aplicativomobile/cadastro.dart';
import 'package:aplicativomobile/poscadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+SUS',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Barlow',
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/thumbnail_logo.png',
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: const Color(0xFF13570e),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF13570e), // Cor verde
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.22),
                      blurRadius: 26,
                      offset: const Offset(0, 26),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Imagem no topo dentro da caixa verde
                      Image.asset(
                        'assets/thumbnail_logo.png',
                        height: 100, // Ajuste de altura da imagem
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                          height: 20), // Espaçamento entre a imagem e os campos

                      // Título "Logar"
                      const Text(
                        'Logar',
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),

                      // Mensagem de instrução
                      const Text(
                        'Logue para conseguir realizar sua consultas!',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Campo de CPF
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo de Senha
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Botão de Logar
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PosCadastro(), // Substitua "Fila" pela sua página
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Logar'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF13570e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Link para cadastro
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Cadastro(), // Substitua "Fila" pela sua página
                              ),
                            );
                          },
                          child: const Text(
                            'Não possui cadastro? Cadastre-se',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
