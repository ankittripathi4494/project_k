import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar {

  static AppBar appBarWidgetV1({
    String? titleText,
    Widget? titleWidget,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true
  }) => AppBar(
    elevation: 30,
    shadowColor: Colors.black,
    automaticallyImplyLeading: automaticallyImplyLeading,
    backgroundColor: Colors.green,
    iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
    actionsIconTheme: actionsIconTheme ?? IconThemeData(color: Colors.white),
    titleTextStyle:
        titleTextStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
    title: titleWidget ?? Text(titleText ?? ""),
    actions: actions,
  );
  static AppBar appBarWidgetV2({
    String? titleText,
    Widget? titleWidget,
    TextStyle? titleTextStyle,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    List<Widget>? actions,
     bool automaticallyImplyLeading = true
  }) => AppBar(
    flexibleSpace: Container(
      margin: EdgeInsets.all(3.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.deepOrange]),
      ),
    ),
     automaticallyImplyLeading: automaticallyImplyLeading,
    titleTextStyle:
        titleTextStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
    iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
    actionsIconTheme: actionsIconTheme ?? IconThemeData(color: Colors.white),

    title: titleWidget ?? Text(titleText ?? ""),
    actions: actions,
  );

}
