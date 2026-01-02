import 'package:flutter/material.dart';
import 'package:quiz/model/quiz_question.dart';

class ShowOptions extends StatelessWidget {
  const ShowOptions({
    required this.currentQuestion,
    required this.selectedAnswer,
    required this.onSelectAnswer,
    super.key,
  });
  final QuizQuestion currentQuestion;
  final String? selectedAnswer;
  final Function(String) onSelectAnswer;

  Color setBackgroundColor(
    String? selectedAnswer,
    String ans,
    currentQuestion,
  ) {
    if (selectedAnswer == null) return Colors.white;
    if (ans == currentQuestion.answers[0]) {
      return const Color.fromARGB(255, 92, 172, 238);
    }
    if (selectedAnswer == ans) {
      return const Color.fromARGB(255, 236, 102, 93);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final shuffledAnswers = List.of(currentQuestion.answers)..shuffle();
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shuffledAnswers.length,
      itemBuilder: (context, index) {
        final ans = shuffledAnswers[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (selectedAnswer != null) {
                  return;
                }
                onSelectAnswer(ans);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: setBackgroundColor(
                  selectedAnswer,
                  ans,
                  currentQuestion,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
              ),
              child: Text(
                ans,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
