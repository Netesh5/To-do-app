import 'package:flutter/material.dart';

Widget weekbar() {
  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];
  Color activeCardColor = Colors.white;
  Color inactiveCardColor = Colors.black26;

  Color activeTextColor = Colors.black;
  Color inactiveTextColor = Colors.white;

  List<List<Color>> cardColorList = [
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
    [Colors.black26, Colors.white],
  ];

  return SizedBox(
    height: 100,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weekdays.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 5),
          height: 70,
          width: 50,
          decoration: BoxDecoration(
            color: cardColorList[index][0],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                weekdays[index],
                style: TextStyle(
                    fontSize: 18,
                    color: activeTextColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    ),
  );
}
