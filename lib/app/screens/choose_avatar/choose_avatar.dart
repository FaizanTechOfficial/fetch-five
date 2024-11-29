import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_controller.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseAvatarController());
    return Column(
      children: [
        Text(
          'Choose Your Avatar',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Gap(20.h),
        CircleAvatar(
          backgroundColor: blueColor,
          radius: 200 / 2.r,
          child: CircleAvatar(
            radius: 198 / 2.r,
            backgroundColor: Color(0xff161620),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
              child: Image.asset('assets/images/fetchfive-profile-pic-008.png'),
            ),
          ),
        ),
        Gap(30.h),
        SizedBox(
          height: 620.h,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectAvatar(index);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 66 / 2.r,
                            backgroundColor: Color(0xff22222B),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.w, vertical: 9.h),
                              child: Image.asset(controller.images[index]),
                            ),
                          ),
                          if (controller.selectedIndex.value == index)
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                  borderRadius: BorderRadius.circular(66 / 2.r),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (controller.selectedIndex.value == index)
                      Positioned(
                        bottom: 0.h,
                        right: 0.w,
                        child: CircleAvatar(
                          radius: 16 / 2.r,
                          backgroundColor: Colors.green,
                          child: SvgPicture.asset('assets/icons/check.svg'),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Gap(90.h)
      ],
    );
  }
}
