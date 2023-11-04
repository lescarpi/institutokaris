import 'package:app2/models/atendimento.dart';
import 'package:app2/states/paciente_state.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetalhePacientePage extends StatefulWidget {
  final int pacienteId;

  const DetalhePacientePage({super.key, required this.pacienteId});

  @override
  State<DetalhePacientePage> createState() => _DetalhePacientePageState();
}

class _DetalhePacientePageState extends State<DetalhePacientePage> {
  late PacienteState pacienteState;
  late List<String> pacienteDataList;
  late List<Atendimento> atendimentos;

  @override
  void initState() {
    super.initState();
    context.read<PacienteState>().getPaciente(widget.pacienteId);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    pacienteState = context.watch<PacienteState>();
    pacienteDataList = pacienteState.paciente.toStringList();
    atendimentos = pacienteState.atendimentos;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Paciente'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshPage(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                  ),
                  header: const Text('Informações do Paciente'),
                  collapsed: const Text(''),
                  expanded: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final String data = pacienteDataList[index];
                      return ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        title: Text(data),
                      );
                    },
                    padding: const EdgeInsets.all(12),
                    itemCount: pacienteDataList.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                  ),
                  header: const Text('Atendimentos'),
                  collapsed: const Text(''),
                  expanded: atendimentos.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text('Não há atendimentos.'),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            final atendimento = atendimentos[index];
                            return ListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              onTap: () => mostrarDetalhes(atendimento),
                              title: Text(atendimento.data),
                              subtitle: Text(atendimento.descricao),
                            );
                          },
                          padding: const EdgeInsets.all(12),
                          separatorBuilder: (_, ___) => const Divider(),
                          itemCount: atendimentos.length,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'editarPaciente',
            onPressed: () => {},
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            heroTag: 'registrarAtendimento',
            onPressed: () => registrarAtendimento(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  mostrarDetalhes(Atendimento atendimento) {
    context.push('/paciente/atendimento', extra: atendimento);
  }

  registrarAtendimento() {
    context
        .push('/paciente/atendimento/registro', extra: widget.pacienteId)
        .then((_) => _refreshPage());
  }

  _fetchData() {
    context.read<PacienteState>().getPaciente(widget.pacienteId);
    context.read<PacienteState>().getAtendimentos(widget.pacienteId);
  }

  _refreshPage() {
    _fetchData();
  }
}
