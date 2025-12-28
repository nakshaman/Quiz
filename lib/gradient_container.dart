import 'package:flutter/material.dart';
import 'package:quiz/questions_page.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, const Color.fromARGB(255, 44, 44, 44)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image widget to display the logo
            Image.asset(
              'images/quiz-logo.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            // Spacing between the logo and the button
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            // Button to start the Quiz
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                side: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const QuestionsPage();
                    },
                  ),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
