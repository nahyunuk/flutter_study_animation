import 'package:flutter/material.dart';
import 'package:study_animation/AnimatedContainerPage.dart';
import 'package:study_animation/AnimatedDefaultTextStylePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedDefaultTextStylePage(),
    );
  }
}