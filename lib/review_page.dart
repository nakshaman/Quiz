import 'package:flutter/material.dart';
import 'package:quiz/data/review_data.dart';
import 'package:quiz/screens/gradient_screen.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    required this.correct,
    required this.wrong,
    required this.resetQuiz,
    required this.reviewData,
    super.key,
  });
  final int correct;
  final int wrong;
  final VoidCallback resetQuiz;
  final List<ReviewData> reviewData;

  Color getAnswerColor(ReviewData data) {
    return data.userAnswer == data.correctAnswer
        ? const Color.fromARGB(255, 92, 172, 238) // blue
        : const Color.fromARGB(255, 236, 102, 93); // red
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScreen(
        gradientChild: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Quiz Review",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: reviewData.length,
                      itemBuilder: (context, index) {
                        final data = reviewData[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.question,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Your Answer: ${data.userAnswer}",
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(
                                      color: getAnswerColor(data),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              if (data.userAnswer != data.correctAnswer)
                                Text(
                                  "Correct Answer: ${data.correctAnswer}",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: Colors.white70),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        resetQuiz();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Restart Quiz",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
