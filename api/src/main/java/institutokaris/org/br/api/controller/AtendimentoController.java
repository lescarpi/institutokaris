package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.atendimento.DadosRegistroAtendimento;
import institutokaris.org.br.api.domain.atendimento.RegistraAtendimentoService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/atendimentos")
public class AtendimentoController {

    @Autowired
    private RegistraAtendimentoService service;

    @PostMapping("/registro")
    @Transactional
    public void registrar(@RequestBody @Valid DadosRegistroAtendimento dados) {
        service.registrar(dados);
    }

}
