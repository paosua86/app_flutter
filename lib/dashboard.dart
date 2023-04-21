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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                context.push('/profile');
              },
              tooltip: 'Profile',
            ),
          ),
        ],
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
