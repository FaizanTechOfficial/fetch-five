import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
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
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GameBoardDesktopView extends GetView<DashboardController> {
  const GameBoardDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ProfilePicture(
                    onTap: () {
                      controller.toggleProfileUser();
                    },
                    borderColor: blueColor,
                    backgroundImage: NetworkImage(
                        "$imageBaseUrl${controller.gameDetails.value.playerOneProfilePic}"),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 49,
                    width: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          controller.gameDetails.value.playerOneName.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool isBlue = index <
                                  controller
                                      .gameDetails.value.playerOneCardCount!;
                              return CurrentCardCountDesktop(
                                color: isBlue ? blueColor : null,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              LastCardsContainer(
                radius: 12,
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      'Last Cards\nPlayed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LastCardPlayed(
                          text: controller.gameDetails.value.playerOneLastCard
                                  ?.toString() ??
                              '0',
                          cardColor: blueColor,
                        ),
                        VerticalDivider(
                          color: Color.fromARGB(255, 66, 67, 57),
                          thickness: 1,
                          width: 8,
                          indent: 4,
                          endIndent: 4,
                        ),
                        LastCardPlayed(
                          text: controller.gameDetails.value.playerTwoLastCard
                                  ?.toString() ??
                              '0',
                          cardColor: pinkColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 49,
                    width: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          controller.gameDetails.value.playerTwoName.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: ListView.separated(
                            reverse: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              bool isBlue = index <
                                  controller
                                      .gameDetails.value.playerTwoCardCount!;
                              return CurrentCardCountDesktop(
                                color: isBlue ? blueColor : null,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ProfilePicture(
                    onTap: () {
                      controller.toggleProfileUser();
                    },
                    borderColor: pinkColor,
                    backgroundImage: NetworkImage(
                        "$imageBaseUrl${controller.gameDetails.value.playerTwoProfilePic}"),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
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
                      color:
                          controller.gameDetails.value.thisPlayersTurn == true
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
        const Divider(
          color: Color(0xff333333),
        ),
        const SizedBox(height: 6),
        GridView.builder(
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
              () => GameboardSquaresDesktop(
                onTap: () {
                  controller.toggleActiveUser(index);
                  controller.isSquareClicked[index].value = true;
                },
                text: controller.numbers[index].toString(),
                color: controller.gameDetails.value.thisPlayer == 'player_one'
                    ? controller.gameDetails.value.thisPlayersTurn == true
                        ? controller.gameDetails.value.playerOneSquares!
                                .contains(controller.numbers[index])
                            ? blueColor
                            : controller.gameDetails.value.playerTwoSquares!
                                    .contains(controller.numbers[index])
                                ? pinkColor
                                : const Color(0xff22222B)
                        : controller.gameDetails.value.playerOneSquares!
                                .contains(controller.numbers[index])
                            ? blueColor
                            : controller.gameDetails.value.playerTwoSquares!
                                    .contains(controller.numbers[index])
                                ? pinkColor
                                : const Color(0xff22222B)
                    : controller.gameDetails.value.thisPlayersTurn == true
                        ? controller.gameDetails.value.playerOneSquares!
                                .contains(controller.numbers[index])
                            ? blueColor
                            : controller.gameDetails.value.playerTwoSquares!
                                    .contains(controller.numbers[index])
                                ? pinkColor
                                : const Color(0xff22222B)
                        : controller.gameDetails.value.playerTwoSquares!
                                .contains(controller.numbers[index])
                            ? blueColor
                            : controller.gameDetails.value.playerOneSquares!
                                    .contains(controller.numbers[index])
                                ? pinkColor
                                : const Color(0xff22222B),
                textColor: controller.gameDetails.value.playerOneSquares!
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
        const SizedBox(height: 18),
        YourCardContainer(
          radius: 12,
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(1),
              Text(
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
                  bool isPlayable =
                      index < controller.gameDetails.value.playerHand!.length;

                  if (isPlayable) {
                    return YourCardPlayable(
                      text: controller.gameDetails.value.playerHand![index]
                          .toString(),
                      color: blueColor,
                    );
                  } else {
                    return CardFillers();
                  }
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
              ),
              Gap(1)
            ],
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameplayButtonDesktop(
              text: 'Draw a Card',
              textColor: const Color.fromARGB(255, 246, 250, 248),
              onTap: () {},
            ),
            const SizedBox(width: 10),
            GameplayButtonDesktop(
              text: 'Play a Square',
              color: const Color(0xff2C423A),
              textColor: const Color.fromARGB(255, 124, 148, 140),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
