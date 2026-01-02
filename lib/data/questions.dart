import 'package:quiz/model/quiz_question.dart';

const questions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs ?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),

  QuizQuestion(
    'How are Flutter UIs built ?',
    [
      'By combining widgets in code',
      'By using a visual editor',
      'By defining widgets in config files',
      'By using Xcode only',
    ],
  ),

  QuizQuestion(
    'What is the purpose of a StatefulWidget ?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render static UI only',
    ],
  ),

  QuizQuestion(
    'Which widget should you use more often?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'InheritedWidget',
      'StreamBuilder',
    ],
  ),

  QuizQuestion(
    'What happens if you change data in a StatelessWidget ?',
    [
      'The UI is not updated',
      'The UI updates automatically',
      'The app crashes',
      'The widget rebuilds itself',
    ],
  ),

  QuizQuestion(
    'What language is used to write Flutter apps ?',
    [
      'Dart',
      'Java',
      'Kotlin',
      'Swift',
    ],
  ),

  QuizQuestion(
    'What does setState() do in Flutter ?',
    [
      'Rebuilds the widget with updated data',
      'Saves data permanently',
      'Stops the UI rendering',
      'Creates a new widget tree',
    ],
  ),

  QuizQuestion(
    'Which widget is used to create a scrollable list ?',
    [
      'ListView',
      'Column',
      'Stack',
      'Container',
    ],
  ),

  QuizQuestion(
    'What is BuildContext in Flutter ?',
    [
      'It stores location of widget in widget tree',
      'It stores app data',
      'It stores theme colors',
      'It manages navigation only',
    ],
  ),

  QuizQuestion(
    'Which widget is used for layout vertically ?',
    [
      'Column',
      'Row',
      'Stack',
      'ListTile',
    ],
  ),

  QuizQuestion(
    'Which widget is used for layout horizontally ?',
    [
      'Row',
      'Column',
      'Stack',
      'Expanded',
    ],
  ),

  QuizQuestion(
    'What is Hot Reload in Flutter ?',
    [
      'Updates UI without restarting the app',
      'Restarts the entire app',
      'Clears app cache',
      'Stops the running app',
    ],
  ),

  QuizQuestion(
    'Which widget is used to handle user taps ?',
    [
      'GestureDetector',
      'Text',
      'Padding',
      'SizedBox',
    ],
  ),

  QuizQuestion(
    'What is the root widget of a Flutter app ?',
    [
      'MaterialApp',
      'Scaffold',
      'Container',
      'AppBar',
    ],
  ),

  QuizQuestion(
    'What is Scaffold used for ?',
    [
      'Provides basic app structure like AppBar and body',
      'Handles navigation only',
      'Manages app state',
      'Applies app theme',
    ],
  ),
];
