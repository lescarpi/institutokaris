import 'dart:convert';

import 'package:app/models/paciente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Paciente> paciente;

  @override
  void initState() {
    super.initState();
    paciente = fetchPaciente();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Instituto Karis'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person),
                tooltip: 'Pacientes',
                onPressed: () {},
              )
            ],
          ),
          body: Center(
              child: FutureBuilder<Paciente>(
            future: paciente,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.nome);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<_MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instituto Karis'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Pacientes',
            onPressed: () {},
          )
        ],
      ),
      body: Center(
          child: FutureBuilder<Paciente>(
        future: appState.paciente,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.nome);
            return Text(snapshot.data!.nome);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}

//class PacienteCard extends StatelessWidget {}

Future<Paciente> fetchPaciente() async {
  final response = await http
      .get(Uri.parse('http://localhost:8181/pacientes/detalhe/12312312312'));

  if (response.statusCode == 200) {
    return Paciente.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao carregar Paciente');
  }
}
