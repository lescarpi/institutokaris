class Paciente {
  late int id;
  late String nome;
  late String cpf;
  late String logradouro;
  late String bairro;
  late String telefone;
  late String dataDeNascimento;
  late int pessoasResidencia;
  late int pessoasResidenciaQueTrabalham;
  late String rendaFamilia;
  late String comoConheceu;
  bool isNull = true;

  Paciente(
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
      required this.comoConheceu,
      this.isNull = false});

  Paciente.empty();

  Paciente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    logradouro = json['logradouro'] ?? '';
    bairro = json['bairro'] ?? '';
    telefone = json['telefone'] ?? '';
    dataDeNascimento = json['dataDeNascimento'] ?? '';
    pessoasResidencia = json['pessoasResidencia'] ?? 0;
    pessoasResidenciaQueTrabalham = json['pessoasResidenciaQueTrabalham'] ?? 0;
    rendaFamilia = json['rendaFamilia'] ?? '';
    comoConheceu = json['comoConheceu'] ?? '';
    isNull = false;
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'cpf': cpf,
        'logradouro': logradouro,
        'bairro': bairro,
        'telefone': telefone,
        'dataDeNascimento': dataDeNascimento,
        'pessoasResidencia': pessoasResidencia,
        'pessoasResidenciaQueTrabalham': pessoasResidenciaQueTrabalham,
        'rendaFamilia': rendaFamilia,
        'comoConheceu': comoConheceu,
      };

  List<String> toStringList() {
    List<String> lista = [];
    lista.add("Nome: ${nome}");
    lista.add("CPF: ${cpf}");
    lista.add("Logradouro: ${logradouro}");
    lista.add("Bairro: ${bairro}");
    lista.add("Telefone: ${telefone}");
    lista.add("Data de Nascimento: ${dataDeNascimento}");
    lista.add("Quantas pessoas moram na residência: ${pessoasResidencia}");
    lista.add(
        "Quantas pessoas trabalham na residência: ${pessoasResidenciaQueTrabalham}");
    lista.add("Renda familiar: ${rendaFamilia}");
    lista.add("Como conheceu o Instituto: ${comoConheceu}");

    return lista;
  }
}
