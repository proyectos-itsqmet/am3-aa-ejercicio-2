import 'package:app_11/main.dart';
import 'package:flutter/material.dart';

class LeerScreen extends StatelessWidget {
  const LeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: lista(context)));
  }
}

Future<List<dynamic>> leerFire() async {
  final data = await supabase.from('autos').select();

  return data;
}

Widget lista(BuildContext context) => FutureBuilder(
  future: leerFire(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }

    if (snapshot.hasData) {
      final data = snapshot.data!;

      return ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];

          return ListTile(
            title: Text(item['placa']),
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
