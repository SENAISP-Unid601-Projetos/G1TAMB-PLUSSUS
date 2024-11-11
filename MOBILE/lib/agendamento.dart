import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatação de datas

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
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(), // Tela inicial que leva ao agendamento
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
              MaterialPageRoute(builder: (context) => Agendamento()),
            );
          },
          child: Text("Ir para Agendamento"),
        ),
      ),
    );
  }
}

class Agendamento extends StatelessWidget {
  const Agendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return AgendamentoConsultaScreen();
  }
}

class AgendamentoConsultaScreen extends StatefulWidget {
  @override
  _AgendamentoConsultaScreenState createState() =>
      _AgendamentoConsultaScreenState();
}

class _AgendamentoConsultaScreenState extends State<AgendamentoConsultaScreen> {
  DateTime selectedDate =
      DateTime.now(); // Data inicialmente selecionada (hoje)
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF13570E)),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        centerTitle: true,
        title: Text(
          "Agendamento de Consultas",
          style: TextStyle(
            color: Color(0xFF13570E),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Text(
              "Atendimento Geral",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13570E),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Acompanhe suas consultas e agendamentos com nossos médicos",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.green),
                SizedBox(width: 4),
                Text(
                  "Posto de Saúde, 123, Sua Cidade",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            _calendarSection(),
            SizedBox(height: 16),
            _timeSelectionSection(),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedTime.isNotEmpty
                    ? () {
                        _scheduleAppointment();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Color(0xFF13570E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  "Agendar Consulta",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calendarSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFF13570E)),
              onPressed: () {
                setState(() {
                  selectedDate = DateTime(
                    selectedDate.year,
                    selectedDate.month - 1,
                  );
                });
              },
            ),
            Text(
              DateFormat.yMMMM().format(selectedDate),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF13570E),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Color(0xFF13570E)),
              onPressed: () {
                setState(() {
                  selectedDate = DateTime(
                    selectedDate.year,
                    selectedDate.month + 1,
                  );
                });
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        _daysGrid(),
      ],
    );
  }

  Widget _daysGrid() {
    int daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    List<Widget> dayButtons = [];

    for (int day = 1; day <= daysInMonth; day++) {
      dayButtons.add(_dayButton(day));
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: dayButtons,
    );
  }

  Widget _dayButton(int day) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = DateTime(selectedDate.year, selectedDate.month, day);
        });
      },
      child: Container(
        width: 50,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selectedDate.day == day ? Colors.white : Color(0xFF13570E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFF13570E)),
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(
              color: selectedDate.day == day ? Color(0xFF13570E) : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _timeSelectionSection() {
    return Column(
      children: [
        _buildTimeButtonRow(['08:00', '09:00', '10:00']),
        SizedBox(height: 16),
        _buildTimeButtonRow(['14:00', '15:00', '16:00']),
      ],
    );
  }

  Widget _buildTimeButtonRow(List<String> times) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: times.map((time) => _timeButton(time)).toList(),
      ),
    );
  }

  Widget _timeButton(String time) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedTime == time ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: selectedTime == time ? Colors.white : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _scheduleAppointment() {
    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    print('Consulta agendada para: $formattedDate às $selectedTime');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Consulta agendada para $formattedDate às $selectedTime'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
