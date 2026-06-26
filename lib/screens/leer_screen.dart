import 'package:app_11/main.dart';
import 'package:flutter/material.dart';

class LeerScreen extends StatelessWidget {
  const LeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lista()));
  }
}

Future<List<dynamic>> leerSupa() async {
  final data = await supabase.from('autos').select();

  return data;
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List data = [];

  Future<void> cargaratos() async {
    final traerData = await leerSupa();
    setState(() {
      data = traerData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: leerSupa(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return ListTile(
                title: Text(item['placa']),
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                trailing: IconButton(
                  onPressed: () => eliminar(context, item['placa']),
                  icon: Icon(Icons.clear),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 12),
          );
        } else {
          return Text("No hay data");
        }
      },
    );
  }

  Future<void> eliminar(BuildContext context, String placa) async {
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Advertencia"),
          content: Text("Estas por borrar un otem"),
          actions: [
            FilledButton(
              onPressed: (() => Navigator.pop(context)),
              child: Text("Cancelar"),
            ),

            OutlinedButton(
              onPressed: () async {
                await supabase.from('autos').delete().eq('placa', placa);

                Navigator.pop(context);
                cargaratos();
              },
              child: Text(""),
            ),
          ],
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

// Widget lista2(BuildContext context) => FutureBuilder(
//   future: leerFire(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     }

//     if (snapshot.hasData) {
//       final data = snapshot.data!;

//       return ListView.separated(
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           final item = data[index];

//           return ListTile(
//             title: Text(item['placa']),
//             trailing: IconButton(
//               onPressed: () => eliminar(context, item['placa']),
//               icon: Icon(Icons.clear),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) => SizedBox(height: 12),
//       );
//     } else {
//       return Text("No hay data");
//     }
//   },
// );

// Future<void> eliminar(BuildContext context, String placa) async {
//   try {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Advertencia"),
//         content: Text("Estas por borrar un otem"),
//         actions: [
//           FilledButton(
//             onPressed: (() => Navigator.pop(context)),
//             child: Text("Cancelar"),
//           ),

//           OutlinedButton(
//             onPressed: () async {
//               await supabase.from('autos').delete().eq('placa', placa);

//               Navigator.pop(context);
//               cargaratos();
//             },
//             child: Text(""),
//           ),
//         ],
//       ),
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(e.toString()),
//         duration: Duration(seconds: 2),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }
