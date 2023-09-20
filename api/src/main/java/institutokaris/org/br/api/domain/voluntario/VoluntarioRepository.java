package institutokaris.org.br.api.domain.voluntario;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VoluntarioRepository extends JpaRepository<Voluntario, Long> {

    Optional<Voluntario> getReferenceByCpf(String cpf);

}
