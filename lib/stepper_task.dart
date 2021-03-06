import 'package:flutter/material.dart';
import 'package:todo/database.dart';
import 'package:todo/fab.dart';
import 'package:todo/model/task.dart';
import 'package:todo/widget_item.dart';

class stepper extends StatefulWidget {
  const stepper({Key? key}) : super(key: key);

  @override
  _stepperState createState() => _stepperState();
}

class _stepperState extends State<stepper> {
  final DataBase _db = DataBase();
  @override
  Widget build(BuildContext context) {
    // return Stepper(
    //   type: StepperType.vertical,
    //   physics: ScrollPhysics(),
    //   steps: [],
    // );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          initialData: const [],
          future: _db.query(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                itemBuilder: (context, index) {
                  return task_widget();
                });
          },
        ),
      ),
    );
  }
}
