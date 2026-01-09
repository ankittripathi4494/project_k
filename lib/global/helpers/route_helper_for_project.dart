import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_k/modules/myproject/auth/blocs/login/login_bloc.dart';
import 'package:project_k/modules/myproject/auth/pages/login_screen.dart';
import 'package:project_k/modules/myproject/auth/pages/register_screen.dart';
import 'package:project_k/modules/myproject/auth/repositories/login_repository.dart';
import 'package:project_k/modules/myproject/customers/pages/add_customer.dart';
import 'package:project_k/modules/myproject/customers/pages/customer_screen.dart';
import 'package:project_k/modules/myproject/customers/pages/edit_customer.dart';
import 'package:project_k/modules/myproject/dashboard/pages/dashboard_screen.dart';
import 'package:project_k/modules/myproject/errors/pages/network_error_screen.dart';
import 'package:project_k/modules/myproject/errors/pages/page_error_screen.dart';
import 'package:project_k/modules/myproject/profile/pages/profile_screen.dart';
import 'package:project_k/modules/myproject/splash/pages/splash_screen.dart';
import 'package:project_k/modules/myproject/transactions/pages/transaction_sceeen.dart';

class RouteHelperForProject {
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
      case '/login':
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => LoginBloc(repository: LoginRepository()),
            child: LoginScreen(arguments: arguments),
          ),
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
      case '/add-customer':
        return PageTransition(
          type: PageTransitionType.fade,
          child: AddCustomerScreen(arguments: arguments),
        );
      case '/edit-customer':
        return PageTransition(
          type: PageTransitionType.fade,
          child: EditCustomerScreen(arguments: arguments),
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
