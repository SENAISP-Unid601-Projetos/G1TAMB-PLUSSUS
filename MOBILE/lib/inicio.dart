import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Inicial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    // Lista de imagens do carrossel
    final List<String> imgList = [
      'assets/carousel-1.jpg', // Substitua pelos caminhos das suas imagens
      'assets/Hospital.jpg',
      'assets/header-page.jpg',
    ];

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
        actions: [
          Builder(
            builder: (BuildContext context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              color: Color(0xFF13570e),
              padding: EdgeInsets.all(8.0),
              child: const Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    tileColor: Colors.white,
                    title: const Text('Serviços',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, "/servicos");
                    },
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    title: Text('Agendamento',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, "/agendamento");
                    },
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    title: const Text('Contate-nos',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, "/contato");
                    },
                  ),
                  ListTile(
                    tileColor: Colors.white,
                    title: const Text('Login',
                        style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Adicionando o carrossel de imagens
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0, // Altura do carrossel
              autoPlay: true, // Ativa a rotação automática
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 3),
            ),
            items: imgList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover, // Ajusta a imagem ao container
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16.0 : 32.0,
                  ),
                  child: Text(
                    'Uma boa saúde é a raiz de toda felicidade',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 20 : 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Color(0xFF052556),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                isSmallScreen
                    ? Column(
                        children: [
                          infoCard('123', 'Médicos Experientes'),
                          SizedBox(height: 10),
                          infoCard('1234', 'Estagiários'),
                          SizedBox(height: 10),
                          infoCard('12345', 'Total de Pacientes'),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          infoCard('123', 'Médicos Experientes'),
                          infoCard('1234', 'Estagiários'),
                          infoCard('12345', 'Total de Pacientes'),
                        ],
                      ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não tem cadastro? ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF13570e),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/cadastro");
                            },
                            child: const Text(
                              "Criar Conta",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF13570e),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta? ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF13570e),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            child: const Text(
                              "Faça Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF13570e),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }

  Widget infoCard(String number, String description) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 36,
            color: Color(0xFF052556),
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF797878),
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Container(
      color: Color(0xFF13570e),
      padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© 2024 +SUS, All Right Reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallScreen ? 12 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
