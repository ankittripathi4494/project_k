import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/custom_bottom_navigation_bar_widget.dart';

class CustomerScreen extends StatelessWidget {
 Map<String, dynamic>? arguments;
  CustomerScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarWidget(selectedIndex: 1,),
    );
  }
}