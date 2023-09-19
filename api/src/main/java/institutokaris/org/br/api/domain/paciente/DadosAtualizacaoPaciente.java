package institutokaris.org.br.api.domain.paciente;

import jakarta.validation.constraints.NotNull;

public record DadosAtualizacaoPaciente(
        @NotNull Long id,
        String nome,
        String logradouro,
        String bairro,
        String telefone
) {
}
