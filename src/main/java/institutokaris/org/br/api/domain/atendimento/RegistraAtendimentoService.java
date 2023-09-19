package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.exception.ValidacaoException;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistraAtendimentoService {


    private final PacienteRepository pacienteRepository;

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    public RegistraAtendimentoService(PacienteRepository pacienteRepository) {
        this.pacienteRepository = pacienteRepository;
    }

    public void registrar(DadosRegistroAtendimento dados) {
        if (!pacienteRepository.existsByCpf(dados.cpf())) {
            throw new ValidacaoException("Não existe paciente com esse CPF!");
        }

        Paciente paciente = pacienteRepository.findByCpf(dados.cpf());
        Atendimento atendimento = new Atendimento(paciente, dados.especialidade());

        atendimentoRepository.save(atendimento);
    }

}
