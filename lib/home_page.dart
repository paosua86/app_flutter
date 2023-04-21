import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'app_state.dart';
import 'src/authentication.dart';
import 'src/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Una Vida Brillante'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('images/codelab.png'),
          const SizedBox(height: 8),
          const Text("Bienvenida!"),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),

          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Color.fromARGB(255, 249, 26, 194),
          ),
          const Paragraph(
            'Te espero adentro, la magia está por comenzar!',
          ),
        ],
      ),
    );
  }
}
