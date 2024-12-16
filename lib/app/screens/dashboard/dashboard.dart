import 'dart:developer';

import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_desktop.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_mobile.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/screens/dashboard/items/game_board/desktop_board.dart';
import 'package:fetch_five/app/screens/dashboard/items/game_board/mobile_board.dart';
import 'package:fetch_five/app/screens/dashboard/items/home_board/home_desktop.dart';
import 'package:fetch_five/app/screens/dashboard/items/home_board/home_mobile.dart';
import 'package:fetch_five/app/screens/dashboard/items/instructions_board/instructions_desktop.dart';
import 'package:fetch_five/app/screens/dashboard/items/instructions_board/instructions_mobile.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/widget/c_appbar.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Responsive(
      mobile: Scaffold(
        key: controller.key,
        endDrawer: Drawer(
          width: 266.w,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                right: 42.w,
                top: 120.h,
                child: Image.asset(
                  Assets.images.polygon.path,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 140.h,
                      color: Colors.transparent,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 805.h,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      decoration: BoxDecoration(
                        color: const Color(0xff181818),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Gap(48.h),
                          MenuItem(
                              onTap: () {
                                controller.updateIndex(0);
                                Get.back();
                                controller.onBoardValue(false);
                                controller.setOnBoardPlayerValue(false);
                              },
                              svgPath: Assets.icons.home.path,
                              title: 'Home'),
                          Gap(20.h),
                          MenuItem(
                              onTap: () {
                                log('.................');
                                controller.updateIndex(1);
                                Get.back();
                                controller.onBoardValue(false);
                                controller.setOnBoardPlayerValue(false);
                              },
                              svgPath: Assets.icons.document.path,
                              title: 'Instructions'),
                          Gap(20.h),
                          Obx(
                            () => controller.isOnGameBoard.value
                                ? MenuItem(
                                    onTap: () {},
                                    svgPath: Assets.icons.resign.path,
                                    title: 'Resign Game',
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Gap(320.h),
                          Obx(
                            () => CustomButton(
                              onTap: controller.logout,
                              color: const Color(0xffFF2124),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.logout.path,
                                          height: 24.h,
                                          width: 24.w,
                                        ),
                                        Gap(10.w),
                                        const Text(
                                          'Logout',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff0A0A14),
        body: GetBuilder<DashboardController>(
          builder: (controller) {
            log('value of current Index ${controller.currentIndex.value}');
            log('value of OnBOard status ${controller.isOnGameBoard.value}');
            log('value of OnGamePlayer status ${controller.isOnGamePlayer.value}');

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(18),
                          CAppbar(
                            onRefresh: () {
                              if (controller.currentIndex.value == 0 &&
                                  controller.isOnGameBoard.value == false &&
                                  controller.isOnGamePlayer.value == false) {
                                controller.playerInfo();
                                return;
                              }
                              if (controller.currentIndex.value == 0 &&
                                  controller.isOnGameBoard.value == true &&
                                  controller.isOnGamePlayer.value == false) {
                                if (controller.selectedGameId.isNotEmpty) {
                                  switch (controller.selectedTurnType) {
                                    case 'your':
                                      {
                                        controller.getYourTurnGameDetails(
                                            controller.selectedGameId);
                                      }
                                    case 'their':
                                      {
                                        controller.getTheirTurnGameDetails(
                                            controller.selectedGameId);
                                      }
                                    case 'completed':
                                      {
                                        controller.getCompletedGameDetails(
                                            controller.selectedGameId);
                                      }
                                  }
                                }
                                return;
                              }
                            },
                            onToggleDrawer: () {
                              if (controller
                                      .key.currentState?.isEndDrawerOpen ??
                                  false) {
                                controller.key.currentState!.closeEndDrawer();
                              } else {
                                controller.key.currentState!.openEndDrawer();
                              }
                            },
                            showLoading: controller.isLoading.value,
                          ),
                          if (controller.currentIndex.value == 0 &&
                              !controller.isOnGamePlayer.value &&
                              controller.isOnGameBoard.value)
                            const GameBoardMobileView(),
                          if (!controller.isOnGameBoard.value &&
                              !controller.isOnGamePlayer.value &&
                              controller.currentIndex.value == 0)
                            const HomeMobile(),
                          if (!controller.isOnGameBoard.value &&
                              controller.currentIndex.value == 1)
                            const InstructionsMobile(),
                          if (!controller.isOnGameBoard.value &&
                              controller.currentIndex.value == 2)
                            const ChooseAvatarMobile(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () {
                    if (controller.isLoading.value) {
                      return Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 99, 81, 159),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            );
          },
        ),
        bottomSheet: GetBuilder<DashboardController>(
          builder: (controller) {
            return controller.currentIndex.value == 2
                ? Container(
                    height: 134.h,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 20.h, bottom: 50.h),
                    decoration: const BoxDecoration(
                      color: Color(0xff0A0A14),
                    ),
                    child: CustomButton(
                      child: Text(
                        'Select',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                      onTap: () {},
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
      desktop: Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 19, 24),
        body: Center(
          child: SizedBox(
            width: 428,
            child: GetBuilder<DashboardController>(
              builder: (controller) {
                log('value of current Index ${controller.currentIndex.value}');
                log('value of OnBOard status ${controller.isOnGameBoard.value}');
                log('value of OnGamePlayer status ${controller.isOnGamePlayer.value}');
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isDrawerVisible.value == true) {
                          controller.closeDrawer();
                        }
                      },
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 18),
                              CAppbarDesktop(
                                onRefresh: () {
                                  if (controller.currentIndex.value == 0 &&
                                      controller.isOnGameBoard.value == false &&
                                      controller.isOnGamePlayer.value ==
                                          false) {
                                    controller.playerInfo();
                                    return;
                                  }
                                  if (controller.currentIndex.value == 0 &&
                                      controller.isOnGameBoard.value == true &&
                                      controller.isOnGamePlayer.value ==
                                          false) {
                                    if (controller.selectedGameId.isNotEmpty) {
                                      switch (controller.selectedTurnType) {
                                        case 'your':
                                          {
                                            controller.getYourTurnGameDetails(
                                                controller.selectedGameId);
                                          }
                                        case 'their':
                                          {
                                            controller.getTheirTurnGameDetails(
                                                controller.selectedGameId);
                                          }
                                        case 'completed':
                                          {
                                            controller.getCompletedGameDetails(
                                                controller.selectedGameId);
                                          }
                                      }
                                    }
                                    return;
                                  }
                                },
                                onToggleDrawer: () {
                                  if (controller
                                          .key.currentState?.isEndDrawerOpen ??
                                      false) {
                                    controller.key.currentState!
                                        .closeEndDrawer();
                                  } else {
                                    controller.key.currentState!
                                        .openEndDrawer();
                                  }
                                },
                                showLoading: controller.isLoading.value,
                              ),
                              if (controller.currentIndex.value == 0 &&
                                  !controller.isOnGamePlayer.value &&
                                  controller.isOnGameBoard.value)
                                const GameBoardDesktopView(),
                              if (!controller.isOnGameBoard.value &&
                                  !controller.isOnGamePlayer.value &&
                                  controller.currentIndex.value == 0)
                                const HomeDesktop(),
                              if (!controller.isOnGameBoard.value &&
                                  controller.currentIndex.value == 1)
                                const InstructionsDesktop(),
                              if (!controller.isOnGameBoard.value &&
                                  controller.currentIndex.value == 2)
                                const ChooseAvatarDesktop(),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.isDrawerVisible.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.closeDrawer();
                          },
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        if (controller.isDrawerVisible.value) {
                          return Stack(children: [
                            Positioned(
                              right: 45,
                              top: 112,
                              child: Image.asset(
                                Assets.images.polygon.path,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 134,
                              child: Container(
                                width: 265,
                                height:
                                    MediaQuery.of(context).size.height - 140,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                decoration: const BoxDecoration(
                                  color: Color(0xff181818),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 48),
                                    MenuItemDesktop(
                                      onTap: () {
                                        controller.updateIndex(0);
                                        Get.back();
                                        controller.onBoardValue(false);
                                        controller.setOnBoardPlayerValue(false);
                                      },
                                      svgPath: Assets.icons.home.path,
                                      title: 'Home',
                                    ),
                                    const SizedBox(height: 20),
                                    MenuItemDesktop(
                                      onTap: () {
                                        log('.................');
                                        controller.updateIndex(1);
                                        Get.back();
                                        controller.onBoardValue(false);
                                        controller.setOnBoardPlayerValue(false);
                                        controller.closeDrawer();
                                      },
                                      svgPath: Assets.icons.document.path,
                                      title: 'Instructions',
                                    ),
                                    const SizedBox(height: 20),
                                    Obx(
                                      () => controller.isOnGameBoard.value
                                          ? MenuItemDesktop(
                                              onTap: () {},
                                              svgPath: Assets.icons.resign.path,
                                              title: 'Resign Game',
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                    const Spacer(),
                                    Obx(
                                      () => CustomButtonDesktop(
                                        onTap: controller.logout,
                                        color: const Color(0xffFF2124),
                                        child: controller.isLoading.value
                                            ? const CircularProgressIndicator()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.icons.logout.path,
                                                    height: 24,
                                                    width: 24,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  const Text(
                                                    'Logout',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ]);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return Container(
                            color: Colors.black.withOpacity(0.5),
                            child: const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromARGB(255, 99, 81, 159),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        bottomSheet: GetBuilder<DashboardController>(
          builder: (controller) {
            return controller.currentIndex.value == 2
                ? Container(
                    width: 428,
                    height: 134,
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 20, bottom: 50),
                    decoration: const BoxDecoration(
                      color: Color(0xff0A0A14),
                    ),
                    child: CustomButtonDesktop(
                      child: const Text(
                        'Select',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onTap: () {},
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
