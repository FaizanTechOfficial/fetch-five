import 'package:flutter/material.dart';

class LastCardPlayed extends StatelessWidget {
  final Color cardColor;
  final String text;

  const LastCardPlayed({
    super.key,
    required this.cardColor,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 38,
      decoration: BoxDecoration(
        color: cardColor,
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
        child: Text(
          text,
          style:
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12
            ),
          ),
      ),
    );
  }
}
