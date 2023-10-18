import 'package:app/dtos/paciente_dto.dart';
import 'package:app/states/edit_paciente_state.dart';
import 'package:app/states/paciente_state.dart';
import 'package:flutter/material.dart';

// Atom
final pacienteState = ValueNotifier<PacienteState>(const StartPacienteState());
final editPacienteState =
    ValueNotifier<PacienteEditState>(const StartEditPacienteState());

// Actions
final fetchPacientesAction = ValueNotifier(Object());
final createPacienteAction = ValueNotifier<PacienteDTO>(PacienteDTO());
final updatePacienteAction = ValueNotifier<PacienteDTO>(PacienteDTO());
final deletePacienteAction = ValueNotifier<String>('');
