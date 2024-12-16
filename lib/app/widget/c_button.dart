import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final Widget? child;
  final double? height;
  final double? width;

  const CustomButton(
      {super.key, this.onTap, this.color, this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 64.h,
        decoration: BoxDecoration(
          color: color ?? const Color(0xff04AA6D),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class CustomButtonDesktop extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final Widget? child;
  final double? height;
  final double? width;

  const CustomButtonDesktop({
    super.key,
    this.onTap,
    this.color,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 64.0,
        decoration: BoxDecoration(
          color: color ?? const Color(0xff04AA6D),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(child: child),
      ),
    );
  }
}
