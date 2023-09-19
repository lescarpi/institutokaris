package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.tratamento.Tratamento;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Table(name = "atendimentos")
@Entity(name = "Atendimento")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Atendimento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tratamento_id")
    private Tratamento tratamento;

    private LocalDate data;
    private String descricao;

    public Atendimento(Tratamento tratamento, String descricao) {
        this.tratamento = tratamento;
        this.data = LocalDate.now();
        this.descricao = descricao;
    }

}
