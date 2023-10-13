import 'dart:ffi';
import 'dart:convert';

class Paciente {
  String nome;
  String cpf;
  String? logradouro;
  String? bairro;
  String? telefone;
  DateTime? dataDeNascimento;
  int? pessoasResidencia;
  int? pessoasResidenciaQueTrabalham;
  Float? rendaFamilia;
  String? comoConheceu;

  Paciente(
      {required this.nome,
      required this.cpf,
      required this.logradouro,
      required this.bairro,
      required this.telefone,
      required this.dataDeNascimento,
      required this.pessoasResidencia,
      required this.pessoasResidenciaQueTrabalham,
      required this.rendaFamilia,
      required this.comoConheceu});

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      nome: json['nome'],
      cpf: json['cpf'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      telefone: json['telefone'],
      dataDeNascimento: json['dataDeNascimento'],
      pessoasResidencia: json['pessoasResidencia'],
      pessoasResidenciaQueTrabalham: json['pessoasResidenciaQueTrabalham'],
      rendaFamilia: json['rendaFamilia'],
      comoConheceu: json['comoConheceu'],
    );
  }
}
