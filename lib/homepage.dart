import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/weekbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color primary_light_color = const Color(0xffFCFDF3);
  Color primary_dark_color = const Color(0xff1f1f1f);
  Color faded_black = Colors.black26;
  String date = DateFormat("dd, MMMM").format(DateTime.now());

  //String circle_avatar_image ="https://indiashorts.com/wp-content/uploads/2021/04/9_20210416_113356_0008.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_light_color,
        body: Padding(
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
              weekbar(),
            ],
          ),
        ),
      ),
    );
  }
}
