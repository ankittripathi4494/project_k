import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';
import 'package:project_k/global/widgets/my_custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  LoginScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        titleText: "Login",
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed:() {
            
          }, icon: Icon(Icons.notification_add)),
           IconButton(onPressed:() {
            
          }, icon: Icon(Icons.notification_add)),
           IconButton(onPressed:() {
            
          }, icon: Icon(Icons.notification_add))
        ],
      ),
    );
  }
}