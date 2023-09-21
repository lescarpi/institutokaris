package institutokaris.org.br.api.domain.paciente;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PacienteRepository extends JpaRepository<Paciente, Long> {

    Boolean existsByCpf(String cpf);

    Optional<Paciente> getReferenceByCpf(String cpf);

    Paciente findByCpf(String cpf);

}
