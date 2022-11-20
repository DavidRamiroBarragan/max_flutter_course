import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/questions.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 5},
        {"text": "Bird", "score": 3},
        {"text": "Fish", "score": 1},
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answer": [
        {"text": "Margarita", "score": 10},
        {"text": "David", "score": 5},
        {"text": "Fernando", "score": 3},
        {"text": "Max", "score": 1},
      ]
    },
  ];

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex += 1;
      }
    });
  }

  void _resetApp() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  hanleQuestions: _answerQuestions,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetApp)),
    );
  }
}
