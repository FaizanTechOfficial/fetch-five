import 'dart:developer';

import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/moves_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeMobile extends GetView<DashboardController> {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.currentIndex.value == 0) {
      controller.playerInfo();
    }
    log('........Chili .............');
    return Container(
      child: Obx(() => controller.screenLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                                backgroundImage: controller.playerInfoModel
                                                .playerProfilePic !=
                                            null &&
                                        controller.playerInfoModel
                                            .playerProfilePic!.isNotEmpty
                                    ? NetworkImage(
                                        "$imageBaseUrl${controller.playerInfoModel.playerProfilePic}")
                                    : AssetImage(
                                        Assets.images.leftProfile.path),
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            Gap(10.h),
                            Text(
                              controller.playerInfoModel.playerName ?? 'none',
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
                            onTap: () {
                              controller.updateIndex(2);
                              controller.setOnBoardPlayerValue(false);
                              controller.onBoardValue(false);
                            },
                            child: SvgPicture.asset('assets/icons/edit.svg')),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () async {
                    controller.setOnBoardPlayerValue(true);
                    controller.onBoardValue(false);
                    await Get.toNamed(AppRoutes.newGame);
                  },
                  iconAlignment: IconAlignment.end,
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 20.w,
                    color: blueColor,
                  ),
                  label: Text(
                    'Start New Game',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: blueColor,
                    ),
                  ),
                ),
                Gap(10.h),
                controller.completedTurnGame.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.yourTurnLabel.toString(),
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
                                controller.yourTurnGame.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (controller
                                              .yourTurnGame[index].gameId !=
                                          null) {
                                        controller.getYourTurnGameDetails(
                                          controller
                                              .yourTurnGame[index].gameId!,
                                        );
                                        Get.find<DashboardController>()
                                            .isUserOneActive
                                            .value = controller
                                                .yourTurnGame[index]
                                                .thisPlayersTurn ??
                                            false;

                                        Get.find<DashboardController>()
                                            .isOnGameBoard
                                            .value = true;
                                        controller.setOnBoardPlayerValue(false);
                                        Get.find<DashboardController>()
                                            .update();
                                      }
                                    },
                                    child: MovesDetails(
                                      backgroundImage: controller
                                                      .yourTurnGame[index]
                                                      .opponentProfilePic !=
                                                  null &&
                                              controller
                                                  .yourTurnGame[index]
                                                  .opponentProfilePic!
                                                  .isNotEmpty
                                          ? NetworkImage(
                                              "$imageBaseUrl${controller.yourTurnGame[index].opponentProfilePic}")
                                          : AssetImage(
                                              Assets.images.leftProfile.path),
                                      title: controller
                                          .yourTurnGame[index].opponentName
                                          .toString(),
                                      subtitle: controller
                                          .yourTurnGame[index].squaresPlayed
                                          .toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Gap(24.h),
                          Text(
                            controller.theirTurnLabel.toString(),
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
                                controller.theirTurnGame.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      if (controller
                                              .theirTurnGame[index].gameId !=
                                          null) {
                                        controller.getTheirTurnGameDetails(
                                          controller
                                              .theirTurnGame[index].gameId!,
                                        );
                                        Get.find<DashboardController>()
                                            .isUserOneActive
                                            .value = controller
                                                .theirTurnGame[index]
                                                .thisPlayersTurn ??
                                            false;

                                        Get.find<DashboardController>()
                                            .isOnGameBoard
                                            .value = true;
                                        Get.find<DashboardController>()
                                            .update();
                                      }
                                    },
                                    child: MovesDetails(
                                      backgroundImage: controller
                                                      .theirTurnGame[index]
                                                      .opponentProfilePic !=
                                                  null &&
                                              controller
                                                  .theirTurnGame[index]
                                                  .opponentProfilePic!
                                                  .isNotEmpty
                                          ? NetworkImage(
                                              "$imageBaseUrl${controller.theirTurnGame[index].opponentProfilePic}")
                                          : AssetImage(
                                              Assets.images.leftProfile.path),
                                      title: controller
                                          .theirTurnGame[index].opponentName
                                          .toString(),
                                      subtitle: controller
                                          .theirTurnGame[index].squaresPlayed
                                          .toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Gap(24.h),
                          Text(
                            controller.completedTurnLabel.toString(),
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
                                controller.completedTurnGame.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (controller.completedTurnGame[index]
                                              .gameId !=
                                          null) {
                                        controller.getCompletedGameDetails(
                                          controller
                                              .completedTurnGame[index].gameId!,
                                        );
                                        Get.find<DashboardController>()
                                            .isOnGameBoard
                                            .value = true;
                                        Get.find<DashboardController>()
                                            .update();
                                      }
                                    },
                                    child: MovesDetails(
                                      backgroundImage: controller
                                                      .completedTurnGame[index]
                                                      .opponentProfilePic !=
                                                  null &&
                                              controller
                                                  .completedTurnGame[index]
                                                  .opponentProfilePic!
                                                  .isNotEmpty
                                          ? NetworkImage(
                                              "$imageBaseUrl${controller.completedTurnGame[index].opponentProfilePic}")
                                          : AssetImage(
                                              Assets.images.leftProfile.path),
                                      title: controller
                                          .completedTurnGame[index].opponentName
                                          .toString(),
                                      subtitle: controller
                                          .yourTurnGame[index].squaresPlayed
                                          .toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            )),
    );
  }
}
