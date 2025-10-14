import 'package:flutter/material.dart';
import 'package:project_k/modules/auth/pages/login_screen.dart';
import 'package:project_k/modules/auth/pages/register_screen.dart';
import 'package:project_k/modules/errors/pages/network_error_screen.dart';
import 'package:project_k/modules/errors/pages/page_error_screen.dart';
import 'package:project_k/modules/splash/pages/splash_screen.dart';

class RouteHelper {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => SplashScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/network-error':
        return MaterialPageRoute(
          builder: (context) => NetworkErrorScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => PageErrorScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
    }
  }
}
