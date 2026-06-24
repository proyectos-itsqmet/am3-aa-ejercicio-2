import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class GuardarScreen extends StatelessWidget {
  const GuardarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: formulario(context)),
    );
  }
}

Widget formulario(BuildContext context) {
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
        FilledButton(
          onPressed: () {
            double parsePrecio = double.parse(precio.text);

            guardar(context, placa.text, marca.text, parsePrecio);
          },
          child: Text("Guardar"),
        ),
        SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/leer");
          },
          child: Text("Leer"),
        ),
      ],
    ),
  );
}

Future<void> guardar(
  BuildContext context,
  String placa,
  String marca,
  double precio,
) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("autos/$placa");

  await ref.set({"placa": placa, "marca": marca, "precio": precio});
}
