package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.atendimento.*;
import institutokaris.org.br.api.domain.exception.ValidacaoException;
import institutokaris.org.br.api.domain.paciente.Paciente;
import institutokaris.org.br.api.domain.paciente.PacienteRepository;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/atendimentos")
public class AtendimentoController {

    @Autowired
    private RegistraAtendimentoService service;

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private PacienteRepository pacienteRepository;

    @PostMapping("/registro")
    @Transactional
    public ResponseEntity<?> registrar(@RequestBody @Valid DadosRegistroAtendimento dados) {
        Long atendimentoId = service.registrar(dados);
        return ResponseEntity.ok(new ResponseRegistroAtendimento(atendimentoId));
    }

    @GetMapping("/lista/{pacienteId}")
    public ResponseEntity<?> lista(@PathVariable Long pacienteId) {
        Optional<Paciente> paciente = pacienteRepository.getReferenceByPacienteId(pacienteId);

        if (paciente.isEmpty()) {
            throw new ValidacaoException("Não existe paciente com esse ID!");
        }

        List<Atendimento> atendimentos = atendimentoRepository.findByPaciente(paciente.get());

        List<DadosDetalheAtendimento> dadosDetalheAtendimentos = atendimentos.stream()
                .map(DadosDetalheAtendimento::new)
                .toList();

        return ResponseEntity.ok(dadosDetalheAtendimentos);
    }

}
