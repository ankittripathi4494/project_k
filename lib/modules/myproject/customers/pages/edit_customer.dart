import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_validator/validators/email_validator.dart';
import 'package:i_validator/validators/phone_validator.dart';
import 'package:project_k/global/widgets/filled_button_widget.dart';
import 'package:project_k/global/widgets/my_custom_app_bar.dart';
import 'package:project_k/global/widgets/textform_field_widget_without_margin.dart';

class EditCustomerScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  EditCustomerScreen({super.key, this.arguments});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  TextEditingController customerName = TextEditingController();

  TextEditingController customerPhone = TextEditingController();

  TextEditingController customerEmail = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        titleText:
            (widget.arguments != null && widget.arguments!.containsKey('title'))
            ? widget.arguments!['title']
            : "Edit Customer",
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16.h,
            children: [
              TextFormFieldWidgetWithoutMargin(
                controller: customerName,
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
                labelText: "Customer Name",
                counterText: "",
              ),
              TextFormFieldWidgetWithoutMargin(
                controller: customerEmail,
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
                labelText: "Customer Email",
                counterText: "",
              ),
              TextFormFieldWidgetWithoutMargin(
                controller: customerPhone,
                style: TextStyle(fontSize: 14.sp),
                // maxLines: 5,
                // minLines: 1,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => PhoneNumberValidator().validate(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.phone,
                labelText: "Customer Phone Number",
                counterText: "",
              ),

              // Phone Input
              SizedBox(
                width: 1.sw,
                child: FilledButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  buttonText: "Edit Ciustomer",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
