import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_controller.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ChooseAvatarDesktop extends GetView<ChooseAvatarController> {
  const ChooseAvatarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseAvatarController());
    return Column(
      children: [
        const Text(
          'Choose Your Avatar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const Gap(20),
        CircleAvatar(
          backgroundColor: blueColor,
          radius: 200 / 2,
          child: CircleAvatar(
            radius: 198 / 2,
            backgroundColor: const Color(0xff161620),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Image.asset(Assets.images.fetchfiveProfilePic008.path),
            ),
          ),
        ),
        const Gap(30),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
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
                            radius: 66 / 2,
                            backgroundColor: const Color(0xff22222B),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 9),
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
                                  borderRadius: BorderRadius.circular(66 / 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (controller.selectedIndex.value == index)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16 / 2,
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
        const Gap(120)
      ],
    );
  }
}
