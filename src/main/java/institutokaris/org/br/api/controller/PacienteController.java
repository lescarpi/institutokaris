package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.paciente.DadosCadastroPaciente;
import institutokaris.org.br.api.domain.paciente.DadosDetalhePaciente;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/pacientes")
public class PacienteController {

    @Autowired
    private PacienteRepository repository;

    @PostMapping("/cadastro")
    @Transactional
    public void cadastrar(@RequestBody @Valid DadosCadastroPaciente dados) {
        Paciente paciente = new Paciente(dados);
        repository.save(paciente);
    }

    @GetMapping("/detalhe/{id}")
    public ResponseEntity detalhar(@PathVariable Long id) {
        Paciente paciente = repository.getReferenceById(id);

        return ResponseEntity.ok(new DadosDetalhePaciente(paciente));
    }

}
