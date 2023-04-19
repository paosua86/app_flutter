import 'package:flutter/material.dart';
import 'package:unavidabrillante/auth.dart';
import 'package:unavidabrillante/src/screens/dashboard_screen.dart';

import 'register_screen.dart';
import 'login_screen.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Inicia sesión con Google'),
              onPressed: () async {
                dynamic result = await _auth.signInWithGoogle();
                if (result != null) {
                   print('Going to dashboard');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('¿No tienes una cuenta? Regístrate aquí.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('¿Ya tienes una cuenta? Inicia sesión aquí.'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
