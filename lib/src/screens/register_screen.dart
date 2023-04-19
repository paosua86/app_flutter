import 'package:flutter/material.dart';
import 'package:unavidabrillante/auth.dart';
import 'package:unavidabrillante/services/database.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  DateTime dateOfBirth = DateTime.now();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: (val) =>
                    val!.isEmpty ? 'Ingresa un correo electrónico' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (val) => val!.length < 6
                    ? 'La contraseña debe tener al menos 6 caracteres'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (val) => val!.isEmpty ? 'Ingresa tu nombre' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
                validator: (val) =>
                    val!.isEmpty ? 'Ingresa tu fecha de nacimiento' : null,
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (pickedDate != null) {
                    setState(() {
                      dateOfBirth = pickedDate;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                    text: dateOfBirth == null
                        ? ''
                        : '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Registrarse'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'No se pudo registrar con esas credenciales');
                    } else {
                      String dateOfBirthStr = dateOfBirth == null
                          ? ''
                          : '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}';
                      await DatabaseService(uid: result.uid)
                          .updateUserData(result.uid, name, email, dateOfBirth);

                      ;
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
