import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldMobile extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String searchIcon;
  final String filterIcon;
  final Function onFilterTap;
  final bool enabled;
  //final void Function()? onTap;

  const SearchFieldMobile({
    super.key,
    required this.controller,
    required this.hintText,
    required this.searchIcon,
    required this.filterIcon,
    required this.onFilterTap,
    this.enabled = true,
    //this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //onTap: onTap,
      controller: controller,
      style: TextStyle(color: Colors.white, fontSize: 16.sp),
      enabled: enabled,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Color(0xff8b8e8f)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Color(0xff8b8e8f)),
        ),
      ),
    );
  }
}

class SearchFieldDesktop extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String searchIcon;
  final String filterIcon;
  final Function onFilterTap;
  final bool enabled;

  const SearchFieldDesktop({
    super.key,
    required this.controller,
    required this.hintText,
    required this.searchIcon,
    required this.filterIcon,
    required this.onFilterTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          color: Colors.white, fontSize: 16), // Static font size
      enabled: enabled,
      decoration: InputDecoration(
        fillColor: const Color(0xff171e20),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 16, color: Colors.white), // Static font size
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20), // Static padding
          child: SvgPicture.asset(
            searchIcon,
            width: 24, // Static width
            height: 24, // Static height
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () => onFilterTap(),
          child: Padding(
            padding: const EdgeInsets.all(12), // Static padding
            child: SvgPicture.asset(
              filterIcon,
              width: 24, // Static width
              height: 24, // Static height
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Static border radius
          borderSide: const BorderSide(color: Color(0xff8b8e8f)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // Static border radius
          borderSide: const BorderSide(color: Color(0xff8b8e8f)),
        ),
      ),
    );
  }
}
