import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum NotifyType { success, error, info, warning }

class ToastWidget {
  static notifyWidget(
    BuildContext context, {
    required NotifyType type,
    required String message,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        content: ListTileTheme(
          data: ListTileThemeData(
            tileColor: getBackgroundColor(notifyType: type),
            selectedTileColor: getBackgroundColor(notifyType: type),
            // contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: getTextColor(notifyType: type),
                width: 2.r,
              ),
              borderRadius: BorderRadiusGeometry.circular(20.r),
            ),
            iconColor: getTextColor(notifyType: type),
            textColor: getTextColor(notifyType: type),
            titleTextStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            subtitleTextStyle: TextStyle(fontSize: 12.sp),
          ),
          child: ListTile(
            leading: Icon(getToastIcon(notifyType: type), size: 30.r),
            title: Text(getToastTitle(notifyType: type)),
            subtitle: Text(message),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 20,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      ),
    );
  }

 static getToastIcon({required NotifyType notifyType}) {
    const colorMap = {
      NotifyType.success: Icons.check_circle,
      NotifyType.error: Icons.cancel_rounded,
      NotifyType.info: Icons.info,
      NotifyType.warning: Icons.warning,
    };
    return colorMap[notifyType] ?? Icons.check_circle;
  }

  static getToastTitle({required NotifyType notifyType}) {
    const colorMap = {
      NotifyType.success: "Success",
      NotifyType.error: "Error",
      NotifyType.info: "Info",
      NotifyType.warning: "Warning",
    };
    return colorMap[notifyType] ?? "Success";
  }

 static getBackgroundColor({required NotifyType notifyType}) {
    const colorMap = {
      NotifyType.success: Colors.green,
      NotifyType.error: Colors.red,
      NotifyType.info: Colors.blue,
      NotifyType.warning: Colors.orange,
    };
    return colorMap[notifyType] ?? Colors.green;
  }

 static getTextColor({required NotifyType notifyType}) {
    const colorMap = {
      NotifyType.success: Colors.white,
      NotifyType.error: Colors.white,
      NotifyType.info: Colors.white,
      NotifyType.warning: Colors.black,
    };
    return colorMap[notifyType] ?? Colors.white;
  }
}
