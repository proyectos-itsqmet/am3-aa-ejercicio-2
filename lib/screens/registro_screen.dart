import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: formulario(context)));
  }
}

Widget formulario(BuildContext context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 64),
    child: Column(
      mainAxisSize: .min,
      children: [
        TextField(
          controller: correo,
          decoration: InputDecoration(
            labelText: "Correo",
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
            labelText: "Contraseña",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          controller: nick,
          decoration: InputDecoration(
            labelText: "Usuario",
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => registro(context, correo.text, contrasenia.text),
          icon: Image.asset("assets/icons/registro.png", height: 24),
          label: Text("Registro"),
        ),
      ],
    ),
  );
}

Future<void> registro(
  BuildContext context,
  String emailAddress,
  String password,
) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

    Navigator.pushNamed(context, "/guardar");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.code),
          content: Text(e.message ?? "The password provided is too weak."),
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.code),
          content: Text(
            e.message ?? "The account already exists for that email.",
          ),
        ),
      );
    }
  } catch (e) {
    print(e);
  }
}
