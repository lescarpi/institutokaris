package institutokaris.org.br.api.infra.exception;

import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class TratarExcecoes {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity tratarEntityNotFoundException() {
        return ResponseEntity.notFound().build();
    }

}
