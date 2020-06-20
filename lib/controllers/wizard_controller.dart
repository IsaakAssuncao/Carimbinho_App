import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/consts/routers_const.dart';

class WizardController {
  void doWizard() {
    Modular.to.pushNamed(RoutersConsts.wizard);
  }
}
