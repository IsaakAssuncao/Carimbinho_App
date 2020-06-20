import 'package:flutter/material.dart';
import 'package:flutterappstamp/consts/color_const.dart';

class LoginButton extends StatefulWidget {

  final Stream<bool> onSubmiteValid;

  LoginButton({this.onSubmiteValid});

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.onSubmiteValid,
      builder: (context, snapshot) {
        return SizedBox(
          height: 40.0,
          child: FlatButton(
            disabledColor: switch_color_login_disabled,
            color: red_color_login,
            child: Text('entrar'),
            onPressed:
//                ? () => _authController.doLoginEmailPassword(
//                email: _loginBloc.outEmail,
//                password: _passwordController.text)
                 null,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}
