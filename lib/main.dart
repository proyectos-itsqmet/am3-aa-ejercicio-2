import 'package:app_11/screens/detalles_screen.dart';
import 'package:app_11/screens/guardar_screen.dart';
import 'package:app_11/screens/leer_screen.dart';
import 'package:app_11/screens/login_screen.dart';
import 'package:app_11/screens/registro_screen.dart';
import 'package:app_11/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://wtsrlvhkztbqnxupxwre.supabase.co',
    publishableKey: 'sb_publishable_VzK0tlVAODP5xI0t7Kp2SA_apdHEx16',
  );

  runApp(const AppFire());
}

final supabase = Supabase.instance.client;

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/guardar",
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
