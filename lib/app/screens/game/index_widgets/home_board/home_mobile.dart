import 'package:fetch_five/app/screens/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/moves_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeMobile extends GetView<GameController> {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 168.h,
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          decoration: BoxDecoration(
            color: const Color(0xff191e2b),
            borderRadius: BorderRadius.circular(26.r),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: blueColor,
                          width: 6,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundImage:
                            const AssetImage('assets/images/left_profile.png'),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Gap(10.h),
                    Text(
                      'SeanM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.r,
                right: 10.r,
                child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/edit.svg')),
              ),
            ],
          ),
        ),
        Gap(24.h),
        Text(
          'Your move',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        Gap(10.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff22222b),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: const MovesDetails(
              imagePath: 'assets/images/left_profile.png',
              title: 'SeanM',
              subtitle: 'Langford'),
        ),
        Gap(24.h),
        Text(
          'Other move',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        Gap(10.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff22222b),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: const MovesDetails(
              imagePath: 'assets/images/left_profile.png',
              title: 'SeanM',
              subtitle: 'Langford'),
        ),
        Gap(24.h),
        Text(
          'Completed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        Gap(10.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff22222b),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: List.generate(
              4,
              (index) {
                return const MovesDetails(
                    imagePath: 'assets/images/left_profile.png',
                    title: 'SeanM',
                    subtitle: 'Langford');
              },
            ),
          ),
        ),
      ],
    );
  }
}
