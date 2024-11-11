import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serviços de Saúde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto', // Fonte similar à imagem
      ),
      home: HomeScreen(), // Defina uma tela inicial
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Inicial")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Servicos()),
            );
          },
          child: Text("Ir para Serviços"),
        ),
      ),
    );
  }
}

class Servicos extends StatelessWidget {
  const Servicos({super.key});

  @override
  Widget build(BuildContext context) {
    return ServicesPage();
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      backgroundColor: Color(0xFF13570e), // Fundo verde
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Text(
              'Serviços',
              style: TextStyle(
                fontSize: isSmallScreen ? 24 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto branco
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Cuidar da sua saúde e bem estar também é se amar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Texto branco
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
                children: [
                  _buildServiceCard(
                    context,
                    icon: Icons.favorite_outline,
                    label: 'Cardiologia',
                    onTap: () {
                      // Ação ao clicar no card de Cardiologia
                    },
                  ),
                  _buildServiceCard(
                    context,
                    icon: Icons.air_outlined,
                    label: 'Pneumologia',
                    onTap: () {
                      // Ação ao clicar no card de Pneumologia
                    },
                  ),
                  _buildServiceCard(
                    context,
                    icon: Icons.psychology_outlined,
                    label: 'Neurologia',
                    onTap: () {
                      // Ação ao clicar no card de Neurologia
                    },
                  ),
                  _buildServiceCard(
                    context,
                    icon: Icons.self_improvement_outlined,
                    label: 'Fisioterapia',
                    onTap: () {
                      // Ação ao clicar no card de Fisioterapia
                    },
                  ),
                  _buildServiceCard(
                    context,
                    icon: Icons.local_hospital_outlined,
                    label: 'Clínica Geral',
                    onTap: () {
                      // Ação ao clicar no card de Clínica Geral
                    },
                  ),
                  _buildServiceCard(
                    context,
                    icon: Icons.biotech_outlined,
                    label: 'Laboratório',
                    onTap: () {
                      // Ação ao clicar no card de Laboratório
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Caixas brancas
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32, // Reduzindo o tamanho dos ícones
              color: Color(0xFF13570e), // Ícones verdes
            ),
            SizedBox(
                height: 8), // Diminuindo o espaçamento entre o ícone e o texto
            Text(
              label,
              style: TextStyle(
                fontSize: 14, // Tamanho de texto menor
                fontWeight: FontWeight.bold,
                color: Color(0xFF13570e), // Texto verde
              ),
            ),
          ],
        ),
      ),
    );
  }
}
