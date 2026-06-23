import 'package:flutter/material.dart';

class GuardarScreen extends StatelessWidget {
  const GuardarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: formulario()),
    );
  }
}

Widget formulario() {
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();

  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 64),
    child: Column(
      mainAxisSize: .min,
      children: [
        TextField(
          controller: placa,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          controller: marca,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          controller: precio,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 12),
        FilledButton(onPressed: () {}, child: Text("Guardar")),
      ],
    ),
  );
}
