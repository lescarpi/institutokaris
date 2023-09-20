package institutokaris.org.br.api.domain.voluntario;

import org.springframework.data.jpa.repository.JpaRepository;

public interface VoluntarioRepository extends JpaRepository<Voluntario, Long> {

    Voluntario getReferenceByCpf(String cpf);

}
