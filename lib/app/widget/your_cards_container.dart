import 'package:flutter/material.dart';

class YourCardContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? radius;

  const YourCardContainer({
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
      width: 320,
      height: 80,
      decoration: BoxDecoration(
        color: color ?? const Color(0xff22222B),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color:
              color == null ? const Color(0xff333333) : const Color(0xffFFFFFF),
        ),
      ),
      child: child,
    );
  }
}
