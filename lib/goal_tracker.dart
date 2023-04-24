import 'package:flutter/material.dart';

class GoalTracker extends StatelessWidget {
  const GoalTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Tracker'),
      ),
      body: Center(
        child: Text('Goals and their progress will be displayed here.'),
      ),
    );
  }
}
