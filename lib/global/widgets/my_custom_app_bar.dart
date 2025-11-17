// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/helpers/wave_clipper.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? titleWidget;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  const MyCustomAppBar({
    super.key,
    this.titleText,
    this.titleWidget,
    this.titleTextStyle,
    this.iconTheme,
    this.actionsIconTheme,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperHelper(),
      child: Container(
        color: Colors.red,
        child: AppBar(
          elevation: 30,
    centerTitle: centerTitle,
          shadowColor: Colors.black,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: Colors.transparent,
          iconTheme: iconTheme ?? IconThemeData(color: Colors.white),
          actionsIconTheme:
              actionsIconTheme ?? IconThemeData(color: Colors.white),
          titleTextStyle:
              titleTextStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
          title: titleWidget ?? Text(titleText ?? ""),
          actions: actions,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.h);
}
