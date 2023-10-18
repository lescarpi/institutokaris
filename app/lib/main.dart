import 'dart:io';

import 'package:app/entities/paciente_entity.dart';
import 'package:app/pages/edit_paciente_page.dart';
import 'package:app/pages/lista_pacientes_page.dart';
import 'package:app/reducers/paciente_reducer.dart';
import 'package:app/services/http_client_service.dart';
import 'package:app/services/paciente_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  final httpClient = HttpClient();
  late final httpClientService = HttpClientService(httpClient);
  late final pacienteService = PacienteService(httpClientService);
  late final reducer;

  @override
  void initState() {
    super.initState();
    reducer = PacienteReducer(pacienteService);
  }

  @override
  void dispose() {
    reducer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const ListaPacientesPage(),
        '/cadastrar': (_) => const EditPaciente(),
        '/editar': (context) {
          final entity =
              ModalRoute.of(context)?.settings.arguments as PacienteEntity?;
          return EditPaciente(entity: entity);
        },
      },
    );
  }
}
