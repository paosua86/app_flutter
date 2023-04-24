import 'package:flutter/material.dart';

class Meditation extends StatelessWidget {
  const Meditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided Meditation'),
      ),
      body: Center(
        child: Text('Meditation content will be displayed here.'),
      ),
    );
  }
}
