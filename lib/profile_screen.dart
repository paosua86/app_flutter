import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text('Aquí va el contenido del perfil'),
      ),
    );
  }
}
