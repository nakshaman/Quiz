import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: currentQuestion.answers.length,
                itemBuilder: (context, index) {
                  final ans = currentQuestion.answers[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedAnswer = ans;
                            currentQuestionIndex++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
