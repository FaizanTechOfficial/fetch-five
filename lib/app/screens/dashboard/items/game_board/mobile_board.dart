import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/screens/dashboard/items/game_board/components/square_colors.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/widget/current_card_count.dart';
import 'package:fetch_five/app/widget/gameboard_squares.dart';
import 'package:fetch_five/app/widget/gameplay_button.dart';
import 'package:fetch_five/app/widget/last_cards_container.dart';
import 'package:fetch_five/app/widget/last_cards_played.dart';
import 'package:fetch_five/app/widget/profile_picture.dart';
import 'package:fetch_five/app/widget/your_card_filler.dart';
import 'package:fetch_five/app/widget/your_card_playable.dart';
import 'package:fetch_five/app/widget/your_cards_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GameBoardMobileView extends StatelessWidget {
  const GameBoardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    return Obx(
      () => controller.screenLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ProfilePicture(
                            borderColor: blueColor,
                            backgroundImage: NetworkImage(
                                "$imageBaseUrl${controller.gameDetails.value.playerOneProfilePic}"),
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
                                  controller.gameDetails.value.playerOneName
                                      .toString(),
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
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
                                      bool isBlue = index <
                                          controller.gameDetails.value
                                              .playerOneCardCount!;
                                      return CurrentCardCount(
                                        color: isBlue ? blueColor : null,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 1.h),
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
                                LastCardPlayed(
                                  text: controller
                                          .gameDetails.value.playerOneLastCard
                                          ?.toString() ??
                                      '',
                                  cardColor: controller.gameDetails.value
                                              .playerOneLastCard ==
                                          null
                                      ? Colors.transparent
                                      : blueColor, //blueColor,
                                ),
                                VerticalDivider(
                                  color: const Color.fromARGB(255, 66, 67, 57),
                                  thickness: 1.w,
                                  width: 8.w,
                                  indent: 4.h,
                                  endIndent: 4.h,
                                ),
                                LastCardPlayed(
                                  text: controller
                                          .gameDetails.value.playerTwoLastCard
                                          ?.toString() ??
                                      '',
                                  cardColor: controller.gameDetails.value
                                              .playerTwoLastCard ==
                                          null
                                      ? Colors.transparent
                                      : pinkColor,
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
                                  controller.gameDetails.value.playerTwoName
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
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
                                      bool isPink = index <
                                          controller.gameDetails.value
                                              .playerTwoCardCount!;
                                      return CurrentCardCount(
                                        color: isPink ? pinkColor : null,
                                      );
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
                            borderColor: pinkColor,
                            backgroundImage: NetworkImage(
                                "$imageBaseUrl${controller.gameDetails.value.playerTwoProfilePic}"),
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
                              color: controller
                                          .gameDetails.value.thisPlayersTurn ==
                                      true
                                  ? (controller.gameDetails.value.thisPlayer ==
                                          "player_one"
                                      ? blueColor
                                      : pinkColor)
                                  : pinkColor,
                            ),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  padding: EdgeInsets.only(top: 2.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    mainAxisExtent: 38,
                    crossAxisCount: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GameboardSquaresMobile(
                        onTap: () {
                          // controller.toggleActiveUser(index);
                          // controller.isSquareClicked[index].value = true;
                        },
                        text: controller.numbers[index].toString(),
                        color: getSquareColor(
                          thisPlayer:
                              controller.gameDetails.value.thisPlayer ?? '',
                          thisPlayersTurn:
                              controller.gameDetails.value.thisPlayersTurn ??
                                  true,
                          playerOneSquares:
                              controller.gameDetails.value.playerOneSquares!,
                          playerTwoSquares:
                              controller.gameDetails.value.playerTwoSquares!,
                          number: controller.numbers[index],
                        ),
                        textColor: controller
                                    .gameDetails.value.playerOneSquares!
                                    .contains(controller.numbers[index]) ||
                                controller.gameDetails.value.playerTwoSquares!
                                    .contains(controller.numbers[index])
                            ? Colors.transparent
                            : controller.textColors[index].value,
                        isClicked: controller.isSquareClicked[index].value,
                      ),
                    );
                  },
                ),
                const Gap(18),
                YourCardContainer(
                  radius: 12,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Gap(1),
                      const Text(
                        'Your Cards',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final sortedPlayerHand = [
                            ...controller.gameDetails.value.playerHand!
                          ]..sort();

                          bool isPlayable = index < sortedPlayerHand.length;

                          if (isPlayable) {
                            return YourCardPlayable(
                              text: sortedPlayerHand[index].toString(),
                              color: blueColor,
                            );
                          } else {
                            return const CardFillers();
                          }
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
                      const Gap(1)
                    ],
                  ),
                ),
                const Gap(25),
                Row(
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
              ],
            ),
    );
  }
}
