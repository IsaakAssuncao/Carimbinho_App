import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/pages/wizard_page.dart';
import 'package:flutterappstamp/controllers/wizard_controller.dart';

class WizardModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => WizardController()),
  ];

  @override
  List<Router> get routers => [
    Router(
      '/steps',
      child: (_, __) => WizardPage(),
    ),
  ];



}