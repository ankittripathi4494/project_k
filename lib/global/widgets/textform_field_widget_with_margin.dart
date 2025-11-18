import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidgetWithMargin extends StatelessWidget {
  final bool? darkTheme;
  final TextEditingController controller;
  final bool? formEnabled;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? prefix;
  final String? prefixText;
  final IconData? prefixIcon;
  final Widget? suffix;
  final String? suffixText;
  final Widget? suffixIcon;
  final Widget? helper;
  final String? helperText;
  final Widget? label;
  final String? labelText;
  final Iterable<String>? autofillHints;
  final String? hintText;
  final Widget? error;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool? isDense;
  final bool? readOnly;
  final bool? obscureText;
  final String? counterText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final TextStyle? helperStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;

  const TextFormFieldWidgetWithMargin({
    super.key,
    this.darkTheme = false,
    required this.controller,
    this.formEnabled = true,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.icon,
    this.prefix,
    this.prefixText,
    this.prefixIcon,
    this.suffix,
    this.suffixText,
    this.suffixIcon,
    this.helper,
    this.helperText,
    this.label,
    this.labelText,
    this.autofillHints,
    this.hintText,
    this.error,
    this.errorText,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.errorStyle,
    this.contentPadding = const EdgeInsets.all(5),
    this.isDense = false,
    this.readOnly = false,
    this.obscureText = false,
    this.counterText = '',
    this.style,
     this.helperStyle,
      this.hintStyle,
       this.labelStyle,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0.r),
      margin: EdgeInsets.only(
        // top: 10.h,
        left: 10.w,
        right: 10.w,
      ),
      child: TextFormField(
        validator: validator,
        onTap: onTap,
        autofillHints: autofillHints,
        enabled: formEnabled,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: (obscureText == true) ? 1 : maxLines,
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        obscureText: obscureText!,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly ?? false,
        style:
            style ??
            TextStyle(
              fontSize: 12.sp,
              color: (formEnabled == true)
                  ? ((darkTheme == true) ? Colors.white : Colors.black)
                  : ((darkTheme == false) ? Colors.orange : Colors.green),
            ),
        decoration: InputDecoration(
          isDense: isDense,
          contentPadding: contentPadding,
          counterText: counterText,
          icon: (icon != null) ? icon : null,
          iconColor: (formEnabled == true)
              ? ((darkTheme == true) ? Colors.white : Colors.black)
              : ((darkTheme == false) ? Colors.orange : Colors.green),
          prefix: (prefix != null) ? prefix : null,
          prefixText: (prefixText != null) ? prefixText : null,
          prefixIcon: (prefixIcon != null)
              ? Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Icon(prefixIcon, size: 20.r),
                )
              : null,
          prefixIconColor: (formEnabled == true)
              ? ((darkTheme == true) ? Colors.white : Colors.black)
              : ((darkTheme == false) ? Colors.orange : Colors.green),
          suffix: (suffix != null) ? suffix : null,
          suffixText: (suffixText != null) ? suffixText : null,
          suffixIcon: (suffixIcon != null)
              ? Padding(padding: EdgeInsets.all(8.0.r), child: suffixIcon)
              : null,
          suffixIconColor: (formEnabled == true)
              ? ((darkTheme == true) ? Colors.white : Colors.black)
              : ((darkTheme == false) ? Colors.orange : Colors.green),
          helper: (helper != null) ? helper : null,
          helperText: (helperText != null) ? helperText : null,
          helperStyle: helperStyle?? TextStyle(
            fontSize: 12.sp,
            color: (formEnabled == true)
                ? ((darkTheme == true) ? Colors.white : Colors.black)
                : ((darkTheme == false) ? Colors.orange : Colors.green),
          ),
          label: (label != null) ? label : null,
          labelText: (labelText != null) ? labelText : null,
          labelStyle: labelStyle??TextStyle(
            fontSize: 12.sp,
            color: (formEnabled == true)
                ? ((darkTheme == true) ? Colors.white : Colors.black)
                : ((darkTheme == false) ? Colors.orange : Colors.green),
          ),
          hintText: (hintText != null) ? hintText : null,
          hintStyle:  hintStyle??TextStyle(
            fontSize: 12.sp,
            color: (formEnabled == true)
                ? ((darkTheme == true) ? Colors.white : Colors.black)
                : ((darkTheme == false) ? Colors.orange : Colors.green),
          ),
          error: (error != null) ? error : null,
          errorText: (errorText != null) ? errorText : null,
          errorStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red, width: 1.r),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: (darkTheme == false) ? Colors.orange : Colors.green,
              width: 1.r,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: (formEnabled == true)
                  ? ((darkTheme == false) ? Colors.black : Colors.white)
                  : ((darkTheme == false) ? Colors.orange : Colors.green),
              width: 1.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: (formEnabled == true)
                  ? ((darkTheme == false) ? Colors.black : Colors.white)
                  : ((darkTheme == false) ? Colors.orange : Colors.green),
              width: 1.r,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: (formEnabled == true)
                  ? ((darkTheme == false) ? Colors.black : Colors.white)
                  : ((darkTheme == false) ? Colors.orange : Colors.green),
              width: 1.r,
            ),
          ),
        ),
      ),
    );
  }
}
