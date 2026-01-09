import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_k/modules/myproject/errors/pages/page_error_screen.dart';
import 'package:project_k/modules/myproject/splash/pages/splash_screen.dart';

class RouteHelperForVoip {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic arguments = (settings.arguments is Map<String, dynamic>)
        ? settings.arguments
        : null;
    switch (settings.name) {
      case '/':
        return PageTransition(
          type: PageTransitionType.fade,
          child: SplashScreen(arguments: arguments),
        );
     
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: PageErrorScreen(arguments: arguments),
        );
    }
  }
}
