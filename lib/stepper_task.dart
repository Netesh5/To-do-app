import 'package:flutter/material.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  _stepperState createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      physics: ScrollPhysics(),
      steps: [],
    );
  }
}
