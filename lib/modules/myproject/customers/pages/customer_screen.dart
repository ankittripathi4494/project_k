import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:project_k/global/widgets/icon_button_widget.dart';
import 'package:project_k/global/widgets/my_custom_app_bar.dart';

class CustomerScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  CustomerScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        titleText: (arguments != null && arguments!.containsKey('title'))
            ? arguments!['title']
            : "Customer List",
        actions: [
          IconButtonWidget(icon: Icon(Icons.add), onPressed: () {
            Navigator.pushNamed(context, '/add-customer');
          },)
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBarWidget(selectedIndex: 1),
    );
  }
}
