import 'package:fetch_five/app/screens/game/game_controller.dart';
import 'package:fetch_five/app/screens/game/index_widgets/game_board/desktop_board.dart';
import 'package:fetch_five/app/screens/game/index_widgets/game_board/mobile_board.dart';
import 'package:fetch_five/app/screens/game/index_widgets/home_board/home_desktop.dart';
import 'package:fetch_five/app/screens/game/index_widgets/home_board/home_mobile.dart';
import 'package:fetch_five/app/screens/game/index_widgets/instructions_board/instructions_desktop.dart';
import 'package:fetch_five/app/screens/game/index_widgets/instructions_board/instructions_mobile.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/widget/c_appbar.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameController());

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
                  'assets/images/polygon.png',
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
                              },
                              svgPath: 'assets/icons/document.svg',
                              title: 'Game Board'),
                          Gap(20.h),
                          MenuItem(
                              onTap: () {
                                controller.updateIndex(1);
                                Get.back();
                              },
                              svgPath: 'assets/icons/home.svg',
                              title: 'Home'),
                          Gap(20.h),
                          MenuItem(
                              onTap: () {
                                controller.updateIndex(2);
                                Get.back();
                              },
                              svgPath: 'assets/icons/document.svg',
                              title: 'Instructions'),
                          Gap(20.h),
                          MenuItem(
                              onTap: () {
                                // controller.updateIndex(3);
                              },
                              svgPath: 'assets/icons/resign.svg',
                              title: 'Resign Game'),
                          Gap(320.h),
                          CustomButton(
                            onTap: () {},
                            color: const Color(0xffFF2124),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/logout.svg',
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                Gap(10.w),
                                const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 19, 24),
        body: GetBuilder<GameController>(
          builder: (controller) {
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
                            onRefresh: () async {
                              controller.startLoading();
                              controller.refreshScreen();
                              await Future.delayed(
                                  const Duration(milliseconds: 500), () {
                                controller.stopLoading();
                              });
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
                          if (controller.currentIndex == 0) GameMobileWidgets(),
                          if (controller.currentIndex == 1) HomeMobile(),
                          if (controller.currentIndex == 2)
                            InstructionsMobile(),
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
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
      desktop: Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 19, 24),
        body: Center(
          child: SizedBox(
            width: 428,
            child: GetBuilder<GameController>(
              builder: (controller) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 18),
                            CAppbarDesktop(
                              onRefresh: () async {
                                controller.startLoading();
                                controller.refreshScreen();
                                await Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  controller.stopLoading();
                                });
                              },
                              onToggleDrawer: () {
                                controller.openDrawer();
                              },
                              showLoading: controller.isLoading.value,
                            ),
                            if (controller.currentIndex == 0)
                              GameDesktopWidgets(),
                            if (controller.currentIndex == 1) HomeDesktop(),
                            if (controller.currentIndex == 2)
                              InstructionsDesktop(),
                            const SizedBox(height: 40),
                          ],
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
                                'assets/images/polygon.png',
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
                                decoration: BoxDecoration(
                                  color: const Color(0xff181818),
                                  borderRadius: const BorderRadius.only(
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
                                        controller.closeDrawer();
                                      },
                                      svgPath: 'assets/icons/document.svg',
                                      title: 'Game Board',
                                    ),
                                    const SizedBox(height: 20),
                                    MenuItemDesktop(
                                      onTap: () {
                                        controller.updateIndex(1);

                                        controller.closeDrawer();
                                      },
                                      svgPath: 'assets/icons/home.svg',
                                      title: 'Home',
                                    ),
                                    const SizedBox(height: 20),
                                    MenuItemDesktop(
                                      onTap: () {
                                        controller.updateIndex(2);

                                        controller.closeDrawer();
                                      },
                                      svgPath: 'assets/icons/document.svg',
                                      title: 'Instructions',
                                    ),
                                    const SizedBox(height: 20),
                                    MenuItemDesktop(
                                      onTap: () {
                                        // controller.updateIndex(3);
                                      },
                                      svgPath: 'assets/icons/resign.svg',
                                      title: 'Resign Game',
                                    ),
                                    Spacer(),
                                    CustomButtonDesktop(
                                      onTap: () {},
                                      color: const Color(0xffFF2124),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/logout.svg',
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
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ]);
                        } else {
                          return SizedBox.shrink();
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
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
