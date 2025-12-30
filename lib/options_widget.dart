import 'package:flutter/material.dart';
import 'package:quiz/model/quiz_question.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({required this.currentQuestion, super.key});
  final QuizQuestion currentQuestion;
  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool isAnswered = false;
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool isQuizFinished = false;
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.currentQuestion.answers.length,
      itemBuilder: (context, index) {
        final ans = widget.currentQuestion.answers[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswer = ans;
                  isAnswered = true;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: setBackgroundColor(
                  selectedAnswer,
                  ans,
                  widget.currentQuestion,
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
