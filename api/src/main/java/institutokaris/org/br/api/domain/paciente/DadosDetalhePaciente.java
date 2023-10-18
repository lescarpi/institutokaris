package institutokaris.org.br.api.domain.paciente;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;

public record DadosDetalhePaciente(Long id, String nome, String cpf, String logradouro, String bairro, String telefone,
                                   @JsonFormat(pattern = "yyyy-MM-dd") LocalDate dataDeNascimento, Integer pessoasResidencia,
                                   Integer pessoasResidenciaQueTrabalham, String rendaFamilia, String comoConheceu) {

    public DadosDetalhePaciente(Paciente paciente) {
        this(paciente.getId(), paciente.getNome(), paciente.getCpf(), paciente.getLogradouro(), paciente.getBairro(),
                paciente.getTelefone(), paciente.getDataDeNascimento(), paciente.getPessoasResidencia(), paciente.getPessoasResidenciaQueTrabalham(),
                paciente.getRendaFamilia(), paciente.getComoConheceu());
    }

}
