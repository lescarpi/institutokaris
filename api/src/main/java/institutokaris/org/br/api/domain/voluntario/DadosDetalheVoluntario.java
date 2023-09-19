package institutokaris.org.br.api.domain.voluntario;

public record DadosDetalheVoluntario(Long id, String nome, String cpf, String instituicao) {

    public DadosDetalheVoluntario(Voluntario voluntario) {
        this(voluntario.getId(), voluntario.getNome(), voluntario.getCpf(), voluntario.getInstituicao());
    }

}
