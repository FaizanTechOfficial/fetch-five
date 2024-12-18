import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fetch_five/app/widget/visual_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InstructionsMobile extends StatelessWidget {
  const InstructionsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42.h,
          decoration: BoxDecoration(
            color: const Color(0xff22222B),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              'Instructions',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  wordSpacing: 3),
            ),
          ),
        ),
        Gap(20.h),
        const Divider(
          color: Color(0xff2C2C2C),
          thickness: 1.5,
        ),
        Gap(20.h),
        const Text(
          'Objective',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Gap(20.h),
        const Text(
          textAlign: TextAlign.center,
          'The goal of the game is to capture any 5 adjoining squares in a row. ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Gap(20.h),
        Row(
          children: [
            Container(
              width: 95.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xff22222b),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  Text(
                    'Vertical',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Gap(15.h),
                  Image.asset(Assets.images.vertical.path)
                ],
              ),
            ),
            Gap(10.h),
            Container(
              width: 95.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xff22222b),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  Text(
                    'Vertical',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Gap(15.h),
                  Image.asset(Assets.images.horizontal.path)
                ],
              ),
            ),
            Gap(10.h),
            Container(
              width: 169.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xff22222b),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                children: [
                  Text(
                    'Diagonal',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 106.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.diagonalOne.path,
                          width: 61.w,
                        ),
                        Image.asset(
                          Assets.images.diagonalTwo.path,
                          width: 61.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(50.h),
        const Text(
          'Play a Square',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Gap(20.h),
        const Text(
          textAlign: TextAlign.center,
          'Each player starts with 4 cards. When you select a card, you are able to capture a square on the gameboard with a value equal to or greater than the value shown on the card.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Gap(30.h),
        const Text(
          'Draw a Card',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Gap(20.h),
        const Text(
          textAlign: TextAlign.center,
          "There are 100 cards in the deck, and each card has a unique value from 0 to 99. Each player can have по more than 4 cards in their hand at any given time, and drawing a new card consumes the player's turn.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Gap(30.h),
        const Text(
          'Visual Indicators',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        Gap(10.h),
        VisualIndicators(
          imagePath: Assets.images.occBox.path,
          title: "Opponent's Card Count",
          description:
              "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
        ),
        Gap(10.h),
        VisualIndicators(
          imagePath: Assets.images.occPink.path,
          title: "Opponent's Card Count",
          description:
              "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
        ),
        Gap(10.h),
        VisualIndicators(
          imagePath: Assets.images.occBlue.path,
          title: "Opponent's Card Count",
          description:
              "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
        ),
        Gap(40.h),
      ],
    );
  }
}
