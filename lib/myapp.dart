import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/pages/quiz_page.dart';
import 'package:quiz/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: GoogleFonts.lato(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: GoogleFonts.lato(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: GoogleFonts.lato(
            fontSize: MediaQuery.of(context).size.width * 0.02,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quizPage': (context) => QuizPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
