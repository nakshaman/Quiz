import 'package:flutter/material.dart';
import 'package:quiz/widgets/gradient_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScreen(
        gradientChild: Center(
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
                style: Theme.of(context).textTheme.titleLarge,
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
                  textStyle: Theme.of(context).textTheme.titleLarge,
                  side: BorderSide(
                    color: Colors.black,
                    width: 0.8,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/quizPage');
                },
                label: Text(
                  'Start Quiz',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: Colors.black),
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
