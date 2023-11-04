import 'package:app2/models/paciente_card.dart';
import 'package:app2/states/lista_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListaPacientesPage extends StatefulWidget {
  const ListaPacientesPage({super.key});

  @override
  State<ListaPacientesPage> createState() => _ListaPacientesPageState();
}

class _ListaPacientesPageState extends State<ListaPacientesPage> {
  late ListaState listaState;
  late List<PacienteCard> pacientes;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    listaState = context.watch<ListaState>();
    pacientes = listaState.pacientes;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Pacientes'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshPage(),
        child: pacientes.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final paciente = pacientes[index];
                  return ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    title: Text(
                      paciente.nome,
                    ),
                    subtitle: Text("CPF: ${paciente.cpf}"),
                    onTap: () => mostrarDetalhes(paciente.id),
                  );
                },
                padding: const EdgeInsets.all(12),
                separatorBuilder: (_, ___) => const Divider(),
                itemCount: pacientes.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cadastrarPaciente(),
        child: const Icon(Icons.add),
      ),
    );
  }

  mostrarDetalhes(int pacienteId) {
    context.push('/paciente', extra: pacienteId);
  }

  cadastrarPaciente() {
    context.push('/paciente/cadastro').then((_) => _refreshPage());
  }

  _fetchData() {
    context.read<ListaState>().getListaPacientes();
  }

  _refreshPage() {
    _fetchData();
  }
}
