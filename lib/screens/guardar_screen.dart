import 'package:app_11/main.dart';
import 'package:flutter/material.dart';

class GuardarScreen extends StatelessWidget {
  const GuardarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Formulario()),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();
  bool obscureText = true;

  void ocultarTexto() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Renderizando");
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
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: Icon(Icons.numbers),
              suffixIcon: IconButton(
                onPressed: () => ocultarTexto(),
                icon: Icon(Icons.remove_red_eye),
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
}

// Widget formulario2(BuildContext context) {
//   TextEditingController placa = TextEditingController();
//   TextEditingController marca = TextEditingController();
//   TextEditingController precio = TextEditingController();

//   return Padding(
//     padding: EdgeInsetsGeometry.symmetric(horizontal: 64),
//     child: Column(
//       mainAxisSize: .min,
//       children: [
//         TextField(
//           controller: placa,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//             ),
//           ),
//         ),
//         SizedBox(height: 12),
//         TextField(
//           controller: marca,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//             ),
//           ),
//         ),
//         SizedBox(height: 12),
//         TextField(
//           controller: precio,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//             ),
//           ),
//         ),
//         SizedBox(height: 12),
//         FilledButton(
//           onPressed: () {
//             double parsePrecio = double.parse(precio.text);

//             guardar(context, placa.text, marca.text, parsePrecio);
//           },
//           child: Text("Guardar"),
//         ),
//         SizedBox(height: 12),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, "/leer");
//           },
//           child: Text("Leer"),
//         ),
//       ],
//     ),
//   );
// }

Future<void> guardar(
  BuildContext context,
  String placa,
  String marca,
  double precio,
) async {
  try {
    await supabase.from('autos').insert({
      'placa': placa,
      'marca': marca,
      'precio': precio,
    });

    print("Guardado");
  } catch (e) {
    print(e.toString());
  }
}
