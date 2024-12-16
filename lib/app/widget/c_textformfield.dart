import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final VoidCallback? onSuffixIconTap;
  final bool isObscured;
  final String icon;
  final String? Function(String?)? validator;
  final double? fontSize;
  final Iterable<String>? autofillHints;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.onSuffixIconTap,
    this.isObscured = true,
    required this.icon,
    this.validator,
    this.fontSize,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
      obscureText: isPassword ? isObscured : false,
      validator: validator,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        fillColor: const Color(0xff171e20),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
        prefixIcon: Padding(
          padding: EdgeInsets.all(20.w),
          child: SvgPicture.asset(
            icon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: Color(0xff8b8e8f))),
      ),
    );
  }
}

class CustomTextFormFieldDesktop extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final VoidCallback? onSuffixIconTap;
  final bool isObscured;
  final String icon;
  final String? Function(String?)? validator;
  final double? fontSize;
  final Iterable<String>? autofillHints;

  const CustomTextFormFieldDesktop({
    super.key,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.onSuffixIconTap,
    this.isObscured = true,
    required this.icon,
    this.validator,
    this.fontSize,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize ?? 18,
      ),
      obscureText: isPassword ? isObscured : false,
      validator: validator,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        fillColor: const Color(0xff1e2426),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize ?? 18,
          color: Colors.white70,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            icon,
            width: 28,
            height: 28,
          ),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Icon(
                  isObscured
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.white70,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff707070), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    );
  }
}
