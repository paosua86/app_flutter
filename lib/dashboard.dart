import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'src/widgets.dart';
import 'src/authentication.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text('Navigation'),
            ),
            ListTile(
              title: const Text('Daily Work'),
              onTap: () {
                Navigator.pop(context);
                context.go('/daily-work');
              },
            ),
            ListTile(
              title: const Text('Goal Tracker'),
              onTap: () {
                Navigator.pop(context);
                context.go('/goal-tracker');
              },
            ),
            ListTile(
              title: const Text('Guided Meditation'),
              onTap: () {
                Navigator.pop(context);
                context.go('/meditation');
              },
            ),
            ListTile(
              title: const Text('Community'),
              onTap: () {
                Navigator.pop(context);
                context.go('/community');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Hola Mundo!'),
      ),
      bottomNavigationBar: AuthFunc(
        loggedIn: true,
        signOut: () async {
          await FirebaseAuth.instance.signOut();
          context.pushReplacement('/');
        },
      ),
    );
  }
}
