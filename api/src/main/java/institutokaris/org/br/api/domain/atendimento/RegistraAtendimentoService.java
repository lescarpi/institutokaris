package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.exception.ValidacaoException;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import institutokaris.org.br.api.domain.tratamento.Tratamento;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class RegistraAtendimentoService {

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    public void registrar(DadosRegistroAtendimento dados) {
        if (!pacienteRepository.existsById(dados.pacienteId())) {
            throw new ValidacaoException("Não existe paciente com esse ID");
        }
        Paciente paciente = pacienteRepository.getReferenceById(dados.pacienteId());
        Atendimento atendimento = new Atendimento(paciente, dados.descricao());
        atendimento.setData(LocalDate.now());

        atendimentoRepository.save(atendimento);
    }

}
