package institutokaris.org.br.api.infra.exception;

import institutokaris.org.br.api.domain.exception.ValidacaoException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;

@RestControllerAdvice
public class TratarExcecoes {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity tratarEntityNotFoundException() {
        return ResponseEntity.notFound().build();
    }

    @ExceptionHandler(SQLException.class)
    public ResponseEntity tratarSQLException() {
        return ResponseEntity.badRequest().build();
    }

    @ExceptionHandler(ValidacaoException.class)
    public ResponseEntity tratarValidacaoException(ValidacaoException ex) {
        return ResponseEntity.badRequest().body(ex.getMessage());
    }

}
