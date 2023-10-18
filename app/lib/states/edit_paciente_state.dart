sealed class PacienteEditState {
  const PacienteEditState();
}

class StartEditPacienteState extends PacienteEditState {
  const StartEditPacienteState();
}

class SavedPacienteState extends PacienteEditState {
  const SavedPacienteState();
}

class LoadingEditPacienteState extends PacienteEditState {
  const LoadingEditPacienteState();
}

class FailureEditPacienteState extends PacienteEditState {
  final String message;
  const FailureEditPacienteState(this.message);
}
