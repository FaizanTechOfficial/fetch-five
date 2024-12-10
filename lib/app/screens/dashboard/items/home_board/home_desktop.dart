import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/moves_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeDesktop extends GetView<DashboardController> {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.currentIndex == 0) {
      controller.playerInfo();
    }

    return Obx(
      () => controller.screenLoading.value
          ? const CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 168,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            const Gap(10),
                            Text(
                              controller.playerInfoModel.playerName ?? 'none',
                              style: const TextStyle(
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
                TextButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoutes.newGame);
                  },
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: blueColor,
                  ),
                  label: const Text(
                    'Start New Game',
                    style: TextStyle(
                      fontSize: 15,
                      color: blueColor,
                    ),
                  ),
                ),
                const Gap(10),
                controller.completedTurnGame.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.yourTurnLabel.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff22222b),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: List.generate(
                                controller.yourTurnGame.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
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
                                        Get.find<DashboardController>()
                                            .update();
                                      }
                                    },
                                    child: MovesDetailsDesktop(
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
                          const Gap(24),
                          Text(
                            controller.theirTurnLabel.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff22222b),
                              borderRadius: BorderRadius.circular(24),
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
                                    child: MovesDetailsDesktop(
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
                          const Gap(24),
                          Text(
                            controller.completedTurnLabel.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff22222b),
                              borderRadius: BorderRadius.circular(24),
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
                                    child: MovesDetailsDesktop(
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
            ),
    );
  }
}
