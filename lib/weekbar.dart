import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class weekbar extends StatefulWidget {
  weekbar({Key? key}) : super(key: key);

  @override
  State<weekbar> createState() => _weekbarState();
}

class _weekbarState extends State<weekbar> {
  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
  Color activeCardColor = Colors.white;
  Color inactiveCardColor = Colors.black26;

  Color activeTextColor = Colors.black;
  Color inactiveTextColor = Colors.white;

  String date = DateFormat("dd, MMMM").format(DateTime.now());
  var future_days = DateTime.now().add(const Duration(days: 6));
  String? selectDay, selectDate;
  int selected_day = DateTime.now().day;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekdays.length,
        itemBuilder: (BuildContext context, int index) {
          int day = DateTime.now().day + index;
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 5),
              height: 70,
              width: 50,
              decoration: BoxDecoration(
                color: inactiveTextColor,
                border: Border.all(
                  color:
                      selected_day == day ? activeCardColor : inactiveCardColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('EE')
                        .format(DateTime.now().add(Duration(days: index))),
                    style: TextStyle(
                        color: day == DateTime.now().day
                            ? activeTextColor
                            : Colors.grey[700],
                        fontWeight: day == DateTime.now().day
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                  Text(
                    DateFormat('d')
                        .format(DateTime.now().add(Duration(days: index))),
                    style: TextStyle(
                        color: day == DateTime.now().day
                            ? activeTextColor
                            : Colors.grey[700],
                        fontWeight: day == DateTime.now().day
                            ? FontWeight.bold
                            : FontWeight.normal),
                  )
                ],
              ),
            ),
            onTap: () {
              setState(() {
                selectDate =
                    DateTime.now().add(Duration(days: index)).day.toString();
                selectDay = DateFormat('EE')
                    .format(DateTime.now().add(Duration(days: index)));
                selected_day = DateTime.now().day + index;
              });
            },
          );
        },
      ),
    );
  }
}
