import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: formulario(context)));
  }
}

Widget formulario(BuildContext context) {
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
          onPressed: () => login(context, correo.text, contrasenia.text),
          icon: Icon(Icons.login),
          label: Text("Login"),
        ),
      ],
    ),
  );
}

Future<void> login(
  BuildContext context,
  String emailAddress,
  String password,
) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    Navigator.pushNamed(context, "/guardar");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.code),
          content: Text(e.message ?? "No user found for that email."),
        ),
      );
    } else if (e.code == 'wrong-password') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.code),
          content: Text(e.message ?? "Wrong password provided for that user."),
        ),
      );
    }
  }
}
