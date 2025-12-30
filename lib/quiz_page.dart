import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/next_question_button.dart';
import 'package:quiz/options_widget.dart';
import 'package:quiz/question_widget.dart';
import 'package:quiz/screens/gradient_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool isQuizFinished = false;
  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
      } else {
        isQuizFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final currentQuestion = questions[currentQuestionIndex];
    return GradientScreen(
      gradientChild: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuestionWidget(currentQuestion: currentQuestion),
              SizedBox(
                height: size.width * 0.05,
              ),
              OptionsWidget(currentQuestion: currentQuestion),
              if (selectedAnswer != null)
                NextQuestionButton(onPressed: goToNextQuestion),
            ],
          ),
        ),
      ),
    );
  }
}
