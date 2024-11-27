import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class MenuItem extends StatelessWidget {
  final String svgPath;
  final String title;
  final VoidCallback? onTap;
  final double? width;

  const MenuItem({
    super.key,
    required this.svgPath,
    required this.title,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 52,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: const Color(0xff2f2f2f),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 24.h,
              width: 24.w,
            ),
            Gap(20.h),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemDesktop extends StatelessWidget {
  final String svgPath;
  final String title;
  final VoidCallback? onTap;
  final double? width;

  const MenuItemDesktop({
    super.key,
    required this.svgPath,
    required this.title,
    this.onTap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:
            width ?? double.infinity, // Default to full width if not provided
        height: 52.0, // Fixed height
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: const Color(0xff2f2f2f),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 24.0, // Fixed height
              width: 24.0, // Fixed width
            ),
            const SizedBox(width: 20.0), // Gap replaced with SizedBox
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0, // Fixed font size
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
