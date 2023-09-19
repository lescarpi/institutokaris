package institutokaris.org.br.api.domain.voluntario;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record DadosCadastroVoluntario(
        @NotBlank
        String nome,

        @Pattern(regexp = "([0-9]{3}[\\.]?[0-9]{3}[\\.]?[0-9]{3}[\\-]?[0-9]{2})")
        String cpf,

        String instituicao
) {
}
