import 'dart:ui';

import 'package:flutter/material.dart';

class WaveClipperHelper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    
    // Start from top-left
    path.lineTo(0, size.height * 0.7);

    // First curve
    path.quadraticBezierTo(
      size.width * 0.25, size.height,      // control point
      size.width * 0.5, size.height * 0.8, // ending point
    );

    // Second curve
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.6,
      size.width, size.height * 0.8,
    );

    // Close the shape
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
