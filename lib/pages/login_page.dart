import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterappstamp/blocs/login_bloc.dart';
import 'package:flutterappstamp/controllers/login_controller.dart';
import 'package:flutterappstamp/widget/input_text_widget.dart';

import '../consts/color_const.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  LoginBloc _loginBloc = new LoginBloc();
  bool _newUser = false;
  GlobalKey switchGlobal = new GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      'images/stamp.jpg',
                      width: 100.0,
                      height: 100.0,
                    ),
                    Center(
                      child: Text(
                        'Carimbinho App',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    InputTextField(
                      icon: Icons.person,
                      hint: 'e-mail',
                      obscured: false,
                      enabled: true,
                      stream: _loginBloc.outEmail,
                      onChanged: _loginBloc.changeEmail,
                    ),
                    InputTextField(
                      icon: Icons.lock_outline,
                      hint: 'senha',
                      obscured: true,
                      enabled: true,
                      stream: _loginBloc.outPassword,
                      onChanged: _loginBloc.changePassword,
                    ),
                    StreamBuilder<bool>(
                      stream: _loginBloc.outNewUserChecked,
                      builder: (context, snapshot) {
                        return (snapshot.hasData && snapshot.data)
                            ? InputTextField(
                                icon: Icons.lock_outline,
                                hint: 'confirmar senha',
                                obscured: true,
                                enabled: snapshot.data,
                                stream: _loginBloc.outPasswordCheck,
                                onChanged: _loginBloc.changePasswordCheck,
                              )
                            : Container();
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    StreamBuilder(
                      stream: _loginBloc.outNewUserChecked,
                      builder: (context, snapshot) {
                        return StreamBuilder<bool>(
                          stream: (snapshot.hasData && snapshot.data)
                              ? _loginBloc.outSubmitedNewUserValid
                              : _loginBloc.outSubmitedValid,
                          initialData: false,
                          builder: (context, snapshotButton) {
                            return SizedBox(
                              height: 40.0,
                              child: FlatButton(
                                disabledColor: switch_color_login_disabled,
                                color: red_color_login,
                                child: Text('entrar'),
                                onPressed: (snapshotButton.hasData &&
                                        snapshotButton.data)
                                    ? _loginBloc.onSubmit
                                    : null,
                                textColor: Colors.white,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    StreamBuilder<bool>(
                      stream: _loginBloc.outNewUserChecked,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Switch(
                              key: switchGlobal,
                              activeColor: red_color_switch_new_user,
                              inactiveTrackColor: switch_new_user_disabled,
                              value: (snapshot.hasData) ? snapshot.data : false,
                              onChanged: _loginBloc.changeNewUserChecked,
                            ),
                            Text(
                              'registar novo usuário?',
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      },
                    ),
                    StreamBuilder(
                      stream: _loginBloc.outMessageError,
                      builder: (context, snapshot) {
                        return (snapshot.hasData)
                            ? Text(_loginBloc.errorMessage)
                            : Container();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
