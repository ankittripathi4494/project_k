import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_validator/i_validator.dart';
import 'package:project_k/global/widgets/custom_alert_dialog_widget.dart';
import 'package:project_k/global/widgets/custom_dialog_widget.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/text_button_widget.dart';
import 'package:project_k/global/widgets/textform_field_widget_without_margin.dart';
import 'package:project_k/global/widgets/toast_widget.dart';

/*
Login Form Widget -> Inputs for email and password along with login button, and Forget Password link.

*/
class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier<bool>(true);
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
            TextFormFieldWidgetWithoutMargin(
              controller: emailController,
              style: TextStyle(fontSize: 14.sp),
              // maxLines: 5,
              // minLines: 1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => EmailValidator().validate(value),

              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              labelText: "Email",
              counterText: "",
            ), // Email Input

            ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (context, showPasswordValue, child) {
                return TextFormFieldWidgetWithoutMargin(
                  controller: passwordController,
                  style: TextStyle(fontSize: 14.sp),
                  obscureText: showPasswordValue,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
                  ],
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => PasswordValidator(
                    minLength: 8,
                    strength: PasswordStrength.strong,
                  ).validate(value),
                  labelText: "Password",
                  prefixIcon: Icons.password,
                  suffixIcon: GestureDetector(
                    child: Icon(
                      showPasswordValue
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onTap: () {
                      showPassword.value = !showPassword.value;
                    },
                  ),
                );
              },
            ), // Password Input
            SizedBox(
              width: 1.sw,
              child: FilledButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Normal Login");
                  } else {
                    print(
                      "Error in  Login Form",
                    ); // Error show on console to developer not user
                   ToastWidget.notifyWidget(context, type: NotifyType.error, message: "Error in  Login Form");
                  }
                },
                buttonText: "Login",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButtonWidget(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {
                    print("Forget Password Clicked");
                  },
                  buttonText: "Forget Password?",
                ),
                TextButtonWidget(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/register',
                      arguments: {'title': 'Create New Account'},
                    );
                  },
                  buttonText: "Register Here",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
