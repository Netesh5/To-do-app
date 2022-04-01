import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/database.dart';
import 'package:todo/model/task.dart';

class additem extends StatefulWidget {
  const additem({Key? key}) : super(key: key);

  @override
  _additemState createState() => _additemState();
}

Color primary_light_color = const Color(0xffFCFDF3);
Color primary_dark_color = const Color(0xff1f1f1f);
Color faded_black = Colors.grey.shade700;
late final String task_name;
late final int time;

class _additemState extends State<additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_dark_color,
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Add Task",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          )
        ],
      ),
      backgroundColor: primary_light_color,
      body: additems(),
    );
  }
}

class additems extends StatefulWidget {
  @override
  State<additems> createState() => _additemsState();
}

class _additemsState extends State<additems> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController datainput = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Add Task to your list",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: TextField(
            onSubmitted: (value) async {
              if (value != "") {
                DataBase _databaseobj = DataBase();
                Task _newtask = Task(title: value, task: value, time: value);
                _databaseobj.insert(_newtask);
              }
            },
            cursorHeight: 25,
            cursorColor: Colors.black,
            style: const TextStyle(fontSize: 20, color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Input Time",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: TextField(
            controller: dateinput,
            readOnly: true,
            cursorHeight: 25,
            cursorColor: Colors.black,
            style: const TextStyle(fontSize: 20, color: Colors.black),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              icon: Icon(Icons.timer),
              iconColor: Colors.black,
              focusColor: Colors.black,
            ),
            onTap: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (timeOfDay != null && timeOfDay != selectedTime) {
                setState(() {
                  selectedTime = timeOfDay;
                  dateinput.text = "${selectedTime.hour.toString()}"
                      " : "
                      "${selectedTime.minute.toString()}";
                });
              }
            },
          ),
        )
      ],
    );
  }
}
