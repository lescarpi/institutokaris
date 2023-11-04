import 'package:app2/models/atendimento.dart';
import 'package:app2/models/paciente.dart';
import 'package:app2/services/http_util.dart';
import 'package:flutter/material.dart';

class PacienteState extends ChangeNotifier {
  HttpUtil httpUtil = HttpUtil();

  Paciente _paciente = Paciente.empty();
  final List<Atendimento> _atendimentos = [];

  Paciente get paciente => _paciente;

  List<Atendimento> get atendimentos => _atendimentos;

  getPaciente(int id) async {
    final response = await httpUtil.get('/pacientes/detalhe/$id');
    _paciente = Paciente.fromJson(response);
    notifyListeners();
  }

  Future<int> cadastrarPaciente(Paciente paciente) async {
    final response =
        await httpUtil.post('/pacientes/cadastro', paciente.toJson());
    return response['id'];
  }

  getAtendimentos(int pacienteId) async {
    _atendimentos.clear();
    final response = await httpUtil.get('/atendimentos/lista/$pacienteId');
    for (final atendimento in response as List) {
      _atendimentos.add(Atendimento.fromJson(atendimento));
    }
    notifyListeners();
  }

  Future<int> registrarAtendimento(Atendimento atendimento) async {
    final response =
        await httpUtil.post('/atendimentos/registro', atendimento.toJson());
    return response['atendimentoId'];
  }
}
