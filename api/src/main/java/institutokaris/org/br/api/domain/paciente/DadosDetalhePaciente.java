package institutokaris.org.br.api.domain.paciente;

import java.time.LocalDate;

public record DadosDetalhePaciente(String nome, String cpf, String logradouro, String bairro, String telefone,
                                   LocalDate dataDeNascimento, Integer pessoasResidencia, Integer pessoasResidenciaQueTrabalham,
                                   String rendaFamilia, String comoConheceu) {

    public DadosDetalhePaciente(Paciente paciente) {
        this(paciente.getNome(), paciente.getCpf(), paciente.getLogradouro(), paciente.getBairro(),
                paciente.getTelefone(), paciente.getDataDeNascimento(), paciente.getPessoasResidencia(), paciente.getPessoasResidenciaQueTrabalham(),
                paciente.getRendaFamilia(), paciente.getComoConheceu());
    }

}
