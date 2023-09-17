package institutokaris.org.br.api.domain.paciente;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record DadosCadastroPaciente(

        @NotBlank
        String nome,

        @Pattern(regexp = "([0-9]{3}[\\.]?[0-9]{3}[\\.]?[0-9]{3}[\\-]?[0-9]{2})")
        String cpf
) {
}
