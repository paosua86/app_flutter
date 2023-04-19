import 'package:flutter/material.dart';
import 'package:unavidabrillante/models/user.dart';
import 'package:unavidabrillante/services/auth_service.dart';
import 'package:unavidabrillante/services/database.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido, ${user.name}'),
            SizedBox(height: 20.0),
            Text('Correo electrónico: ${user.email}'),
            SizedBox(height: 20.0),
            Text('Fecha de nacimiento: ${user.dateOfBirth.day}/${user.dateOfBirth.month}/${user.dateOfBirth.year}'),
          ],
        ),
      ),
    );
  }
}
