import 'package:flutter/material.dart';
class ImGraphicsPage extends StatelessWidget {
  const ImGraphicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IM Graphics'),
      ),
      body: const Center(
        child: Text('This is the IM Graphics page'),
      ),
    );
  }
}