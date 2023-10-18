import 'package:app/adapters/paciente_adapter.dart';
import 'package:app/states/edit_paciente_state.dart';
import 'package:flutter/material.dart';
import '../atoms/paciente_atom.dart';
import 'package:app/dtos/paciente_dto.dart';
import 'package:app/entities/paciente_entity.dart';
import '../widgets/edit_text_input.dart';

class EditPaciente extends StatefulWidget {
  final PacienteEntity? entity;

  const EditPaciente({
    super.key,
    this.entity,
  });

  @override
  State<EditPaciente> createState() => _EditPacienteState();
}

class _EditPacienteState extends State<EditPaciente> {
  late PacienteDTO dto;

  bool get editable => widget.entity != null;

  @override
  void initState() {
    super.initState();
    if (widget.entity != null) {
      dto = PacienteAdapter.entityToDTO(widget.entity!);
    } else {
      dto = PacienteDTO();
    }
    editPacienteState.value = const StartEditPacienteState();
    editPacienteState.addListener(_listener);
  }

  _listener() {
    setState(() {});
    return switch (editPacienteState.value) {
      StartEditPacienteState state => state,
      SavedPacienteState _ => Navigator.of(context).pop(),
      LoadingEditPacienteState state => state,
      FailureEditPacienteState state => _showSnackError(state),
    };
  }

  void dispose() {
    editPacienteState.removeListener(_listener);
    super.dispose();
  }

  void _showSnackError(FailureEditPacienteState state) {
    final snackBar = SnackBar(
      content: Text(
        state.message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _save() {
    if (!dto.isValid()) {
      _showSnackError(const FailureEditPacienteState('Campos inválidos!'));
      return;
    }

    if (editable) {
      updatePacienteAction.value = dto.copy();
    } else {
      createPacienteAction.value = dto.copy();
    }
  }

  void _clear() {
    setState(() => dto = PacienteDTO(cpf: dto.cpf));
  }

  @override
  Widget build(BuildContext context) {
    final state = editPacienteState.value;

    final enabled = state is! LoadingEditPacienteState;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            EditTextInput(
              key: Key('name:$enabled${dto.hashCode}'),
              enabled: enabled,
              initialValue: dto.nome,
              hint: 'Nome',
              validator: dto.nomeValidate,
              onChanged: (value) => dto.nome = value,
            ),
            const SizedBox(height: 5),
            EditTextInput(
              key: Key('cpf:$enabled${dto.hashCode}'),
              enabled: enabled,
              initialValue: dto.cpf,
              hint: 'CPF',
              onChanged: (value) => dto.cpf = value,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                OutlinedButton(
                  onPressed: !enabled ? null : _save,
                  child: const Text('Salvar'),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: !enabled ? null : _clear,
                  child: const Text('Limpa'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
