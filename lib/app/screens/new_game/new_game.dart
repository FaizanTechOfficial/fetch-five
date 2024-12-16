import 'dart:developer';

import 'package:fetch_five/app/data/gen/assets.gen.dart';
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

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  final GlobalKey<ScaffoldState> newGameKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Get.find<DashboardController>();
      await controller.startNewGame();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final controller = Get.find<NewGameController>();
    log('controller.screenLoading ${controller.screenLoading.value}');
    return Responsive(
      mobile: Obx(
        () => dashboardController.screenLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                key: newGameKey,
                backgroundColor: const Color(0xff0A0A14),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      dashboardController.setOnBoardPlayerValue(false);
                      dashboardController.onBoardValue(false);
                      dashboardController.updateIndex(0);
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
                body: SingleChildScrollView(
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
                                var scaleAnimation = Tween(begin: 0.8, end: 1.0)
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
                          itemCount: dashboardController.humanPlayers?.length,
                          itemBuilder: (context, index) {
                            return PlayersBoxesMobile(
                              onTap: () async {
                                await controller.newGame(dashboardController
                                        .humanPlayers![index]?.playerId
                                        .toString() ??
                                    '');
                              },
                              image:
                                  "$imageBaseUrl${dashboardController.humanPlayers?[index]?.profilePic}",
                              text: dashboardController
                                      .humanPlayers?[index]?.playerName
                                      .toString() ??
                                  '',
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
                          itemCount: dashboardController.robotPlayers?.length,
                          itemBuilder: (context, index) {
                            return PlayersBoxesMobile(
                              onTap: () async {
                                await controller.newGame(dashboardController
                                        .robotPlayers?[index]?.playerId
                                        .toString() ??
                                    '');
                              },
                              image:
                                  "$imageBaseUrl${dashboardController.robotPlayers?[index]?.profilePic}",
                              text: dashboardController
                                      .robotPlayers?[index]?.playerName
                                      .toString() ??
                                  '',
                            );
                          },
                        ),
                        Gap(30.h),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      desktop: Obx(
        () => dashboardController.screenLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                key: newGameKey,
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
                                  dashboardController.updateIndex(0);
                                  dashboardController
                                      .setOnBoardPlayerValue(false);
                                  dashboardController.onBoardValue(false);
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
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const SearchDialogWidgetDesktop();
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
                              itemCount:
                                  dashboardController.humanPlayers?.length,
                              itemBuilder: (context, index) {
                                return PlayersBoxesDesktop(
                                  onTap: () async {
                                    await controller.newGame(dashboardController
                                            .humanPlayers![index]?.playerId
                                            .toString() ??
                                        '');
                                  },
                                  image:
                                      "$imageBaseUrl${dashboardController.humanPlayers?[index]?.profilePic}",
                                  text: dashboardController
                                          .humanPlayers?[index]?.playerName
                                          .toString() ??
                                      '',
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
                              itemCount:
                                  dashboardController.robotPlayers?.length,
                              itemBuilder: (context, index) {
                                return PlayersBoxesDesktop(
                                  onTap: () async {
                                    await controller.newGame(dashboardController
                                            .robotPlayers?[index]?.playerId
                                            .toString() ??
                                        '');
                                  },
                                  image:
                                      "$imageBaseUrl${dashboardController.robotPlayers?[index]?.profilePic}",
                                  text: dashboardController
                                          .robotPlayers?[index]?.playerName
                                          .toString() ??
                                      '',
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
      ),
    );
  }
}
