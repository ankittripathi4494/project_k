import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_validator/i_validator.dart';
import 'package:intl/intl.dart';
import 'package:project_k/global/widgets/automatic_button_widget.dart';
import 'package:project_k/global/widgets/custom_dialog_widget.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/textform_field_widget_without_margin.dart';
import 'package:project_k/global/widgets/toast_widget.dart';
import 'package:project_k/modules/auth/blocs/register/register_bloc.dart';

class RegisterFormWidget extends StatelessWidget {
  RegisterFormWidget({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ValueNotifier<bool> showPassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> showConfirmPassword = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFormSubmissionProcession) {
            showDialog(
              context: context,
              builder: (context) =>
                  CustomDialogWidget(content: CircularProgressIndicator()),
            );
          }
          if (state is RegisterFormSubmissionSuccess) {
            Navigator.pop(context);
            ToastWidget.notifyWidget(
              context,
              type: NotifyType.success,
              message: state.successMessage,
            );
          }
          if (state is RegisterFormSubmissionFailed) {
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16.h,
                children: [
                  if (state is RegisterFormSubmissionSuccess)
                    AutomaticButtonWidget(
                      task: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (c) => true,
                          arguments: {'title': 'Login Screen'},
                        );
                      },
                      taskWaitDuration: Duration(seconds: 1),
                    ),

                  TextFormFieldWidgetWithoutMargin(
                    controller: fullNameController,
                    style: TextStyle(fontSize: 14.sp),
                    // maxLines: 5,
                    // minLines: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z0-9@._\-]'),
                      ),
                    ],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Full Name is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.person,
                    labelText: "Full Name",
                    counterText: "",
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
                    validator: (value) => EmailValidator().validate(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    labelText: "Email",
                    counterText: "",
                  ),
                  TextFormFieldWidgetWithoutMargin(
                    controller: phoneController,
                    style: TextStyle(fontSize: 14.sp),
                    // maxLines: 5,
                    // minLines: 1,
                    maxLength: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) =>
                        PhoneNumberValidator().validate(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.phone,
                    labelText: "Phone Number",
                    counterText: "",
                  ), // Phone Input
                  ValueListenableBuilder(
                    valueListenable: showPassword,
                    builder: (context, showPasswordValue, child) {
                      return TextFormFieldWidgetWithoutMargin(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14.sp),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9@.]'),
                          ),
                        ],
                        keyboardType: TextInputType.text,
                        obscureText: showPasswordValue,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          String? validationResult = PasswordValidator(
                            minLength: 8,
                            strength: PasswordStrength.strong,
                          ).validate(value);
                          if (validationResult != null) {
                            return validationResult;
                          }
                          // 2. Match validation (only when confirmPassword has some text)
                          if (confirmPasswordController.text.isNotEmpty &&
                              value != confirmPasswordController.text) {
                            return "Password and Confirm Password do not match";
                          }

                          return null;
                        },
                        labelText: "Password",
                        prefixIcon: Icons.password,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showPassword.value = !showPassword.value;
                          },
                          child: Icon(
                            showPasswordValue
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: showConfirmPassword,
                    builder: (context, showConfirmPasswordValue, child) {
                      return TextFormFieldWidgetWithoutMargin(
                        controller: confirmPasswordController,
                        style: TextStyle(fontSize: 14.sp),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9@.]'),
                          ),
                        ],
                        keyboardType: TextInputType.text,
                        obscureText: showConfirmPasswordValue,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          String? validationResult = PasswordValidator(
                            minLength: 8,
                            strength: PasswordStrength.strong,
                          ).validate(value);
                          if (validationResult != null) {
                            return validationResult;
                          } // 2. Match validation
                          if (passwordController.text.isNotEmpty &&
                              value != passwordController.text) {
                            return "Password and Confirm Password do not match";
                          }

                          return null;
                        },
                        labelText: "Confirm Password",
                        prefixIcon: Icons.password,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showConfirmPassword.value =
                                !showConfirmPassword.value;
                          },
                          child: Icon(
                            showConfirmPasswordValue
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ), // Password Input // Password Input
                  TextFormFieldWidgetWithoutMargin(
                    controller: dobController,
                    readOnly: true,
                    style: TextStyle(fontSize: 14.sp),
                    // maxLines: 5,
                    // minLines: 1,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1900, 1, 1),
                        initialDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                        ),
                        lastDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                        ),
                      ).then((c) {
                        dobController.text = DateFormat('d-M-y').format(c!);
                      });
                    },
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // validator: (value) => PhoneNumberValidator().validate(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.calendar_month,
                    labelText: "Date of Birth",
                    counterText: "",
                  ), // Phone Input
                  SizedBox(
                    width: 1.sw,
                    child: FilledButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterFormSubmissionEvent(
                              emailData: emailController.text,
                              passwordData: passwordController.text,
                              fullNameData: fullNameController.text,
                              phoneData: phoneController.text,
                              dobData: dobController.text,
                            ),
                          );
                        } else {
                          if (kDebugMode) {
                            print("Error in  Register Form");
                          }
                          ToastWidget.notifyWidget(
                            context,
                            type: NotifyType.error,
                            message: "Error in  Register Form",
                          );
                        }
                      },
                      buttonText: "Register",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
