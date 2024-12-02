import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/moves_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeDesktop extends GetView<DashboardController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 168,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff191e2b),
            borderRadius: BorderRadius.circular(26),
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
                        radius: 40,
                        backgroundImage:
                            const AssetImage('assets/images/left_profile.png'),
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    Gap(10),
                    Text(
                      'SeanM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      controller.updateIndex(2);
                    },
                    child: SvgPicture.asset('assets/icons/edit.svg')),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {
              Get.toNamed(AppRoutes.newGame);
            },
            iconAlignment: IconAlignment.end,
            icon: Icon(
              Icons.arrow_forward,
              size: 20,
              color: blueColor,
            ),
            label: Text(
              'Start New Game',
              style: TextStyle(
                fontSize: 15,
                color: blueColor,
              ),
            ),
          ),
        ),
        Gap(10),
        Text(
          'Your move',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Gap(10),
        GestureDetector(
          onTap: () {
            Get.find<DashboardController>().isOnGameBoard.value = true;
            Get.find<DashboardController>().update();
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff22222b),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const MovesDetailsDesktop(
                imagePath: 'assets/images/left_profile.png',
                title: 'SeanM',
                subtitle: 'Langford'),
          ),
        ),
        Gap(24),
        Text(
          'Other move',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Gap(10),
        GestureDetector(
          onTap: () {
            Get.find<DashboardController>().isOnGameBoard.value = true;
            Get.find<DashboardController>().update();
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff22222b),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const MovesDetailsDesktop(
                imagePath: 'assets/images/left_profile.png',
                title: 'SeanM',
                subtitle: 'Langford'),
          ),
        ),
        Gap(24),
        Text(
          'Completed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Gap(10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff22222b),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: List.generate(
              4,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Get.find<DashboardController>().isOnGameBoard.value = true;
                    Get.find<DashboardController>().update();
                  },
                  child: const MovesDetailsDesktop(
                      imagePath: 'assets/images/left_profile.png',
                      title: 'SeanM',
                      subtitle: 'Langford'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
