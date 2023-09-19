package institutokaris.org.br.api.domain.paciente;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PacienteRepository extends JpaRepository<Paciente, Long> {

    Boolean existsByCpf(String cpf);

    Paciente findByCpf(String cpf);

}
