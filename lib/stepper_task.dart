import 'package:flutter/material.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  _stepperState createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  @override
  Widget build(BuildContext context) {
    // return Stepper(
    //   type: StepperType.vertical,
    //   physics: ScrollPhysics(),
    //   steps: [],
    // );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.amberAccent,
          child: Row(
            children: const [
              Text(""),
              Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
