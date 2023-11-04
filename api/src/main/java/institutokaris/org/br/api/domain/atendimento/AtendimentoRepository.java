package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.paciente.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AtendimentoRepository extends JpaRepository<Atendimento, Long> {

    List<Atendimento> findByPaciente(Paciente paciente);

}
