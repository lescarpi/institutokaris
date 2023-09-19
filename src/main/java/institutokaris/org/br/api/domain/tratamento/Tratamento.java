package institutokaris.org.br.api.domain.tratamento;

import institutokaris.org.br.api.domain.paciente.Paciente;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Table(name = "tratamentos")
@Entity(name = "Tratamento")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Tratamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;

    private LocalDate dataInicio;
    private LocalDate dataFim;
    private String especialidade;

    public Tratamento(Paciente paciente, String especialidade) {
        this.paciente = paciente;
        dataInicio = LocalDate.now();
        this.especialidade = especialidade;
    }

}
