import 'package:flutter/material.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 5,
        animationDuration: Duration(milliseconds: 200),
      ),
      onPressed: onPressed,
      child: Text(
        'Next Question',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
