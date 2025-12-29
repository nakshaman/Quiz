import 'package:flutter/material.dart';

class GradientScreen extends StatelessWidget {
  const GradientScreen({required this.gradientChild, super.key});
  final Widget gradientChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 28, 144, 239),
            const Color.fromARGB(255, 44, 44, 44),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: gradientChild,
    );
  }
}
