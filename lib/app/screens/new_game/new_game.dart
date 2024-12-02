import 'package:fetch_five/app/screens/new_game/components/players_boxes.dart';
import 'package:fetch_five/app/screens/new_game/components/search_dialog_widget.dart';
import 'package:fetch_five/app/screens/new_game/components/search_field.dart';
import 'package:fetch_five/app/screens/new_game/new_game_controller.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewGameController());
    return Responsive(
      mobile: Scaffold(
        backgroundColor: const Color(0xff0A0A14),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/images/five_tile.png',
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
                      barrierLabel: 'Hello',
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 300),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SearchDialogWidgetMobile();
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
                  child: SearchFieldMobile(
                    enabled: false,
                    controller: TextEditingController(),
                    hintText: 'Search',
                    searchIcon: 'assets/icons/Search.svg',
                    filterIcon: 'assets/icons/Filter.svg',
                    onFilterTap: () {},
                  ),
                ),
                Gap(30.h),
                Text(
                  'Human Players',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Gap(20.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88.h,
                    mainAxisSpacing: 18.w,
                    crossAxisSpacing: 10.h,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.humanPlayers1.length,
                  itemBuilder: (context, index) {
                    return PlayersBoxesMobile(
                      image: controller.humanPlayers1[index].image,
                      text: controller.humanPlayers1[index].name,
                    );
                  },
                ),
                Gap(30.h),
                Text(
                  'Human Players',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Gap(20.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 88.h,
                    mainAxisSpacing: 18.w,
                    crossAxisSpacing: 10.h,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.humanPlayers2.length,
                  itemBuilder: (context, index) {
                    return PlayersBoxesMobile(
                      image: controller.humanPlayers2[index].image,
                      text: controller.humanPlayers2[index].name,
                    );
                  },
                ),
                Gap(30.h),
              ],
            ),
          ),
        ),
      ),
      desktop: Scaffold(
        backgroundColor: const Color(0xff0A0A14),
        body: Center(
          child: SizedBox(
            width: 428,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.white,
                        ),
                      ),
                      centerTitle: true,
                      title: Image.asset(
                        'assets/images/five_tile.png',
                        height: 50,
                      ),
                    ),
                    Gap(50),
                    Align(
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
                    Gap(20),
                    GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierLabel: 'Hello',
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return SearchDialogWidgetDesktop();
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
                        searchIcon: 'assets/icons/Search.svg',
                        filterIcon: 'assets/icons/Filter.svg',
                        onFilterTap: () {},
                      ),
                    ),
                    Gap(30),
                    Text(
                      'Human Players',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 88,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.humanPlayers1.length,
                      itemBuilder: (context, index) {
                        return PlayersBoxesDesktop(
                          image: controller.humanPlayers1[index].image,
                          text: controller.humanPlayers1[index].name,
                        );
                      },
                    ),
                    Gap(30),
                    Text(
                      'Human Players',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Gap(20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 88,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.humanPlayers2.length,
                      itemBuilder: (context, index) {
                        return PlayersBoxesDesktop(
                          image: controller.humanPlayers2[index].image,
                          text: controller.humanPlayers2[index].name,
                        );
                      },
                    ),
                    Gap(30),
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
