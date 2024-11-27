import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameplayButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color textColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const GameplayButton({
    super.key,
    required this.text,
    required this.textColor,
    this.color,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: width ?? 150.w,
        height: height ?? 50.h,
        decoration: BoxDecoration(
            color: color ?? const Color.fromARGB(255, 76, 167, 114),
            borderRadius: BorderRadius.circular(80.r),
            border: Border.all(
              color: const Color(0xff446A55),
            )),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class GameplayButtonDesktop extends StatelessWidget {
  final String text;
  final Color? color;
  final Color textColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const GameplayButtonDesktop({
    super.key,
    required this.text,
    required this.textColor,
    this.color,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: width ?? 150.0,
        height: height ?? 50.0,
        decoration: BoxDecoration(
          color: color ?? const Color.fromARGB(255, 76, 167, 114),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: const Color(0xff446A55),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
