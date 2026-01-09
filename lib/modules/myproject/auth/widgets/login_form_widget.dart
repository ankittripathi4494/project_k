import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_validator/i_validator.dart';
import 'package:project_k/global/helpers/secure_session_helper.dart';
import 'package:project_k/global/widgets/automatic_button_widget.dart';
import 'package:project_k/global/widgets/custom_dialog_widget.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/icon_button_widget.dart';
import 'package:project_k/global/widgets/text_button_widget.dart';
import 'package:project_k/global/widgets/textform_field_widget_without_margin.dart';
import 'package:project_k/global/widgets/toast_widget.dart';
import 'package:project_k/modules/myproject/auth/blocs/login/login_bloc.dart';

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
    /*

BlocBuilder

BlocListener

BlocConsumer

*/

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFormSubmissionProcession) {
            showDialog(
              context: context,
              builder: (context) =>
                  CustomDialogWidget(content: CircularProgressIndicator()),
            );
          }
          if (state is LoginFormSubmissionSuccess) {
            Navigator.pop(context);
            ToastWidget.notifyWidget(
              context,
              type: NotifyType.success,
              message: state.successMessage,
            );
          }
          if (state is LoginFormSubmissionFailed) {
            Navigator.pop(context);
            ToastWidget.notifyWidget(
              context,
              type: NotifyType.error,
              message: state.errorMessage,
            );
          }
        },

        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.h,
              children: [
                if (state is LoginFormSubmissionSuccess)
                  AutomaticButtonWidget(
                    task: () {
                      SecureSessionHelper().setData(
                        'isLoggedIn',
                        true.toString(),
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/dashboard',
                        (c) => true,
                        arguments: {'title': 'Dashboard Screen'},
                      );
                    },
                    taskWaitDuration: Duration(seconds: 1),
                  ),

                TextFormFieldWidgetWithoutMargin(
                  controller: emailController,
                  style: TextStyle(fontSize: 14.sp),
                  // maxLines: 5,
                  // minLines: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9@._\-]'),
                    ),
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
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@.]'),
                        ),
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
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginFormSubmissionEventWithUsernameAndPassword(
                            usernameData: emailController.text,
                            passwordData: passwordController.text,
                          ),
                        );
                      } else {
                        if (kDebugMode) {
                          print("Error in  Login Form");
                        } // Error show on console to developer not user
                        ToastWidget.notifyWidget(
                          context,
                          type: NotifyType.error,
                          message: "Error in  Login Form",
                        );
                      }
                    },
                    buttonText: "Login",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButtonWidget(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (kDebugMode) {
                          print("Forget Password Clicked");
                        }
                      },
                      buttonText: "Forget Password?",
                    ),
                    TextButtonWidget(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonWidget(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(
                          context,
                        ).add(GoogleLoginEvent());
                      },
                      icon: Icon(FontAwesomeIcons.google),
                    ),
                    IconButtonWidget(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (kDebugMode) {
                          print("Forget Password Clicked");
                        }
                      },
                      icon: Icon(FontAwesomeIcons.facebookF),
                    ),
                    IconButtonWidget(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (kDebugMode) {
                          print("Forget Password Clicked");
                        }
                      },
                      icon: Icon(FontAwesomeIcons.github),
                    ),
                    IconButtonWidget(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (kDebugMode) {
                          print("Forget Password Clicked");
                        }
                      },
                      icon: Icon(FontAwesomeIcons.phone),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
