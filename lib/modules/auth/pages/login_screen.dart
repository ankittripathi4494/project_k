import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_k/global/utils/image_list.dart';
import 'package:project_k/global/widgets/background_widget.dart';
import 'package:project_k/global/widgets/my_custom_app_bar.dart';
import 'package:project_k/modules/auth/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  LoginScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      image: DecorationImage(
        image: AssetImage(ResourseList.backgroundImageResource),
        fit: BoxFit.cover,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyCustomAppBar(
          automaticallyImplyLeading: false,
          titleText: "Login",
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: BackgroundWidget(
              colors: [Color(0x99EEAECA), Color(0x9994BBE9)],
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: SizedBox(
                width: 1.sw,
                
                child: LoginFormWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
