import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/data/review_data.dart';
import 'package:quiz/screens/next_question_button.dart';
import 'package:quiz/pages/review_page.dart';
import 'package:quiz/screens/show_options.dart';
import 'package:quiz/screens/show_question.dart';
import 'package:quiz/screens/gradient_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ----------------- Variables------------------
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool isQuizFinished = false;
  List<ReviewData> reviewData = [];

  int correctAnswers = 0;
  int wrongAnswer = 0;
  // ------------------- Functions ------------------
  void selectAnswer(String answer) {
    final question = questions[currentQuestionIndex];
    final correctAnswer = questions[currentQuestionIndex].answers[0];
    setState(() {
      selectedAnswer = answer;
      if (answer == correctAnswer) {
        correctAnswers++;
      } else {
        wrongAnswer++;
      }
      reviewData.add(
        ReviewData(
          question: question.question,
          correctAnswer: correctAnswer,
          userAnswer: answer,
        ),
      );
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      isQuizFinished = false;
      selectedAnswer = null;
      correctAnswers = 0;
      wrongAnswer = 0;
      reviewData.clear();
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
      } else {
        isQuizFinished = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewPage(
              correct: correctAnswers,
              wrong: wrongAnswer,
              resetQuiz: resetQuiz,
              reviewData: reviewData,
            ),
          ),
        );
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
              ShowQuestion(
                currentQuestion: currentQuestion,
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              ShowOptions(
                currentQuestion: currentQuestion,
                selectedAnswer: selectedAnswer,
                onSelectAnswer: selectAnswer,
              ),
              if (selectedAnswer != null)
                NextQuestionButton(onPressed: goToNextQuestion),
            ],
          ),
        ),
      ),
    );
  }
}
