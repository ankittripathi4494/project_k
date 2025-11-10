import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_k/global/models/menu_option.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  int selectedIndex;
  CustomBottomNavigationBarWidget({super.key, required this.selectedIndex});
  static List<Map<String, dynamic>> optionList = [
    {
      'id': 1,
      'option_name': 'Home',
      'option_value': 'home',
      'icon': Icons.home,
    },
    {
      'id': 2,
      'option_name': 'Customers',
      'option_value': 'customer_list',
      'icon': CupertinoIcons.person_3,
    },
    {
      'id': 4,
      'option_name': 'Transactions',
      'option_value': 'transactions',
      'icon': Icons.logout,
    },
    {
      'id': 3,
      'option_name': 'Profile',
      'option_value': 'profile',
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: "Home",
    //       backgroundColor: Colors.green,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person_2),
    //       label: "Customers",
    //       backgroundColor: Colors.green,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.currency_rupee),
    //       label: "Transactions",
    //       backgroundColor: Colors.green,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: "Profile",
    //       backgroundColor: Colors.green,
    //     ),
    //   ],
    // );
    final menuOptions = optionList.map((e) => MenuOption.fromJson(e)).toList();
    return NavigationBar(
      backgroundColor: Colors.green,
      selectedIndex: selectedIndex,
      destinations: menuOptions
          .map(
            (c) =>
                NavigationDestination(icon: Icon(c.icon), label: c.optionName),
          )
          .toList(),
      onDestinationSelected: (value) {
        getTapValue(context, menuOptions[value]);
      },
    );
  }

  static void getTapValue(BuildContext context, MenuOption item) {
    switch (item.optionValue) {
      case 'home':
        _home(context);
      case 'profile':
        _profile(context);
      case 'customer_list':
        _customerList(context);
      case 'add_customer':
        _customerAdd(context);
      case 'logout':
        _logout(context);

      default:
    }
  }

  static _home(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/dashboard');

  static _profile(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/profile');

  static _customerList(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/customer-list');

  static _customerAdd(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/customer-add');

  static _logout(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }
}
