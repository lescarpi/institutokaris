import 'package:app/adapters/paciente_adapter.dart';
import 'package:app/dtos/paciente_dto.dart';
import 'package:app/entities/paciente_entity.dart';
import 'package:app/services/http_client_service.dart';

class PacienteService {
  final HttpClientService client;

  PacienteService(this.client);

  Future<List<PacienteEntity>> fetchPacientes() async {
    final response = await client.get('http://localhost:8181/pacientes/lista');
    return (response['content'] as List).map(PacienteAdapter.fromMap).toList();
  }

  Future<void> createPaciente(PacienteDTO dto) async {
    final data = PacienteAdapter.dtoToCadastroMap(dto);
    await client.post('http://localhost:8181/pacientes/cadastro', data);
  }

  Future<void> updatePaciente(PacienteDTO dto) async {
    final data = PacienteAdapter.dtoToAtualizacaoMap(dto);
    await client.put('http://localhost:8181/pacientes/atualiza', data);
  }
}
