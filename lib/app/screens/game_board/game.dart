import 'package:fetch_five/app/screens/game_board/game_controller.dart';
import 'package:fetch_five/app/screens/game_board/items/home/home.dart';
import 'package:fetch_five/app/screens/game_board/items/instructions/instructions.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/c_appbar.dart';
import 'package:fetch_five/app/widget/c_button.dart';
import 'package:fetch_five/app/widget/current_card_count.dart';
import 'package:fetch_five/app/widget/gameboard_squares.dart';
import 'package:fetch_five/app/widget/gameplay_button.dart';
import 'package:fetch_five/app/widget/last_cards_container.dart';
import 'package:fetch_five/app/widget/last_cards_played.dart';
import 'package:fetch_five/app/widget/menu_items.dart';
import 'package:fetch_five/app/widget/profile_picture.dart';
import 'package:fetch_five/app/widget/your_card_filler.dart';
import 'package:fetch_five/app/widget/your_card_playable.dart';
import 'package:fetch_five/app/widget/your_cards_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool _showLoading = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameBoardController());

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
        body: GetBuilder<GameBoardController>(
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
                                // Show the loading overlay
                                setState(() {
                                  _showLoading = true;
                                });
                                controller.refreshScreen();
                                // Wait for 1 second
                                await Future.delayed(
                                    const Duration(milliseconds: 500));

                                // Hide the loading overlay
                                setState(() {
                                  _showLoading = false;
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
                              showLoading: _showLoading),
                          IndexedStack(
                            index: controller.currentIndex,
                            children: const [
                              GameWidgets(),
                              Home(),
                              Instructions(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (_showLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 99, 81, 159),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),

      ////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ////////              Center of both the scaffolds                 /////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////
      ///////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////

      desktop: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 150.w,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.drawerOpen.value) {
                      controller.drawerOpen.value = false;
                      controller.animationController.reverse();
                    }
                  },
                  child: SizedBox(
                    child: GetBuilder<GameBoardController>(
                      builder: (controller) {
                        return Stack(
                          children: [
                            SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Gap(18),
                                    SizedBox(
                                      height: 138.h,
                                      width: 0.3.sw,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _showLoading = true;
                                              });
                                              controller.refreshScreen();
                                              await Future.delayed(
                                                const Duration(
                                                    milliseconds: 500),
                                              );
                                              setState(() {
                                                _showLoading = false;
                                              });
                                            },
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, left: 20),
                                              child: SvgPicture.asset(
                                                'assets/icons/refresh.svg',
                                                height: 28,
                                                width: 28,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.asset(
                                              'assets/images/five_tile.png',
                                              height: 66,
                                              width: 200,
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                controller.toggleDrawer();
                                              },
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, right: 20),
                                                // Add 8 pixels padding on all sides
                                                child: SvgPicture.asset(
                                                  'assets/icons/drawer.svg',
                                                  height: 28,
                                                  width: 28,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    IndexedStack(
                                      index: controller.currentIndex,
                                      children: const [
                                        GameDesktopWidgets(),
                                        Home(),
                                        Instructions(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (_showLoading)
                              Container(
                                color: Colors.black.withOpacity(0.5),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromARGB(255, 99, 81, 159),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                /// drawer
                GetBuilder(
                  init: controller,
                  builder: (controller) {
                    return AnimatedBuilder(
                      animation: controller.animationController,
                      builder: (context, child) {
                        return Positioned(
                          top: 0,
                          bottom: 0,
                          right: -250 +
                              (250 * controller.animationController.value),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 16.w,
                                top: 130.h,
                                child: Image.asset(
                                  'assets/images/polygon.png',
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    width: 250,
                                    height: 120,
                                  ),
                                  Container(
                                    width: 250,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
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
                                            svgPath:
                                                'assets/icons/document.svg',
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
                                            svgPath:
                                                'assets/icons/document.svg',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GameDesktopWidgets extends GetView<GameBoardController> {
  const GameDesktopWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 420,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ProfilePicture(
                      onTap: () {
                        controller.toggleProfileUser();
                      },
                      borderColor: blueColor,
                      imageUrl: 'assets/images/left_profile.png'),
                  const Gap(5),
                  SizedBox(
                    height: 49,
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(5),
                        const Text(
                          'SeanM',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const Gap(2),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 4.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 1
                                      ? blueColor
                                      : const Color(0xff383840),
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: const Color(0xff22222B),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(2);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              LastCardsContainer(
                radius: 12.r,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gap(1),
                    Text(
                      'Last Cards\nPlayed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.15,
                          color: Colors.white),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LastCardPlayed(text: '37', cardColor: blueColor),
                          VerticalDivider(
                              color: Color.fromARGB(255, 66, 67, 57),
                              thickness: 1,
                              width: 8,
                              indent: 4,
                              endIndent: 4),
                          LastCardPlayed(text: '40', cardColor: pinkColor)
                        ],
                      ),
                    ),
                    Gap(2)
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 49,
                    width: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Gap(5),
                        const Text(
                          'Stella',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const Gap(2),
                        Expanded(
                          child: ListView.separated(
                            reverse: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 4.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xff383840),
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: const Color(0xff22222B),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(2);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(5),
                  ProfilePicture(
                      onTap: () {
                        controller.toggleProfileUser();
                      },
                      borderColor: pinkColor,
                      imageUrl: 'assets/images/right_profile.png')
                ],
              )
            ],
          ),
        ),
        const Gap(8),
        Obx(
          () => SizedBox(
            height: 4,
            width: 450,
            child: Stack(
              children: [
                Positioned(
                  left: controller.isUserOneActive.value ? 0 : null,
                  right: controller.isUserOneActive.value ? null : 0,
                  child: Container(
                    width: 191,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: controller.isUserOneActive.value
                            ? blueColor
                            : pinkColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 450,
          child: Divider(
            color: Color(0xff333333),
          ),
        ),
        const Gap(6),
        SizedBox(
          width: 450,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              mainAxisExtent: 38,
              crossAxisCount: 10,
            ),
            itemBuilder: (context, index) {
              return Obx(
                () => GameboardSquares(
                  onTap: !controller.drawerOpen.value
                      ? () {
                          controller.toggleActiveUser(index);
                          controller.isSquareClicked[index].value = true;
                        }
                      : null,
                  text: controller.numbers[index].toString(),
                  color: controller.cardColors[index].value,
                  textColor: controller.textColors[index].value,
                  isClicked: controller.isSquareClicked[index].value,
                ),
              );
            },
          ),
        ),
        const Gap(18),
        const YourCardContainer(
          radius: 12,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    // Adjust the value as needed
                    child: Text(
                      'Your Cards',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  YourCardPlayable(text: '3', color: blueColor),
                  YourCardPlayable(text: '45', color: blueColor),
                  CardFillers(),
                  CardFillers()
                ],
              ),
              Gap(1)
            ],
          ),
        ),
        const Gap(25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameplayButton(
              width: 220,
              height: 60,
              text: 'Draw a Card',
              textColor: const Color.fromARGB(255, 246, 250, 248),
              onTap: () {},
            ),
            Gap(10.h),
            GameplayButton(
              width: 220,
              height: 60,
              text: 'Play a Square',
              color: const Color(0xff2C423A),
              textColor: const Color.fromARGB(255, 124, 148, 140),
              onTap: () {},
            ),
          ],
        ),
        Gap(18.h)
      ],
    );
  }
}

class GameWidgets extends GetView<GameBoardController> {
  const GameWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ProfilePicture(
                    onTap: () {
                      controller.toggleProfileUser();
                    },
                    borderColor: blueColor,
                    imageUrl: 'assets/images/left_profile.png',
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 49.h,
                    width: 55.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.h),
                        Text(
                          'SeanM',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CurrentCardCount(
                                color:
                                    index == 0 || index == 1 ? blueColor : null,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 2.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              LastCardsContainer(
                radius: 12.r,
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 1.h),
                    Text(
                      'Last Cards\nPlayed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LastCardPlayed(
                          text: '37',
                          cardColor: blueColor,
                        ),
                        VerticalDivider(
                          color: const Color.fromARGB(255, 66, 67, 57),
                          thickness: 1.w,
                          width: 8.w,
                          indent: 4.h,
                          endIndent: 4.h,
                        ),
                        const LastCardPlayed(
                          text: '40',
                          cardColor: pinkColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 49.h,
                    width: 55.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 5.h),
                        Text(
                          'Stella',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Expanded(
                          child: ListView.separated(
                            reverse: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const CurrentCardCount();
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 2.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  ProfilePicture(
                    onTap: () {
                      controller.toggleProfileUser();
                    },
                    borderColor: pinkColor,
                    imageUrl: 'assets/images/right_profile.png',
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(8),
        Obx(
          () => SizedBox(
            height: 4,
            width: 450,
            child: Stack(
              children: [
                Positioned(
                  left: controller.isUserOneActive.value ? 0 : null,
                  right: controller.isUserOneActive.value ? null : 0,
                  child: Container(
                    width: 191,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: controller.isUserOneActive.value
                            ? blueColor
                            : pinkColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 450,
          child: Divider(
            color: Color(0xff333333),
          ),
        ),
        const Gap(6),
        SizedBox(
          width: 450,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              mainAxisExtent: 38,
              crossAxisCount: 10,
            ),
            itemBuilder: (context, index) {
              return Obx(
                () => GameboardSquares(
                  onTap: () {
                    controller.toggleActiveUser(index);
                    controller.isSquareClicked[index].value = true;
                  },
                  text: controller.numbers[index].toString(),
                  color: controller.cardColors[index].value,
                  textColor: controller.textColors[index].value,
                  isClicked: controller.isSquareClicked[index].value,
                ),
              );
            },
          ),
        ),
        const Gap(18),
        const YourCardContainer(
          radius: 12,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    // Adjust the value as needed
                    child: Text(
                      'Your Cards',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  YourCardPlayable(text: '3', color: blueColor),
                  YourCardPlayable(text: '45', color: blueColor),
                  CardFillers(),
                  CardFillers()
                ],
              ),
              Gap(1)
            ],
          ),
        ),
        const Gap(25),
        SizedBox(
          width: 430,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameplayButton(
                text: 'Draw a Card',
                textColor: const Color.fromARGB(255, 246, 250, 248),
                onTap: () {},
              ),
              Gap(10.h),
              GameplayButton(
                text: 'Play a Square',
                color: const Color(0xff2C423A),
                textColor: const Color.fromARGB(255, 124, 148, 140),
                onTap: () {},
              ),
            ],
          ),
        ),
        Gap(18.h)
      ],
    );
  }
}
