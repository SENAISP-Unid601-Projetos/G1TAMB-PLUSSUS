import 'package:aplicativomobile/agendamento.dart';
import 'package:aplicativomobile/cadastro.dart';
import 'package:aplicativomobile/inicio.dart';
import 'package:aplicativomobile/login.dart';
import 'package:aplicativomobile/contato.dart';
import 'package:aplicativomobile/servi%C3%A7os.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomePage());
      case "/cadastro":
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/servicos":
        return MaterialPageRoute(builder: (_) => const Servicos());
      case "/agendamento":
        return MaterialPageRoute(builder: (_) => const Agendamento());
      case "/contato":
        return MaterialPageRoute(builder: (_) => const Contato());
      default:
        _erroRota();
    }

    throw '';
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Erro Rota"),
        ),
        body: const Text("Tela não encontrada"),
      );
    });
  }
}
