import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/consts/routers_const.dart';

class LoginController {
  void doRegister() {
    Modular.to.pushNamed(RoutersConsts.login);
  }
}
