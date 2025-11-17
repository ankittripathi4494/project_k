import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_k/global/models/menu_option.dart';
import 'package:project_k/global/utils/image_list.dart';

class DrawerWidget {
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
      'option_value': 'customer',
      'icon': CupertinoIcons.person_3,
      'sub_option_list': [
        {
          'id': 1,
          'option_name': 'Add Customer',
          'option_value': 'add_customer',
          'icon': Icons.person_add,
        },
        {
          'id': 1,
          'option_name': 'Customers List',
          'option_value': 'customer_list',
          'icon': CupertinoIcons.person_3,
        },
      ],
    },
    {
      'id': 3,
      'option_name': 'Profile',
      'option_value': 'profile',
      'icon': Icons.person,
    },
    {
      'id': 4,
      'option_name': 'Logout',
      'option_value': 'logout',
      'icon': Icons.logout,
    },
  ];

  static getDrawer(BuildContext context) {
    final menuOptions = optionList.map((e) => MenuOption.fromJson(e)).toList();
   
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(145, 80, 34, 19),
            ),
            child: SvgPicture.asset(
              ResourseList.logoSVGResource,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: menuOptions.length,
              itemBuilder: (context, index) {
                final item = menuOptions[index];
                if (item.subOptions != null && item.subOptions!.isNotEmpty) {
                  return ExpansionTile(
                    leading: Icon(item.icon),
                    title: Text(item.optionName),
                    children: item.subOptions!
                        .map(
                          (c) => ListTile(
                            onTap: () => getTapValue(context, c),
                            leading: Icon(c.icon),
                            title: Text(c.optionName),
                          ),
                        )
                        .toList(),
                  );
                }
                return ListTile(
                  onTap: () => getTapValue(context, item),
                  leading: Icon(item.icon),
                  title: Text(item.optionName, ),
                  // trailing: item.subOptions != null
                  //     ? Icon(Icons.arrow_drop_down)
                  //     : null,
                );
              },
            ),
          ),
        ],
      ),
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
      Navigator.pushReplacementNamed(context, '/');

  static _profile(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/');

  static _customerList(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/');

  static _customerAdd(BuildContext context) =>
      Navigator.pushReplacementNamed(context, '/');

  static _logout(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
  }
}
