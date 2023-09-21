package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.paciente.*;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
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
    public ResponseEntity<?> detalhar(@PathVariable Long id) {
        Paciente paciente = repository.getReferenceById(id);

        return ResponseEntity.ok(new DadosDetalhePaciente(paciente));
    }

    @GetMapping("/lista")
    public ResponseEntity<Page<DadosDetalhePaciente>> listar(@PageableDefault(size = 10, sort = {"nome"}) Pageable paginacao) {
        Page<DadosDetalhePaciente> page = repository.findAll(paginacao).map(DadosDetalhePaciente::new);

        return ResponseEntity.ok(page);
    }

    @PutMapping("/atualiza")
    @Transactional
    public void atualizar(@RequestBody @Valid DadosAtualizacaoPaciente dados) {
        Paciente paciente = repository.getReferenceById(dados.id());
        paciente.atualizarInformacoes(dados);
    }

}
