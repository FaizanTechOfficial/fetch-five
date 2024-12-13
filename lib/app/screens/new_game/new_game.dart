import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/screens/new_game/components/players_boxes.dart';
import 'package:fetch_five/app/screens/new_game/components/search_dialog_widget.dart';
import 'package:fetch_five/app/screens/new_game/components/search_field.dart';
import 'package:fetch_five/app/screens/new_game/new_game_controller.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NewGame extends GetView<NewGameController> {
  const NewGame({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Responsive(
      mobile: Scaffold(
          backgroundColor: const Color(0xff0A0A14),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Image.asset(
              Assets.images.fiveTile.path,
              height: 50.h,
            ),
          ),
          body: Obx(
            () => dashboardController.screenLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(50.h),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Start a New Game',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Gap(20.h),
                          GestureDetector(
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                barrierLabel: 'Search',
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration:
                                    const Duration(milliseconds: 300),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return const SearchDialogWidgetMobile();
                                },
                                transitionBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var opacityAnimation =
                                      Tween(begin: 0.0, end: 1.0)
                                          .animate(animation);
                                  var scaleAnimation =
                                      Tween(begin: 0.8, end: 1.0)
                                          .animate(animation);

                                  return FadeTransition(
                                    opacity: opacityAnimation,
                                    child: ScaleTransition(
                                      scale: scaleAnimation,
                                      child: child,
                                    ),
                                  );
                                },
                              );
                            },
                            child: SearchFieldMobile(
                              enabled: false,
                              controller: TextEditingController(),
                              hintText: 'Search',
                              searchIcon: Assets.icons.search.path,
                              filterIcon: Assets.icons.filter.path,
                              onFilterTap: () {},
                            ),
                          ),
                          Gap(30.h),
                          Text(
                            'Human Player',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Gap(20.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 88.h,
                              mainAxisSpacing: 18.w,
                              crossAxisSpacing: 10.h,
                              crossAxisCount: 2,
                            ),
                            itemCount: dashboardController
                                .availablePlayers.humanPlayers?.length,
                            itemBuilder: (context, index) {
                              return PlayersBoxesMobile(
                                onTap: () async {
                                  controller.newGame(dashboardController
                                      .humanPlayers![index].playerId
                                      .toString());
                                  dashboardController.isOnGameBoard.value =
                                      true;
                                  await Get.offAndToNamed(AppRoutes.game);
                                },
                                image:
                                    "$imageBaseUrl${dashboardController.availablePlayers.humanPlayers?[index].profilePic}",
                                text: dashboardController.availablePlayers
                                    .humanPlayers![index].playerName
                                    .toString(),
                              );
                            },
                          ),
                          Gap(30.h),
                          Text(
                            'Robot Player',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Gap(20.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 88.h,
                              mainAxisSpacing: 18.w,
                              crossAxisSpacing: 10.h,
                              crossAxisCount: 2,
                            ),
                            itemCount: dashboardController
                                .availablePlayers.robotPlayers?.length,
                            itemBuilder: (context, index) {
                              return PlayersBoxesMobile(
                                onTap: () {
                                  controller.newGame(dashboardController
                                      .robotPlayers![index].playerId
                                      .toString());
                                  Get.offAndToNamed(AppRoutes.game);
                                },
                                image:
                                    "$imageBaseUrl${dashboardController.availablePlayers.robotPlayers?[index].profilePic}",
                                text: dashboardController.availablePlayers
                                    .robotPlayers![index].playerName
                                    .toString(),
                              );
                            },
                          ),
                          Gap(30.h),
                        ],
                      ),
                    ),
                  ),
          )),
      desktop: Scaffold(
        backgroundColor: const Color(0xff0A0A14),
        body: Center(
          child: SizedBox(
            width: 428,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.white,
                        ),
                      ),
                      centerTitle: true,
                      title: Image.asset(
                        Assets.images.fiveTile.path,
                        height: 50,
                      ),
                    ),
                    const Gap(50),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Start a New Game',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Gap(20),
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierLabel: 'Hello',
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const SearchDialogWidgetDesktop();
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var opacityAnimation =
                                Tween(begin: 0.0, end: 1.0).animate(animation);
                            var scaleAnimation =
                                Tween(begin: 0.8, end: 1.0).animate(animation);

                            return FadeTransition(
                              opacity: opacityAnimation,
                              child: ScaleTransition(
                                scale: scaleAnimation,
                                child: child,
                              ),
                            );
                          },
                        );
                      },
                      child: SearchFieldDesktop(
                        enabled: false,
                        controller: TextEditingController(),
                        hintText: 'Search',
                        searchIcon: Assets.icons.search.path,
                        filterIcon: Assets.icons.filter.path,
                        onFilterTap: () {},
                      ),
                    ),
                    const Gap(30),
                    const Text(
                      'Human Players',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 88,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: dashboardController
                          .availablePlayers.humanPlayers?.length,
                      itemBuilder: (context, index) {
                        return PlayersBoxesDesktop(
                          onTap: () {
                            controller.newGame(dashboardController
                                .humanPlayers![index].playerId
                                .toString());
                            dashboardController.isOnGameBoard.value = true;
                            Get.offAndToNamed(AppRoutes.game);
                          },
                          image:
                              "$imageBaseUrl${dashboardController.availablePlayers.humanPlayers?[index].profilePic}",
                          text: dashboardController
                              .availablePlayers.humanPlayers![index].playerName
                              .toString(),
                        );
                      },
                    ),
                    const Gap(30),
                    const Text(
                      'Robot Players',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 88,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: dashboardController
                          .availablePlayers.robotPlayers?.length,
                      itemBuilder: (context, index) {
                        return PlayersBoxesDesktop(
                          onTap: () {
                            controller.newGame(dashboardController
                                .robotPlayers![index].playerId
                                .toString());
                            Get.offAndToNamed(AppRoutes.game);
                          },
                          image:
                              "$imageBaseUrl${dashboardController.availablePlayers.robotPlayers?[index].profilePic}",
                          text: dashboardController
                              .availablePlayers.robotPlayers![index].playerName
                              .toString(),
                        );
                      },
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
