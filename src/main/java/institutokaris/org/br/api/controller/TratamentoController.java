package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.tratamento.DadosInicioTratamento;
import institutokaris.org.br.api.domain.tratamento.IniciaTratamentoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/tratamentos")
public class TratamentoController {

    @Autowired
    private IniciaTratamentoService service;

    @PostMapping("/inicio")
    public void registrar(@RequestBody @Valid DadosInicioTratamento dados) {
        service.registrar(dados);
    }

}
