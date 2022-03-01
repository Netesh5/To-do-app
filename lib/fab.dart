import 'package:flutter/material.dart';

class fab extends StatefulWidget {
  const fab({Key? key}) : super(key: key);

  @override
  _fabState createState() => _fabState();
}

Color primary_light_color = const Color(0xffFCFDF3);
Color primary_dark_color = const Color(0xff1f1f1f);
Color faded_black = Colors.grey.shade700;

class _fabState extends State<fab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        elevation: 1,
        backgroundColor: primary_dark_color,
        onPressed: () {});
  }
}
