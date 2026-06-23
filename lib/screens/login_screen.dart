import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: formulario()));
  }
}

Widget formulario() {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 64),
    child: Column(
      mainAxisSize: .min,
      children: [
        TextField(
          controller: correo,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          controller: contrasenia,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.login),
          label: Text("Login"),
        ),
      ],
    ),
  );
}
