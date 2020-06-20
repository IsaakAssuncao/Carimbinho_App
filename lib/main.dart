import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'consts/routers_const.dart';
import 'modules/app_module.dart';

void main() => runApp(ModularApp(module: AppModule()));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutersConsts.login,
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
