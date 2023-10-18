import 'package:app/atoms/paciente_atom.dart';
import 'package:app/states/paciente_state.dart';
import 'package:flutter/material.dart';

class ListaPacientesPage extends StatefulWidget {
  const ListaPacientesPage({super.key});

  @override
  State<ListaPacientesPage> createState() => _PacientePageState();
}

class _PacientePageState extends State<ListaPacientesPage> {
  @override
  void initState() {
    super.initState();

    pacienteState.value = const StartPacienteState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchPacientesAction.value = Object();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBar(
              padding: MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              leading: Icon(Icons.search),
              hintText: 'CPF do Paciente...',
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: pacienteState,
              builder: (context, child) {
                return switch (pacienteState.value) {
                  StartPacienteState _ => const SizedBox(),
                  LoadingPacienteState _ =>
                    const Center(child: CircularProgressIndicator()),
                  GettedPacienteState state => _gettedPacientes(state),
                  FailurePacienteState state => _failure(state),
                };
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewPaciente,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _gettedPacientes(GettedPacienteState state) {
    final pacientes = state.pacientes;
    return ListView.builder(
      itemCount: pacientes.length,
      itemBuilder: (_, index) {
        final paciente = pacientes[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('/editar', arguments: paciente);
          },
          title: Text(paciente.nome),
          subtitle: Text(paciente.cpf),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/editar', arguments: paciente);
            },
            icon: const Icon(Icons.expand_less),
          ),
        );
      },
    );
  }

  Widget _failure(FailurePacienteState state) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          fetchPacientesAction.value = Object();
        },
        child: Text(state.message),
      ),
    );
  }

  void _createNewPaciente() {
    Navigator.of(context).pushNamed('/cadastrar');
  }
}
