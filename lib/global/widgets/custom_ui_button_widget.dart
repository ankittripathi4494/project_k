import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUiButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final ButtonStyle? style;
  final Widget? icon;
  final Gradient? gradient;
  const CustomUiButtonWidget({
    super.key,
    this.onPressed,
    this.buttonText,
    this.style,
    this.icon,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    //! default button with custom ui features
    /*
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style:
            style ??
            ElevatedButton.styleFrom(
             backgroundBuilder: (context, states, buttonChild) {
               return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurple, Colors.blueAccent])
                ),
                child: buttonChild,
               );
             },
            //   foregroundBuilder: (context, states, buttonChild) {
            //    return Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [Colors.white, Colors.white])
            //     ),
            //     child: buttonChild,
            //    );
            //  },
            foregroundColor: Colors.white
            ),
      ),
      child: (icon != null)
          ? ElevatedButton.icon(
              onPressed: onPressed,

              icon: icon,
              label: Text(buttonText ?? ''),
            )
          : ElevatedButton(onPressed: onPressed, child: Text(buttonText ?? '')),
    );
    */
    //! does not show splash on long press
    /*
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
          ),
        ),
        child: Text(buttonText ?? '', style: TextStyle(color: Colors.white)),
      ),
    );
    */
    //! show splash on long press
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          gradient:
              gradient ??
              LinearGradient(colors: [Colors.deepPurple, Colors.blueAccent]),
        ),
        child: Text(buttonText ?? '', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
