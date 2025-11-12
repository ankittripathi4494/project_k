import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final ButtonStyle? style;
  final Widget? icon;
  const FilledButtonWidget({
    super.key,
    this.onPressed,
    this.buttonText,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButtonTheme(
      data: FilledButtonThemeData(
        style:
            style ??
            FilledButton.styleFrom(
              backgroundColor: Colors.green, // enable background color
              foregroundColor: Colors.white, // enable foreground color
              iconColor: Colors.amber,
              disabledBackgroundColor:
                  Colors.blueGrey, // enable background color
              disabledForegroundColor: Colors.black, // enable foreground color
              // shadowColor: Colors.blue,
              elevation: 4,
              visualDensity: VisualDensity.comfortable,
              side: BorderSide(color: Colors.white, width: 2.r),
            ),
      ),
      child: (icon != null)
          ? FilledButton.icon(
              onPressed: onPressed,

              icon: icon,
              label: Text(buttonText ?? ''),
            )
          : FilledButton(onPressed: onPressed, child: Text(buttonText ?? '')),
    );
  }
}
