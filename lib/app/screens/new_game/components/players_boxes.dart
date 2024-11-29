import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayersBoxes extends StatelessWidget {
  final String image;
  final String text;
  const PlayersBoxes({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff171e20),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xff8b8e8f),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 48.h,
            width: 48.h,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
