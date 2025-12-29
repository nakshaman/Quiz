import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({required this.currentQuestion, super.key});
  final currentQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
