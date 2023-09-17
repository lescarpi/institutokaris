package institutokaris.org.br.api.domain.paciente;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

import java.time.LocalDate;

public record DadosCadastroPaciente(
        @NotBlank
        String nome,

        @Pattern(regexp = "([0-9]{3}[\\.]?[0-9]{3}[\\.]?[0-9]{3}[\\-]?[0-9]{2})")
        String cpf,

        @NotBlank
        String logradouro,

        @NotBlank
        String bairro,

        @NotBlank
        String telefone,

        @NotNull
        @JsonFormat(pattern = "dd/MM/yyyy")
        LocalDate dataDeNascimento,

        @NotNull
        Integer pessoasResidencia,

        @NotNull
        Integer pessoasResidenciaQueTrabalham,

        @NotBlank
        String rendaFamilia,

        @NotBlank
        String comoConheceu
) {
}
