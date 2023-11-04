class PacienteCard {
  late int id;
  late String nome;
  late String cpf;

  PacienteCard({required this.id, required this.nome, required this.cpf});

  PacienteCard.fromJsom(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
  }
}
