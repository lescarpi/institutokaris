package institutokaris.org.br.api.domain.voluntario;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "voluntarios")
@Entity(name = "Voluntario")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Voluntario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    @Column(unique = true)
    private String cpf;

    private String instituicao;

    public Voluntario(DadosCadastroVoluntario dados) {
        this.nome = dados.nome();
        // Retira máscara do CPF
        this.cpf = dados.cpf().replaceAll("[^0-9]", "");
        this.instituicao = dados.instituicao();
    }

}
