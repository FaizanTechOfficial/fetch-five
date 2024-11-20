import 'package:flutter/material.dart';

class CardFillers extends StatelessWidget {

  const CardFillers({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 62,
      decoration: BoxDecoration(
        color: const Color(0xff22222B),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xff333333),
        ),
      ),
    );
  }
}
