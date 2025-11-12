import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutomaticButtonWidget extends StatelessWidget {
  final Function()? task;
  final Duration taskWaitDuration;
  final Widget? childWidget;
  const AutomaticButtonWidget({
    super.key,
    required this.task,
    required this.taskWaitDuration,
    this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return DurationButton(
      width: (childWidget != null) ? null : 1.w,
      height: (childWidget != null) ? null : 1.h,
      coverColor: (childWidget != null) ? null : Colors.transparent,
      backgroundColor: (childWidget != null) ? null : Colors.transparent,
      hoverColor: (childWidget != null) ? null : Colors.transparent,
      onPressed: () {},
      onComplete: task,
      duration: taskWaitDuration,
      child: childWidget,
    );
  }
}
