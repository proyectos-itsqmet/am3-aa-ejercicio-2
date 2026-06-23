import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://4kwallpapers.com/images/walls/thumbs_v/26293.jpg",
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              FilledButton(
                onPressed: () => Navigator.pushNamed(context, "/login"),
                child: Text("Login"),
              ),

              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/registro"),
                child: Text("Registro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
