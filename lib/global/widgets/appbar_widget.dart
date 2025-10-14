import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar appBarWidgetV1() =>
      AppBar(backgroundColor: Colors.green, title: Text("Splash"));
  static AppBar appBarWidgetV2() => AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.deepOrange]),
      ),
    ),
    title: Text("Splash"),
  );
}
