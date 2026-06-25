import 'package:app_11/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  String email,
  String password,
) async {
  final AuthResponse res = await supabase.auth.signUp(
    email: email,
    password: password,
  );
  final Session? session = res.session;
  final User? user = res.user;

  if (context.mounted) {
    Navigator.pushNamed(context, "/login");
  }
}
