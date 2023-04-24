import 'package:flutter/material.dart';

class DailyWork extends StatelessWidget {
  const DailyWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Work'),
      ),
      body: Center(
        child: Text('Daily work tasks will be displayed here.'),
      ),
    );
  }
}
