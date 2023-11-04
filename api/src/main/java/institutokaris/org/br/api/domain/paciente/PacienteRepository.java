package institutokaris.org.br.api.domain.paciente;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PacienteRepository extends JpaRepository<Paciente, Long> {

    Boolean existsByCpf(String cpf);

    Optional<Paciente> getReferenceByCpf(String cpf);

    @Query(value = "SELECT p FROM Paciente p WHERE p.id = ?1")
    Optional<Paciente> getReferenceByPacienteId(Long id);

    Paciente findByCpf(String cpf);

}
