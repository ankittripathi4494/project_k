import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_validator/i_validator.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/textform_field_widget_with_margin.dart';

/*
Login Form Widget -> Inputs for email and password along with login button, and Forget Password link.

*/
class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16.h,
          children: [
            TextFormFieldWidgetWithMargin(
              formEnabled: false,
              controller: emailController,
              style: TextStyle(fontSize: 14.sp),
              // maxLines: 5,
              // minLines: 1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
              ],
              validator: (value) => EmailValidator().validate(value),
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              labelText: "Email",
              counterText: "",
            ), // Email Input
            TextFormFieldWidgetWithMargin(
              controller: passwordController,
              style: TextStyle(fontSize: 14.sp),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
              ],
              keyboardType: TextInputType.text,
              validator: (value) => PasswordValidator(
                minLength: 8,
                strength: PasswordStrength.strong,
              ).validate(value),
              labelText: "Password",
              prefixIcon: Icons.password,
              suffixIcon: Icon(Icons.visibility),
            ), // Password Input
            FilledButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Normal Login");
                } else {
                  print("Error in  Login Form");
                }
              },
              buttonText: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
