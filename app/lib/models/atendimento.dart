class Atendimento {
  late int pacienteId;
  late String data;
  late String descricao;

  Atendimento({
    required this.pacienteId,
    required this.data,
    required this.descricao,
  });

  Atendimento.empty();

  Atendimento.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() => {
        'pacienteId': pacienteId,
        'descricao': descricao,
      };

  List<String> toStringList() {
    List<String> lista = [];
    lista.add("Descrição: $descricao");
    lista.add("Data do atendimento: $data");
    return lista;
  }
}
