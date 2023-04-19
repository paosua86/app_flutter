// import 'package:flutter/material.dart';
// import 'package:unavidabrillante/auth.dart';
// import 'package:unavidabrillante/services/database.dart';
// import 'package:provider/provider.dart';
// import 'package:unavidabrillante/models/user.dart';

// class HomePage extends StatelessWidget {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserData?>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bienvenido'),
//         actions: <Widget>[
//           TextButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('Cerrar sesión'),
//             onPressed: () async {
//               await _auth.signOut();
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Bienvenido',
//               style: TextStyle(fontSize: 30.0),
//             ),
//             SizedBox(height: 30.0),
//             Text(
//               'Correo electrónico:',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '${user?.email ?? ''}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             SizedBox(height: 30.0),
//             Text(
//               'Nombre:',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '${user?.name ?? ''}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             SizedBox(height: 30.0),
//             Text(
//               'Fecha de nacimiento:',
//               style: TextStyle(fontSize: 20.0),
//             ),
//             Text(
//               '${user?.dateOfBirth ?? ''}',
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
