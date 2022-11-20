import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function hanleQuestions;

  Quiz(
      {required this.hanleQuestions,
      required this.questions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]["questionText"] as String),
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answer) => Answer(() => hanleQuestions(answer["score"]),
                answer["text"] as String))
            .toList()
      ],
    );
  }
}
