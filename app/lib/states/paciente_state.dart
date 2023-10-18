import 'package:app/entities/paciente_entity.dart';

sealed class PacienteState {
  const PacienteState();
}

class StartPacienteState extends PacienteState {
  const StartPacienteState();
}

class GettedPacienteState extends PacienteState {
  final List<PacienteEntity> pacientes;

  const GettedPacienteState(this.pacientes);
}

class LoadingPacienteState extends PacienteState {
  const LoadingPacienteState();
}

class FailurePacienteState extends PacienteState {
  final String message;
  const FailurePacienteState(this.message);
}
