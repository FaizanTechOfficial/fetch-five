import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentCardCount extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const CurrentCardCount({
    super.key,
    this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: 12.w,
      height: 16.h,
      decoration: BoxDecoration(
        color: color ?? const Color(0xff22222B),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: color ?? const Color(0xff22222B),
        ),
      ),
      child: child,
    );
  }
}

class CurrentCardCountDesktop extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const CurrentCardCountDesktop({
    super.key,
    this.child,
    this.width,
    this.height,
    this.color,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width ?? 12.0,
      height: height ?? 16.0,
      decoration: BoxDecoration(
        color: color ?? const Color(0xff22222B),
        borderRadius: BorderRadius.circular(radius ?? 3.0),
        border: Border.all(
          color: color ?? const Color(0xff22222B),
        ),
      ),
      child: child,
    );
  }
}
