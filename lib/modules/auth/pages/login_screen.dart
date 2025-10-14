import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';

class LoginScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  LoginScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBarWidgetV2(),
    );
  }
}