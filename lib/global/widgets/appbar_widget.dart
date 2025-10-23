import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar appBarWidgetV1({
    String? titleText,
    Widget? titleWidget,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    List<Widget>? actions
  }) => AppBar(
elevation: 30,
shadowColor: Colors.black,
    backgroundColor: Colors.green,
    iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
    actionsIconTheme: actionsIconTheme ?? IconThemeData(color: Colors.white),
    titleTextStyle:
        titleTextStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
    title: titleWidget ?? Text(titleText ?? ""),
    actions: actions,
  );
  static AppBar appBarWidgetV2({String? titleText, Widget? titleWidget, TextStyle? titleTextStyle, IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    List<Widget>? actions}) =>
      AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.deepOrange]),
          ),
        ),
         titleTextStyle:
        titleTextStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
         iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
    actionsIconTheme: actionsIconTheme ?? IconThemeData(color: Colors.white),
   
        title: titleWidget ?? Text(titleText ?? ""),
         actions: actions,
      );
}
