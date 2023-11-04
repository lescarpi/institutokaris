import 'package:app2/models/atendimento.dart';
import 'package:app2/pages/cadastro_atendimento_page.dart';
import 'package:app2/pages/cadastro_paciente_page.dart';
import 'package:app2/pages/detalhe_atendimento_page.dart';
import 'package:app2/pages/detalhe_paciente_page.dart';
import 'package:app2/pages/lista_pacientes_page.dart';
import 'package:app2/states/lista_state.dart';
import 'package:app2/states/paciente_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListaState()),
        ChangeNotifierProvider(create: (context) => PacienteState()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const ListaPacientesPage(),
        routes: [
          GoRoute(
              path: "paciente",
              builder: (context, state) {
                final int pacienteId = state.extra! as int;
                return DetalhePacientePage(pacienteId: pacienteId);
              },
              routes: [
                GoRoute(
                  path: 'cadastro',
                  builder: (context, state) => const CadastroPacientePage(),
                ),
                GoRoute(
                    path: 'atendimento',
                    builder: (context, state) {
                      final Atendimento atendimento =
                          state.extra! as Atendimento;
                      return DetalheAtendimentoPage(atendimento: atendimento);
                    },
                    routes: [
                      GoRoute(
                          path: 'registro',
                          builder: (context, state) {
                            final int pacienteId = state.extra! as int;
                            return CadastroAtendimentoPage(
                                pacienteId: pacienteId);
                          }),
                    ]),
              ]),
        ]),
  ],
);
