import 'package:flutter/material.dart';
import 'package:imconcept/pages/home/home.dart';
import 'package:imconcept/pages/home/welcomPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'ImConcept',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),);
  }
}
