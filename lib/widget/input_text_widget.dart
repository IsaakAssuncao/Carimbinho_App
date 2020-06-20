import 'package:flutter/material.dart';

import '../consts/color_const.dart';

class InputTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscured;
  final bool enabled;
  final Stream<String> stream;
  final Function(String) onChanged;

  InputTextField(
      {this.icon, this.hint, this.obscured, this.enabled, this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        return TextField(
          enableInteractiveSelection: false,
          enableSuggestions: false,
          onChanged: onChanged,
          enabled: enabled,
          obscureText: obscured,
          decoration: InputDecoration(
              hintText: hint,
              errorText: snapshot.hasError ? snapshot.error : null,
              icon: Icon(
                icon,
                color: red_color_login,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: red_color_login))),
        );
      },
    );
  }
}
