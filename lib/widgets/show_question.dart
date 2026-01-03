import 'package:flutter/material.dart';
import 'package:quiz/model/quiz_question.dart';

class ShowQuestion extends StatelessWidget {
  const ShowQuestion({
    required this.currentQuestion,
    super.key,
  });
  final QuizQuestion currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        currentQuestion.question,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(wordSpacing: 2, letterSpacing: 3),
        textAlign: TextAlign.center,
      ),
    );
  }
}
