import 'package:app/dtos/dto.dart';
import 'package:app/dtos/paciente_validate_mixin.dart';

class PacienteDTO extends DTO with PacienteValidate {
  int id;
  String nome;
  String cpf;
  String logradouro;
  String bairro;
  String telefone;
  String dataDeNascimento;
  int pessoasResidencia;
  int pessoasResidenciaQueTrabalham;
  String rendaFamilia;
  String comoConheceu;

  PacienteDTO({
    this.id = -1,
    this.nome = '',
    this.cpf = '',
    this.logradouro = '',
    this.bairro = '',
    this.telefone = '',
    this.dataDeNascimento = '',
    this.pessoasResidencia = 0,
    this.pessoasResidenciaQueTrabalham = 0,
    this.rendaFamilia = '',
    this.comoConheceu = '',
  });

  PacienteDTO copy() {
    return PacienteDTO(
      id: id,
      nome: nome,
      cpf: cpf,
      logradouro: logradouro,
      bairro: bairro,
      telefone: telefone,
      dataDeNascimento: dataDeNascimento,
      pessoasResidencia: pessoasResidencia,
      pessoasResidenciaQueTrabalham: pessoasResidenciaQueTrabalham,
      rendaFamilia: rendaFamilia,
      comoConheceu: comoConheceu,
    );
  }

  @override
  void validate() {
    nomeValidate(nome);
  }
}
