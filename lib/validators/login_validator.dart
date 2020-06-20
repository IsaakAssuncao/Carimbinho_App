import 'dart:async';

class LoginValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('insira um e-mail válido');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('senha inválida, deve-se conter pelo menos 5 caracteres');
    }
  });

  final validatePasswordCheck = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordCheck, sink) {
    if (passwordCheck.length >= 6) {
      sink.add(passwordCheck);
    } else {
      sink.addError('senhas não são equivalentes');
    }
  });

  final validateNewUserChecked =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (newUser, sink) {
    (newUser) ? sink.add(newUser) : sink.addError('erro ao checar novo usário');
  });
}
