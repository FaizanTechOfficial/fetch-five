import 'package:flutter/material.dart';

class YourCardPlayable extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String text;

  const YourCardPlayable({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 62,
      decoration: BoxDecoration(
        color:
            color ?? const Color.fromARGB(255, 221, 213, 135),
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(2, 2)
          )
        ]
      ),
      child: Center(
        child: 
          Text(
            text,
            style: 
              const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color.fromARGB(255, 78, 76, 72)
              ),
            ),
      ),
    );
  }
}
