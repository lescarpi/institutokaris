package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.voluntario.DadosCadastroVoluntario;
import institutokaris.org.br.api.domain.voluntario.DadosDetalheVoluntario;
import institutokaris.org.br.api.domain.voluntario.Voluntario;
import institutokaris.org.br.api.domain.voluntario.VoluntarioRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/voluntarios")
public class VoluntarioController {

    @Autowired
    private VoluntarioRepository repository;

    @PostMapping("/cadastro")
    @Transactional
    public void cadastrar(@RequestBody @Valid DadosCadastroVoluntario dados) {
        Voluntario voluntario = new Voluntario(dados);
        repository.save(voluntario);
    }

    @GetMapping("/detalhe/{cpf}")
    public ResponseEntity detalhar(@PathVariable String cpf) {
        Voluntario voluntario = repository.getReferenceByCpf(cpf);

        return ResponseEntity.ok(new DadosDetalheVoluntario(voluntario));
    }

    @GetMapping("lista")
    public ResponseEntity<Page<DadosDetalheVoluntario>> listar(@PageableDefault(size = 10, sort = {"nome"})Pageable paginacao) {
        Page<DadosDetalheVoluntario> page = repository.findAll(paginacao).map(DadosDetalheVoluntario::new);

        return ResponseEntity.ok(page);
    }

}
