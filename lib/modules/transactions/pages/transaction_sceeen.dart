import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/custom_bottom_navigation_bar_widget.dart';

class TransactionSceeen extends StatelessWidget {
   Map<String, dynamic>? arguments;
  TransactionSceeen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarWidget(selectedIndex: 2,),
    );
  }
}