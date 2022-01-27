import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Homepage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()));
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color primary_light_color = const Color(0xffFCFDF3);
  Color primary_dark_color = const Color(0xff1f1f1f);
  Color faded_black = const Color(0xffCCCDC6);
  String date = DateFormat("dd, MMMM").format(DateTime.now());

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

  //String circle_avatar_image ="https://indiashorts.com/wp-content/uploads/2021/04/9_20210416_113356_0008.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_light_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              ListTile(
                leading: Column(children: [
                  const Text(
                    "Today",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(date,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20)),
                ]),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundColor: primary_dark_color,
                  // backgroundImage: NetworkImage(circle_avatar_image),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weekdays.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(color: cardColorList[index][0]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          weekdays[index],
                          style: TextStyle(
                              fontSize: 18, color: cardColorList[index][1]),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
