import 'package:app2/models/atendimento.dart';
import 'package:app2/models/paciente.dart';
import 'package:app2/states/paciente_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CadastroAtendimentoPage extends StatefulWidget {
  final int pacienteId;

  const CadastroAtendimentoPage({super.key, required this.pacienteId});

  @override
  State<CadastroAtendimentoPage> createState() =>
      _CadastroAtendimentoPageState();
}

class _CadastroAtendimentoPageState extends State<CadastroAtendimentoPage> {
  late PacienteState pacienteState;
  late Paciente paciente;
  final _formKey = GlobalKey<FormState>();

  final descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pacienteState = context.watch<PacienteState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Registro Atendimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição*',
                ),
                validator: (descricao) {
                  if (descricao == null || descricao.isEmpty) {
                    return 'Digite a descrição.';
                  }
                  return null;
                },
              ),
              _separador(),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registrarAtendimento();
                    }
                  },
                  child: const Text('Registrar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  registrarAtendimento() async {
    Atendimento atendimento = Atendimento(
      pacienteId: widget.pacienteId,
      data: "${DateTime.now().toLocal()}".split(' ')[0],
      descricao: descricaoController.text,
    );

    await pacienteState.registrarAtendimento(atendimento);
    mostrarDetalhes(atendimento);
  }

  mostrarDetalhes(Atendimento atendimento) {
    context.pop();
    context.push('/paciente/atendimento', extra: atendimento);
  }

  _separador() {
    return const SizedBox(
      height: 20,
    );
  }
}
