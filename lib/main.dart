import 'package:flutter/material.dart';
import 'package:project_k/global/helpers/route_helper.dart';

void main(List<String> args) {
  runApp(MyApplication()); //
}
GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteHelper.onGenerateRoute,
      // home: SplashScreen(),
    );
  }
}
