import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
    dynamic arguments = (settings.arguments is Map<String, dynamic>)
        ? settings.arguments
        : {};
    switch (settings.name) {
      case '/':
        return PageTransition(
          type: PageTransitionType.fade,
          child: SplashScreen(arguments: arguments),
        );
      case '/login':
        return PageTransition(
          type: PageTransitionType.fade,
          child: LoginScreen(arguments: arguments),
        );
      case '/register':
        return PageTransition(
          type: PageTransitionType.fade,
          child: RegisterScreen(arguments: arguments),
        );
      case '/customer-list':
        return PageTransition(
          type: PageTransitionType.fade,
          child: CustomerScreen(arguments: arguments),
        );
      case '/dashboard':
        return PageTransition(
          type: PageTransitionType.fade,
          child: DashboardScreen(arguments: arguments),
        );
      case '/transaction':
        return PageTransition(
          type: PageTransitionType.fade,
          child: TransactionSceeen(arguments: arguments),
        );
      case '/profile':
        return PageTransition(
          type: PageTransitionType.fade,
          child: ProfileScreen(arguments: arguments),
        );
      case '/network-error':
        return PageTransition(
          type: PageTransitionType.fade,
          child: NetworkErrorScreen(arguments: arguments),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: PageErrorScreen(arguments: arguments),
        );
    }
  }
}
