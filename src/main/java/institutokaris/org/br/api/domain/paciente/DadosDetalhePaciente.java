package institutokaris.org.br.api.domain.paciente;

import java.time.LocalDate;

public record DadosDetalhePaciente(Long id, String nome, String cpf, String logradouro, String bairro, String telefone,
                                   LocalDate dataDeNascimento, Integer pessoasResidencia, Integer pessoasResidenciaQueTrabalham,
                                   String rendaFamilia, String comoConheceu) {

    public DadosDetalhePaciente(Paciente paciente) {
        this(paciente.getId(), paciente.getNome(), paciente.getCpf(), paciente.getLogradouro(), paciente.getBairro(),
                paciente.getTelefone(), paciente.getDataDeNascimento(), paciente.getPessoasResidencia(), paciente.getPessoasResidenciaQueTrabalham(),
                paciente.getRendaFamilia(), paciente.getComoConheceu());
    }

}
