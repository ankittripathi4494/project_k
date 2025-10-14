import 'package:flutter/material.dart';
import 'package:project_k/global/helpers/route_helper.dart';

void main(List<String> args) {
  runApp(MyApplication()); //
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteHelper.onGenerateRoute,
      // home: SplashScreen(),
    );
  }
}
