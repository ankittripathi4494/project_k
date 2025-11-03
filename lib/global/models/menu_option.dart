import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuOption {
  final int id;
  final String optionName;
  final String optionValue;
  final IconData icon;
  final List<MenuOption>? subOptions;

  MenuOption({
    required this.id,
    required this.optionName,
    required this.optionValue,
    required this.icon,
    this.subOptions,
  });

  factory MenuOption.fromJson(Map<String, dynamic> json) {
    return MenuOption(
      id: json['id'],
      optionName: json['option_name'],
      optionValue: json['option_value'],
      icon: _parseIcon(json['icon']),
      subOptions: json['sub_option_list'] != null
          ? (json['sub_option_list'] as List)
                .map((e) => MenuOption.fromJson(e))
                .toList()
          : null,
    );
  }

  static IconData _parseIcon(icon) {
    // If direct IconData is passed (not recommended in real API)
    if (icon is IconData) return icon;

    // If icon string is passed from API -> Map manually like below:
    switch (icon) {
      case "home":
        return Icons.home;
      case "person":
        return Icons.person;
      case "logout":
        return Icons.logout;
      case "customers":
        return CupertinoIcons.person_3;
      default:
        return Icons.circle;
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'option_name': optionName,
    'option_value': optionValue,
    'icon': icon.codePoint, // cannot send IconData object as JSON
    'sub_option_list': subOptions?.map((e) => e.toJson()).toList(),
  };
}
