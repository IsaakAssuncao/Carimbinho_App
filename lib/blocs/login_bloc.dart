import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/controllers/auth/auth_controller.dart';
import 'package:flutterappstamp/enums/app_enums.dart';
import 'package:flutterappstamp/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Disposable with LoginValidator {
  final _emailController = new BehaviorSubject<String>();
  final _passwordController = new BehaviorSubject<String>();
  final _passwordCheckController = new BehaviorSubject<String>();
  final _newUserCheckedController = new BehaviorSubject<bool>();
  final _loginStateController = new BehaviorSubject<LoginState>();
  final _errorMessage = new BehaviorSubject<String>();

  var _authController = Modular.get<AuthController>();

  LoginBloc() {
    _newUserCheckedController.add(false);
    _errorMessage.value = '';
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _passwordCheckController.close();
    _newUserCheckedController.close();
    _loginStateController.close();
    _errorMessage.close();
  }

  String get errorMessage => _errorMessage.value;

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changePasswordCheck => _passwordCheckController.sink.add;

  Function(String) get changeErrorMessage => _errorMessage.sink.add;

  Stream<String> get outMessageError =>
      _errorMessage.stream.doOnData((event) {});

  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail).doOnData((event) {
        _errorMessage.add('');
      });

  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword).doOnData((event) {
        _errorMessage.add('');
      });

  Stream<String> get outPasswordCheck => _passwordCheckController.stream
          .transform(validatePasswordCheck)
          .doOnData((event) {
        _errorMessage.add('');
      });

  Stream<bool> get outNewUserChecked => _newUserCheckedController
          .transform(validateNewUserChecked)
          .doOnData((event) {
        if (event) {
          _passwordCheckController.addError('');
        }
      });

  Function(bool) get changeNewUserChecked => _newUserCheckedController.add;

  Stream<bool> get outSubmitedValid =>
      Rx.combineLatest2(outEmail, outPassword, (a, b) => true);

  Stream<bool> get outPasswordAreEqual {
    print('${_passwordController.value}    ${_passwordCheckController.value}');
    return Rx.sequenceEqual(outPassword, outPasswordCheck);
  }

  Stream<bool> get outSubmitedNewUserValid => Rx.combineLatest4(
          outEmail, outPassword, outNewUserChecked, outPasswordCheck,
          (a, b, c, d) {
        if (c) {
          if (d.toString().compareTo(b.toString()) == 0) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      });

  void onSubmit() {
    if (_newUserCheckedController.value) {
      _authController.email = _emailController.value;
      _authController.password = _passwordController.value;
      _authController.doRegister().catchError((onError) {
        print(onError.toString());
        if (0 ==
            onError.object.message.toString().compareTo(
                'The email address is already in use by another account.'))
          _errorMessage
              .add('Endereço de e-mail já cadastrado por outro usuário.');
      });
    } else {
      _authController
          .doLoginEmailPassword(
              email: _emailController.value,
              password: _passwordController.value)
          .catchError((onError) {
        if (0 ==
                onError.object.message.toString().compareTo(
                    'The password is invalid or the user does not have a password.') ||
            (0 ==
                onError.object.message.toString().compareTo(
                    'We have blocked all requests from this device due to unusual activity. Try again later. [ Too many unsuccessful login attempts. Please try again later.]'))) {
          _errorMessage.add('Usuário ou senha inválidos');
        }
      });
    }
  }
}
