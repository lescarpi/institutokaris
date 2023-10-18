import 'package:app/dtos/paciente_dto.dart';
import 'package:app/entities/paciente_entity.dart';

class PacienteAdapter {
  PacienteAdapter._();

  static PacienteEntity fromMap(dynamic map) {
    return PacienteEntity(
      id: map['id'],
      nome: map['nome'] ?? '',
      cpf: map['cpf'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      telefone: map['telefone'] ?? '',
      dataDeNascimento: map['dataDeNascimento'],
      pessoasResidencia: map['pessoasResidencia'],
      pessoasResidenciaQueTrabalham: map['pessoasResidenciaQueTrabalham'],
      rendaFamilia: map['rendaFamilia'],
      comoConheceu: map['comoConheceu'],
    );
  }

  static PacienteDTO entityToDTO(PacienteEntity entity) {
    return PacienteDTO(
      id: entity.id,
      nome: entity.nome,
      cpf: entity.cpf,
      logradouro: entity.logradouro ?? '',
      bairro: entity.bairro ?? '',
      telefone: entity.telefone ?? '',
      dataDeNascimento: entity.dataDeNascimento ?? '',
      pessoasResidencia: entity.pessoasResidencia ?? 0,
      pessoasResidenciaQueTrabalham: entity.pessoasResidenciaQueTrabalham ?? 0,
      rendaFamilia: entity.rendaFamilia ?? '',
      comoConheceu: entity.comoConheceu ?? '',
    );
  }

  static Map<String, dynamic> entityToMap(PacienteEntity entity) {
    return {
      'nome': entity.nome,
      'cpf': entity.cpf,
    };
  }

  static Map<String, dynamic> dtoToCadastroMap(PacienteDTO dto) {
    return {
      'nome': dto.nome,
      'cpf': dto.cpf,
    };
  }

  static Map<String, dynamic> dtoToAtualizacaoMap(PacienteDTO dto) {
    return {
      'id': dto.id,
      'nome': dto.nome,
      'logradouro': dto.cpf,
      'bairro': dto.bairro,
      'telefone': dto.telefone,
    };
  }
}
