import 'package:flutter/material.dart';
import 'package:project_k/modules/auth/pages/login_screen.dart';
import 'package:project_k/modules/auth/pages/register_screen.dart';
import 'package:project_k/modules/customers/pages/customer_screen.dart';
import 'package:project_k/modules/dashboard/pages/dashboard_screen.dart';
import 'package:project_k/modules/errors/pages/network_error_screen.dart';
import 'package:project_k/modules/errors/pages/page_error_screen.dart';
import 'package:project_k/modules/profile/pages/profile_screen.dart';
import 'package:project_k/modules/splash/pages/splash_screen.dart';
import 'package:project_k/modules/transactions/pages/transaction_sceeen.dart';

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
      case '/customer-list':
        return MaterialPageRoute(
          builder: (context) => CustomerScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (context) => DashboardScreen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/transaction':
        return MaterialPageRoute(
          builder: (context) => TransactionSceeen(
            arguments: (arguments is Map<String, dynamic>) ? arguments : {},
          ),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(
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
