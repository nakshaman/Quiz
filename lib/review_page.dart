import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/screens/gradient_screen.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    required this.correct,
    required this.wrong,
    required this.resetQuiz,
    super.key,
  });
  final int correct;
  final int wrong;
  final VoidCallback resetQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScreen(
        gradientChild: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Quiz Completed ",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Correct Answers: $correct",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Wrong Answers: $wrong",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
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
                  onPressed: () {
                    resetQuiz();
                    Navigator.pop(context);
                  },
                  child: Text("Restart Quiz"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
