import 'package:flutter/widgets.dart';

class Task {
  final String task;
  final int time;
  final int id;
  Task({required this.id, required this.task, required this.time});

  Map<String, dynamic> data() {
    //for converting data to Map
    return {
      'id': id,
      'task': task,
      'time': time,
    };
  }
}
