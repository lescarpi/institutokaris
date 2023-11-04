import 'package:app2/models/paciente_card.dart';
import 'package:app2/services/http_util.dart';
import 'package:flutter/material.dart';

class ListaState extends ChangeNotifier {
  HttpUtil httpUtil = HttpUtil();

  final List<PacienteCard> _pacientes = [];

  List<PacienteCard> get pacientes => _pacientes;

  getListaPacientes() async {
    _pacientes.clear();
    final response = await httpUtil.get('pacientes/lista');
    for (final paciente in (response['content'] as List)) {
      _pacientes.add(PacienteCard.fromJsom(paciente));
    }
    notifyListeners();
  }
}
