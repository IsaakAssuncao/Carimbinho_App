import 'package:flutter/material.dart';

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {

  List<Step> steps = [
    Step(
      title: Text('novo cadastro'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          Switch(
            value: false,
            activeColor: Colors.red[900],
            onChanged: null,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        steps: steps,
      ),
    );
  }
}

