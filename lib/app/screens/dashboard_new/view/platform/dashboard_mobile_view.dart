import 'dart:developer';

import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/screens/dashboard_new/controller/dashboard_new_controller.dart';
import 'package:fetch_five/app/widget/c_appbar.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DashboardMobileView extends StatelessWidget {
  const DashboardMobileView({super.key, required this.dashboardNewController});
  final DashboardNewController dashboardNewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: dashboardNewController.key,
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
                                dashboardNewController.updateIndex(0);
                                Get.back();
                                // dashboardNewController.onBoardValue(false);
                                // dashboardNewController.setOnBoardPlayerValue(false);
                              },
                              svgPath: Assets.icons.home.path,
                              title: 'Home'),
                          Gap(20.h),
                          MenuItem(
                              onTap: () {
                                log('.................');
                                dashboardNewController.updateIndex(1);
                                Get.back();
                                // dashboardNewController.onBoardValue(false);
                                // dashboardNewController.setOnBoardPlayerValue(false);
                              },
                              svgPath: Assets.icons.document.path,
                              title: 'Instructions'),
                          Gap(20.h),
                          // Obx(
                          //   () => dashboardNewController.isOnGameBoard.value
                          //       ? MenuItem(
                          //           onTap: () {},
                          //           svgPath: Assets.icons.resign.path,
                          //           title: 'Resign Game',
                          //         )
                          //       : const SizedBox.shrink(),
                          // ),
                          Gap(320.h),
                          // Obx(
                          //   () => CustomButton(
                          //     onTap: dashboardNewController.logout,
                          //     color: const Color(0xffFF2124),
                          //     child: dashboardNewController.isLoading.value
                          //         ? const CircularProgressIndicator()
                          //         : Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               SvgPicture.asset(
                          //                 Assets.icons.logout.path,
                          //                 height: 24.h,
                          //                 width: 24.w,
                          //               ),
                          //               Gap(10.w),
                          //               const Text(
                          //                 'Logout',
                          //                 style: TextStyle(
                          //                     fontSize: 16,
                          //                     color: Colors.white),
                          //               ),
                          //             ],
                          //           ),
                          //   ),
                          // ),
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
        body: GetBuilder<DashboardNewController>(
          builder: (dashboardNewController) {
            // log('value of current Index ${dashboardNewController.currentIndex.value}');
            // log('value of OnBOard status ${dashboardNewController.isOnGameBoard.value}');
            // log('value of OnGamePlayer status ${dashboardNewController.isOnGamePlayer.value}');

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
                            onRefresh: () {},
                            // onRefresh: () {
                            //   if (dashboardNewController.currentIndex.value == 0 &&
                            //       dashboardNewController.isOnGameBoard.value == false &&
                            //       dashboardNewController.isOnGamePlayer.value == false) {
                            //     dashboardNewController.playerInfo();
                            //     return;
                            //   }
                            //   if (dashboardNewController.currentIndex.value == 0 &&
                            //       dashboardNewController.isOnGameBoard.value == true &&
                            //       dashboardNewController.isOnGamePlayer.value == false) {
                            //     if (dashboardNewController.selectedGameId.isNotEmpty) {
                            //       switch (dashboardNewController.selectedTurnType) {
                            //         case 'your':
                            //           {
                            //             dashboardNewController.getYourTurnGameDetails(
                            //                 dashboardNewController.selectedGameId);
                            //           }
                            //         case 'their':
                            //           {
                            //             dashboardNewController.getTheirTurnGameDetails(
                            //                 dashboardNewController.selectedGameId);
                            //           }
                            //         case 'completed':
                            //           {
                            //             dashboardNewController.getCompletedGameDetails(
                            //                 dashboardNewController.selectedGameId);
                            //           }
                            //       }
                            //     }
                            //     return;
                            //   }
                            // },
                            onToggleDrawer: () {
                              // if (dashboardNewController
                              //         .key.currentState?.isEndDrawerOpen ??
                              //     false) {
                              //   dashboardNewController.key.currentState!
                              //       .closeEndDrawer();
                              // } else {
                              //   dashboardNewController.key.currentState!
                              //       .openEndDrawer();
                              // }
                            },
                            showLoading: false,
                            // dashboardNewController.isLoading.value,
                          ),
                          // if (dashboardNewController.currentIndex.value ==
                          //         0 &&
                          //     !dashboardNewController.isOnGamePlayer.value &&
                          //     dashboardNewController.isOnGameBoard.value)
                          //   const GameBoardMobileView(),
                          // if (!dashboardNewController.isOnGameBoard.value &&
                          //     !dashboardNewController.isOnGamePlayer.value &&
                          //     dashboardNewController.currentIndex.value == 0)
                          //   const HomeMobile(),
                          // if (!dashboardNewController.isOnGameBoard.value &&
                          //     dashboardNewController.currentIndex.value == 1)
                          //   const InstructionsMobile(),
                          // if (!dashboardNewController.isOnGameBoard.value &&
                          //     dashboardNewController.currentIndex.value == 2)
                          //   const ChooseAvatarMobile(),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
                // Obx(
                //   () {
                //     if (dashboardNewController.isLoading.value) {
                //       return Container(
                //         color: Colors.black.withOpacity(0.5),
                //         child: const Center(
                //           child: CircularProgressIndicator(
                //             valueColor: AlwaysStoppedAnimation<Color>(
                //               Color.fromARGB(255, 99, 81, 159),
                //             ),
                //           ),
                //         ),
                //       );
                //     } else {
                //       return const SizedBox.shrink();
                //     }
                //   },
                // ),
              ],
            );
          },
        ),
        bottomSheet: GetBuilder<DashboardNewController>(
          builder: (dashboardNewController) {
            return dashboardNewController.currentIndex.value == 2
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
    );
  }
}
