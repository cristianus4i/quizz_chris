import 'package:flutter/material.dart';
import 'result_screen.dart'; // Importando a tela de resultados

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Qual é o músculo responsável pelo movimento de flexão do braço?',
      'answers': ['Bíceps', 'Tríceps', 'Deltoides', 'Quadríceps'],
      'correctAnswer': 'Bíceps',
    },
    {
      'questionText': 'Qual é o nome do exercício que trabalha os músculos peitorais e tríceps?',
      'answers': ['Supino', 'Agachamento', 'Rosca direta', 'Leg press'],
      'correctAnswer': 'Supino',
    },
    {
      'questionText': 'Qual é o principal músculo trabalhado durante o exercício de agachamento?',
      'answers': ['Quadríceps', 'Isquiotibiais', 'Gastrocnêmio', 'Glúteos'],
      'correctAnswer': 'Quadríceps',
    },
    // Adicione mais perguntas conforme necessário
  ];

  void _answerQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Musculação'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex]['questionText'] as String,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['answers'] as List<String>).map((answer) {
              return ElevatedButton(
                onPressed: _answerQuestion,
                child: Text(answer),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
