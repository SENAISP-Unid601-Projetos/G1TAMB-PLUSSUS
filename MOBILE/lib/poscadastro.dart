import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false, // Remove o banner de debug
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primaryColor = const Color(0xFF13570e); // Verde escuro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 1000,
            height: 2000, // Aumentando a altura da imagem
            child: Image.asset(
              'assets/thumbnail_logo.png', // Caminho para a imagem
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.account_circle, size: 32, color: Colors.white),
            onPressed: () => _showMenu(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Olá NOME DE USUÁRIO, o que você precisa no momento?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      _OptionTile(
                        icon: Icons.home,
                        title: 'Home',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.home_repair_service,
                        title: 'Serviços',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.calendar_today,
                        title: 'Agendamento',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.phone,
                        title: 'Contate-nos',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.format_list_bulleted,
                        title: 'Fila de Espera',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.medical_services,
                        title: 'Medicamentos',
                        onTap: () {},
                      ),
                      _OptionTile(
                        icon: Icons.info,
                        title: 'Sobre Nós',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: primaryColor, width: 2),
                ),
                onPressed: () {},
                child: Text(
                  'SAMU 192',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 80, 16, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
              // Ação para "Perfil"
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              Navigator.pop(context);
              // Ação para "Sair"
            },
          ),
        ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _OptionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF13570e)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
