import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayersBoxesMobile extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? onTap;
  const PlayersBoxesMobile({
    super.key,
    required this.image,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    log('image $image');
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                height: 48.h,
                width: 48.h,
              ),
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
      ),
    );
  }
}

class PlayersBoxesDesktop extends StatelessWidget {
  final String image;
  final String text;
  final void Function()? onTap;
  const PlayersBoxesDesktop(
      {super.key, required this.image, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff171e20),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xff8b8e8f),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                height: 48,
                width: 48,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
