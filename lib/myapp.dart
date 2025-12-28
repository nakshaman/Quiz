import 'package:flutter/material.dart';
import 'package:quiz/gradient_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const GradientContainer(),
      ),
    );
  }
}
