import 'package:app_11/firebase_options.dart';
import 'package:app_11/screens/detalles_screen.dart';
import 'package:app_11/screens/guardar_screen.dart';
import 'package:app_11/screens/leer_screen.dart';
import 'package:app_11/screens/login_screen.dart';
import 'package:app_11/screens/registro_screen.dart';
import 'package:app_11/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login": (context) => LoginScreen(),
        "/registro": (context) => RegistroScreen(),
        "/guardar": (context) => GuardarScreen(),
        "/leer": (context) => LeerScreen(),
        "/detalles": (context) => DetallesScreen(),
      },
    );
  }
}
