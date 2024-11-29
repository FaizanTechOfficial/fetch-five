import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String searchIcon;
  final String filterIcon;
  final Function onFilterTap;

  const SearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.searchIcon,
    required this.filterIcon,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
      decoration: InputDecoration(
        fillColor: const Color(0xff171e20),
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
        prefixIcon: Padding(
          padding: EdgeInsets.all(20.w),
          child: SvgPicture.asset(
            searchIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () => onFilterTap(),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              filterIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Color(0xff8b8e8f)),
        ),
      ),
    );
  }
}
