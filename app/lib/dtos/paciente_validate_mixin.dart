import 'package:app/exceptions/validate_exception.dart';

mixin class PacienteValidate {
  void nomeValidate(String nome) {
    if (nome.isEmpty) {
      throw 'Nome não pode ser vazio!'.asException();
    }
  }
}
