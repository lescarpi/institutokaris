package institutokaris.org.br.api.controller;

import institutokaris.org.br.api.domain.tratamento.DadosInicioTratamento;
import institutokaris.org.br.api.domain.tratamento.TratamentoService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/tratamentos")
public class TratamentoController {

    @Autowired
    private TratamentoService service;

    @PostMapping("/inicio")
    @Transactional
    public void iniciar(@RequestBody @Valid DadosInicioTratamento dados) {
        service.iniciar(dados);
    }

    @DeleteMapping("/finalizar/{id}")
    @Transactional
    public void finalizar(@PathVariable Long id) {
        service.finalizar(id);
    }
}
