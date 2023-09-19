package institutokaris.org.br.api.domain.atendimento;

import institutokaris.org.br.api.domain.exception.ValidacaoException;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import institutokaris.org.br.api.domain.tratamento.Tratamento;
import institutokaris.org.br.api.domain.tratamento.TratamentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegistraAtendimentoService {

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private TratamentoRepository tratamentoRepository;

    public void registrar(DadosRegistroAtendimento dados) {
        if (!tratamentoRepository.existsById(dados.tratamentoId())) {
            throw new ValidacaoException("Não existe tratamento com esse ID");
        }
        Tratamento tratamento = tratamentoRepository.getReferenceById(dados.tratamentoId());
        Atendimento atendimento = new Atendimento(tratamento, dados.descricao());

        atendimentoRepository.save(atendimento);
    }

}
