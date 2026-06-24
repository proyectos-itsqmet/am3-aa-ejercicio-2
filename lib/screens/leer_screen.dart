import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LeerScreen extends StatelessWidget {
  const LeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: lista(context)));
  }
}

Future<List<dynamic>> leerFire() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('/autos').get();

  if (snapshot.exists) {
    return snapshot.children.map((child) {
      final data = Map.from(child.value as Map);

      return {
        'placa': child.key,
        'marca': data['marca'],
        'precio': data['precio'],
      };
    }).toList();
  } else {
    return [];
  }
}

Widget lista(BuildContext context) => FutureBuilder(
  future: leerFire(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final data = snapshot.data!;

      return ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];

          return ListTile(
            title: Text(item['placa']),
            trailing: IconButton(
              onPressed: () => eliminar(item['placa']),
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

Future<void> eliminar(String placa) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("autos/$placa");

  await ref.remove();
}
