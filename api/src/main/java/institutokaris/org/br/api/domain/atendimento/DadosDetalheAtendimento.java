package institutokaris.org.br.api.domain.atendimento;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;

public record DadosDetalheAtendimento(Long id, Long pacienteId, @JsonFormat(pattern = "yyyy-MM-dd") LocalDate data, String descricao) {

    public DadosDetalheAtendimento(Atendimento atendimento) {
        this(atendimento.getId(), atendimento.getPaciente().getId(), atendimento.getData(), atendimento.getDescricao());
    }

}
