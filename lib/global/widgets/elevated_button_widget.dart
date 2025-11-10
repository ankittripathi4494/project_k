import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  const ElevatedButtonWidget({super.key, this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonText ?? ''));
  }
}
