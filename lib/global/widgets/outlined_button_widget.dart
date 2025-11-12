import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final ButtonStyle? style;
  final Widget? icon;
  const OutlinedButtonWidget({
    super.key,
    this.onPressed,
    this.buttonText,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style:
            style ??
            OutlinedButton.styleFrom(
              // backgroundColor: Colors.green, // enable background color
              foregroundColor: Colors.red, // enable foreground color
              iconColor: Colors.amber,
              disabledBackgroundColor:
                  Colors.blueGrey, // enable background color
              disabledForegroundColor: Colors.black, // enable foreground color
              // shadowColor: Colors.blue,
              elevation: 4,
              visualDensity: VisualDensity.comfortable,
              side: BorderSide(color: Colors.red, width: 2.r),
            ),
      ),
      child: (icon != null)
          ? OutlinedButton.icon(
              onPressed: onPressed,

              icon: icon,
              label: Text(buttonText ?? ''),
            )
          : OutlinedButton(onPressed: onPressed, child: Text(buttonText ?? '')),
    );
  }
}
