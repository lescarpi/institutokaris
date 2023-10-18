class PacienteEntity {
  final int id;
  final String nome;
  final String cpf;
  final String? logradouro;
  final String? bairro;
  final String? telefone;
  final String? dataDeNascimento;
  final int? pessoasResidencia;
  final int? pessoasResidenciaQueTrabalham;
  final String? rendaFamilia;
  final String? comoConheceu;

  PacienteEntity(
      {required this.id,
      required this.nome,
      required this.cpf,
      required this.logradouro,
      required this.bairro,
      required this.telefone,
      required this.dataDeNascimento,
      required this.pessoasResidencia,
      required this.pessoasResidenciaQueTrabalham,
      required this.rendaFamilia,
      required this.comoConheceu});
}
