import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final ButtonStyle? style;
  final Widget? icon;
   final bool? isSelected;
  final Widget? selectedIcon;
  const IconButtonWidget({
    super.key,
    this.onPressed,
    this.style,
    this.icon,
     this.isSelected,
    this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButtonTheme(
      data: IconButtonThemeData(
        style:
            style ??
            IconButton.styleFrom(
              // backgroundColor: Colors.green, // enable background color
              foregroundColor: Colors.red, // enable foreground color
             
              disabledBackgroundColor:
                  Colors.blueGrey, // enable background color
              disabledForegroundColor: Colors.black, // enable foreground color
              // shadowColor: Colors.blue,
              elevation: 4,
              visualDensity: VisualDensity.comfortable,
              
            ),
      ),
      child:  IconButton(onPressed: onPressed, icon: icon!, isSelected: isSelected, selectedIcon: selectedIcon,),
    );
  }
}
