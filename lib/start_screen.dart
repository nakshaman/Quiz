import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/gradient_screen.dart';
import 'package:quiz/questions_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientScreen(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image widget to display the logo
            Image.asset(
              'images/quiz-logo.png',
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
            // Spacing between the logo and the button
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            // Text widget for the tagline
            Text(
              'Learn Flutter the fun way !',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            // Button to start the Quiz
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                side: BorderSide(
                  color: Colors.black,
                  width: 0.8,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuestionsPage();
                    },
                  ),
                );
              },
              label: Text('Start Quiz'),
              icon: const Icon(Icons.arrow_right_alt),
            ),
          ],
        ),
      ),
    );
  }
}
