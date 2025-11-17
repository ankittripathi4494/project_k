import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/widgets/icon_button_widget.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});
  ValueNotifier<int?> number = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Text(
              (value??0).toString(),
              style: TextStyle(color: Colors.white, fontSize: 80.sp),
            );
          }
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          IconButtonWidget(onPressed: () {
            number.value = (number.value??0) +1;
          }, icon: CircleAvatar(child: Icon(Icons.add)),),  IconButtonWidget(onPressed: () {
             number.value = (number.value??0) -1;
          }, icon: CircleAvatar(child: Icon(Icons.remove)),)
        ],)
      ],
    );
  }
}
