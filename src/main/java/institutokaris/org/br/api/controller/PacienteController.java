package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.paciente.DadosCadastroPaciente;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/pacientes")
public class PacienteController {

    @Autowired
    private PacienteRepository repository;

    @PostMapping("/cadastro")
    @Transactional
    public void cadastrar(@RequestBody DadosCadastroPaciente dados) {
        Paciente paciente = new Paciente(dados);
        repository.save(paciente);
    }

}
