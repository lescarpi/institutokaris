package institutokaris.org.br.api.domain.voluntario;

public record DadosDetalheVoluntario(String nome, String cpf, String instituicao) {

    public DadosDetalheVoluntario(Voluntario voluntario) {
        this(voluntario.getNome(), voluntario.getCpf(), voluntario.getInstituicao());
    }

}
