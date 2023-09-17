package institutokaris.org.br.api.domain.paciente;

public record DadosDetalhePaciente(Long id, String nome, String cpf) {

    public DadosDetalhePaciente(Paciente paciente) {
        this(paciente.getId(), paciente.getNome(), paciente.getCpf());
    }

}
