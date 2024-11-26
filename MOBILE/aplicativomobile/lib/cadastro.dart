import 'package:aplicativomobile/inicio.dart';
import 'package:aplicativomobile/login.dart';
import 'package:aplicativomobile/poscadastro.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '+SUS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatelessWidget {
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
        backgroundColor: Color(0xFF13570e),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomePage(), // Substitua "Fila" pela sua página
              ),
            ); // Volta para a tela anterior
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Color(0xFF13570E),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo on top
                Image.asset(
                  'assets/thumbnail_logo.png',
                  height: 150,
                ),
                SizedBox(height: 30),
                // Sign-up form
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            "Cadastre-se",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'BarlowSemiCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Cadastre-se para conseguir realizar suas consultas!",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20),

          // Nome
          buildTextField("Nome", false),
          SizedBox(height: 10),
          // Email
          buildTextField("Email", false),
          SizedBox(height: 10),
          // CPF
          buildTextField("CPF", false),
          SizedBox(height: 10),
          // N° Carteirinha SUS
          buildTextField("N° Carteirinha SUS", false),
          SizedBox(height: 10),
          // Telefone
          buildTextField("Telefone", false),
          SizedBox(height: 10),
          // Senha
          buildTextField("Senha", true),
          SizedBox(height: 20),

          // Cadastrar Button
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
            icon: Icon(Icons.arrow_forward),
            label: Text('Cadastrar'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),

          // Login link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Já tem login? ",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(), // Substitua "Fila" pela sua página
                    ),
                  );
                },
                child: Text(
                  'Logar',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build Text Field
  Widget buildTextField(String label, bool isPassword) {
    return TextFormField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true, // This makes the background color active
        fillColor: Colors.white, // White background for input fields
        labelText: label,
        labelStyle: TextStyle(color: Colors.black), // Label text color
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              15), // More rounded border for focused state
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              15), // More rounded border for enabled state
          borderSide: BorderSide(color: Colors.black54),
        ),
      ),
    );
  }
}
