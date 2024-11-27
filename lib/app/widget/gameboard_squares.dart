import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameboardSquares extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final bool isClicked;

  const GameboardSquares({
    super.key,
    required this.text,
    this.onTap,
    this.color = const Color(0xff22222B),
    this.textColor = Colors.white,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: color,
          border: Border.all(
            color: const Color(0xff89BCC5).withOpacity(0.1),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: isClicked ? Colors.transparent : textColor,
//              color: Color.fromARGB(255, 183, 196, 198),
//              color: Color(0xff22222B),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class GameboardSquaresDesktop extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final bool isClicked;

  const GameboardSquaresDesktop({
    super.key,
    required this.text,
    this.onTap,
    this.color = const Color(0xff22222B),
    this.textColor = Colors.white,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), // Fixed radius
          color: color,
          border: Border.all(
            color: const Color(0xff89BCC5).withOpacity(0.1),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.0, // Fixed font size
              fontWeight: FontWeight.normal,
              color: isClicked ? Colors.transparent : textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
