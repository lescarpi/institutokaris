import 'package:app/atoms/paciente_atom.dart';
import 'package:app/services/paciente_service.dart';
import 'package:app/states/edit_paciente_state.dart';
import 'package:app/states/paciente_state.dart';

class PacienteReducer {
  final PacienteService service;

  PacienteReducer(this.service) {
    fetchPacientesAction.addListener(_fetchPaciente);
    createPacienteAction.addListener(_createPaciente);
    updatePacienteAction.addListener(_updatePaciente);
  }

  void _fetchPaciente() async {
    pacienteState.value = const LoadingPacienteState();
    try {
      final pacientes = await service.fetchPacientes();
      pacienteState.value = GettedPacienteState(pacientes);
    } catch (ex) {
      pacienteState.value = FailurePacienteState(ex.toString());
    }
  }

  void _createPaciente() async {
    try {
      final dto = createPacienteAction.value;
      await service.createPaciente(dto);
      editPacienteState.value = const SavedPacienteState();

      _fetchPaciente();
    } catch (ex) {
      editPacienteState.value = FailureEditPacienteState(ex.toString());
    }
  }

  void _updatePaciente() async {
    try {
      final dto = updatePacienteAction.value;
      await service.updatePaciente(dto);
      editPacienteState.value = const SavedPacienteState();

      _fetchPaciente();
    } catch (ex) {
      editPacienteState.value = FailureEditPacienteState(ex.toString());
    }
  }

  void dispose() {
    fetchPacientesAction.removeListener(_fetchPaciente);
  }
}
