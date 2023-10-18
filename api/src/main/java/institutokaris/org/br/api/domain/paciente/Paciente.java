package institutokaris.org.br.api.domain.paciente;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Table(name = "pacientes")
@Entity(name = "Paciente")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Paciente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String cpf;

    private String logradouro;
    private String bairro;
    private String telefone;
    private LocalDate dataDeNascimento;
    private Integer pessoasResidencia;
    private Integer pessoasResidenciaQueTrabalham;
    private String rendaFamilia;
    private String comoConheceu;

    public Paciente(DadosCadastroPaciente dados) {
        this.nome = dados.nome();
        // Retira máscara do CPF
        this.cpf = dados.cpf().replaceAll("[^0-9]", "");
        this.logradouro = dados.logradouro();
        this.bairro = dados.bairro();
        this.telefone = dados.telefone();
        this.dataDeNascimento = dados.dataDeNascimento();
        this.pessoasResidencia = dados.pessoasResidencia();
        this.pessoasResidenciaQueTrabalham = dados.pessoasResidenciaQueTrabalham();
        this.rendaFamilia = dados.rendaFamilia();
        this.comoConheceu = dados.comoConheceu();
    }

    public void atualizarInformacoes(DadosAtualizacaoPaciente dados) {
        if (dados.nome() != null) {
            this.nome = dados.nome();
        }
        if (dados.logradouro() != null) {
            this.logradouro = dados.logradouro();
        }
        if (dados.bairro() != null) {
            this.bairro = dados.bairro();
        }
        if (dados.telefone() != null) {
            this.telefone = dados.telefone();
        }
    }

}
