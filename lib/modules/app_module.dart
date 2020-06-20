import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/blocs/orders_bloc.dart';
import 'package:flutterappstamp/blocs/product_bloc.dart';
import 'package:flutterappstamp/blocs/user_bloc.dart';
import 'package:flutterappstamp/controllers/auth/auth_controller.dart';
import 'package:flutterappstamp/interfaces/auth_respository_interface.dart';
import 'package:flutterappstamp/modules/login_module.dart';
import 'package:flutterappstamp/modules/wizard_module.dart';
import 'package:flutterappstamp/pages/home_page.dart';
import 'package:flutterappstamp/repository/auth_repository.dart';
import 'package:flutterappstamp/tabs/list_page.dart';

import '../main.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind<IAuthRepository>((i) => new AuthRepository(firebaseAuth)),
        Bind((i) => new AuthController()),
        Bind((i) => new UserBloc()),
        Bind((i) => new ProductBloc()),
        Bind((i) => new OrdersBloc()),
      ];

  @override
  Widget get bootstrap => MainApp();

  @override
  List<Router> get routers => [
        Router('/home', child: (_, __) => HomePage()),
        Router('/login', module: LoginModule()),
        Router('/wizard', module: WizardModule()),
        Router('/cliente', child: (_, __) => ListPage()),
      ];
}
