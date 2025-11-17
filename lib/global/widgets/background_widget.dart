import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Alignment beginAlignment;
  final Alignment endAlignment;
  final double radians;
  final List<Color> colors;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final DecorationImage? image;
  const BackgroundWidget({
    super.key,
    this.radians = 51,
    this.beginAlignment = Alignment.bottomLeft,
    this.endAlignment = Alignment.topRight,
    this.colors = const [
      Color(0xFF020024),
      Color(0xFF090979),
      Color(0xFF00D4FF),
    ],
    this.child,
    this.borderRadius,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    /*
Color(0xAARRGGBB) 

A -> Alpha (Opecity) -> 0- F
R -> Red -> 0-F
G -> Green -> 0-F
B -> Blue -> 0-F
    */
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: image,
        gradient: (image == null)
            ? LinearGradient(
                begin: beginAlignment,
                end: endAlignment,
                colors: colors,
                transform: GradientRotation(radians),
              )
            : null,
      ),
      child: child,
    );
  }
}
