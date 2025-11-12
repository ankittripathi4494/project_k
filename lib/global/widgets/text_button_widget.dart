import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final ButtonStyle? style;
  final Widget? icon;
  const TextButtonWidget({
    super.key,
    this.onPressed,
    this.buttonText,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style:
            style ??
            TextButton.styleFrom(
              // backgroundColor: Colors.green, // enable background color
              foregroundColor: Colors.red, // enable foreground color
              iconColor: Colors.amber,
              disabledBackgroundColor:
                  Colors.blueGrey, // enable background color
              disabledForegroundColor: Colors.black, // enable foreground color
              // shadowColor: Colors.blue,
              elevation: 4,
              visualDensity: VisualDensity.comfortable,
              
            ),
      ),
      child: (icon != null)
          ? TextButton.icon(
              onPressed: onPressed,

              icon: icon,
              label: Text(buttonText ?? ''),
            )
          : TextButton(onPressed: onPressed, child: Text(buttonText ?? '')),
    );
  }
}
