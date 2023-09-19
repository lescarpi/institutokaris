package institutokaris.org.br.api.domain.tratamento;

import institutokaris.org.br.api.domain.exception.ValidacaoException;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TratamentoService {

    @Autowired
    private PacienteRepository pacienteRepository;

    @Autowired
    private TratamentoRepository tratamentoRepository;

    public void iniciar(DadosInicioTratamento dados) {
        if (!pacienteRepository.existsByCpf(dados.cpf())) {
            throw new ValidacaoException("Não existe paciente com esse CPF!");
        }
        Paciente paciente = pacienteRepository.findByCpf(dados.cpf());
        Tratamento tratamento = new Tratamento(paciente, dados.especialidade());

        tratamentoRepository.save(tratamento);
    }

    public void finalizar(Long id) {
        if (!tratamentoRepository.existsById(id)) {
            throw new ValidacaoException("Não existe tratamento com esse ID!");
        }
        Tratamento tratamento = tratamentoRepository.getReferenceById(id);
        tratamento.finalizar();
    }

}
