import 'package:flutter/widgets.dart';

class Task {
  final String task;
  //final int time;
  //final int id;
  Task({required this.task});

  Map<String, dynamic> toMap() {
    //for converting data to Map
    return {
      //'id': id,
      'task': task,
      //'time': time,
    };
  }
}
