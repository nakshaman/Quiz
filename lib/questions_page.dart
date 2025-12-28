import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/gradient_screen.dart';
import 'package:quiz/model/quiz_question.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  String? selectedAnswer;
  int currentQuestionIndex = 0;

  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool quizFinished = false;

  Color getButtonColor(String answer, QuizQuestion currentQuestion) {
    if (selectedAnswer == null) {
      return Colors.white;
    } else if (answer == currentQuestion.answers[0]) {
      return const Color.fromARGB(255, 172, 240, 174);
    } else {
      return const Color.fromARGB(255, 240, 124, 115);
    }
  }

  void selectAnswer(String answer, QuizQuestion currentQuestion) {
    if (selectedAnswer == null) {
      setState(() {
        selectedAnswer = answer;
        if (selectedAnswer == currentQuestion.answers[0]) {
          correctAnswers++;
        } else {
          wrongAnswers++;
        }
      });
    } else {
      return;
    }
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
      } else {
        quizFinished = true;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswer = null;
      currentQuestionIndex = 0;
      correctAnswers = 0;
      wrongAnswers = 0;
      quizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      return Scaffold(
        body: GradientScreen(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quiz Completed 🎉",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Correct Answers: $correctAnswers",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Wrong Answers: $wrongAnswers",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: resetQuiz,
                    child: Text("Restart Quiz"),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: GradientScreen(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Questions
                Text(
                  currentQuestion.question,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Answers
                const SizedBox(height: 20),
                ...currentQuestion.answers.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getButtonColor(
                            answer,
                            currentQuestion,
                          ),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => selectAnswer(answer, currentQuestion),
                        child: Text(
                          answer,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                // Next Question Button
                if (selectedAnswer != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: goToNextQuestion,
                    child: Text('Next Question'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
