import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_controller.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChooseAvatarMobile extends GetView<ChooseAvatarController> {
  const ChooseAvatarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChooseAvatarController>();
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
            backgroundColor: const Color(0xff161620),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
              child: Image.asset(Assets.images.fetchfiveProfilePic008.path),
            ),
          ),
        ),
        Gap(30.h),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5.w,
          runSpacing: 10.w,
          children: List.generate(
            controller.images.length,
            (index) {
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
                            backgroundColor: const Color(0xff22222B),
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
                          child: SvgPicture.asset(Assets.icons.check.path),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Gap(120.h)
      ],
    );
  }
}
