package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.tratamento.Tratamento;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Table(name = "atendimentos")
@Entity(name = "Atendimento")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Atendimento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;

    private LocalDate data;
    private String descricao;

    public Atendimento(Paciente paciente, String descricao) {
        this.paciente = paciente;
        this.data = LocalDate.now();
        this.descricao = descricao;
    }

}
