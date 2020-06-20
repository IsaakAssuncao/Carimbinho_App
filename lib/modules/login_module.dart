import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/controllers/login_controller.dart';
import 'package:flutterappstamp/pages/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          '/',
          child: (_,__) => LoginPage(),
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
