import 'package:flutter/material.dart';

class GradientScreen extends StatelessWidget {
  const GradientScreen({required this.child, super.key});
  final Widget child;
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
      child: child,
    );
  }
}
