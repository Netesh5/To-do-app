import 'package:flutter/material.dart';
import 'package:todo/additem.dart';
import 'package:todo/database.dart';
import 'package:todo/model/task.dart';

class task_widget extends StatelessWidget {
  Color primary_light_color = const Color(0xffFCFDF3);
  Color primary_dark_color = const Color(0xff1f1f1f);
  Color faded_black = Colors.grey.shade700;
  DataBase _db = DataBase();
  final Task _task = Task();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.amberAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${task_name}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Time",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(primary: primary_dark_color),
                    onPressed: () async {
                      await _db.deleteTask(_task.id ?? 0);
                    },
                    child: const Text("Mark as done"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
