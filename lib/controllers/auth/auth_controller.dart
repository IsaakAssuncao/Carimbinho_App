import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/consts/routers_const.dart';
import 'package:flutterappstamp/interfaces/auth_respository_interface.dart';
import 'package:flutterappstamp/response/response_default.dart';

class AuthController {
  IAuthRepository authRepository;
  String email = '';
  String password = '';

  AuthController() {
    authRepository = Modular.get<IAuthRepository>();
  }

  void setEmail(String email) => this.email = email;

  void setPassword(String password) => this.password = password;

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((onValue) {
      if (onValue.success) {
        if (onValue.object.uid == 'MpVit7zLBuYsqR9GHu4qucsh99U2') {
          Modular.to.pushNamed(RoutersConsts.home);
        }
        else {
          Modular.to.pushNamed(RoutersConsts.cliente);
        };
      } else {
        print(onValue.message);
      }
    });
  }

  Future<void> doLoginEmailPassword({String email, String password}) async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((onValue) {
      if (onValue.success) {
        Modular.to.pushNamed(RoutersConsts.home);
      } else {
        print(onValue.message);
        throw onValue;
      }
    });

  }
  Future<DefaultResponse> doRegister() async {
    var response = await authRepository.registerEmailPassword(
        email: email, password: password);
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConsts.wizard);
    } else {
      throw response;
    }
    return response;
  }

  Future<void> doLogout() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConsts.login);
    } else {
      throw response;
    }
  }
}
