import 'package:fetch_five/app/screens/game/game_controller.dart';
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
import 'package:get/get.dart';

class GameDesktopWidgets extends GetView<GameController> {
  const GameDesktopWidgets({super.key});

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
                    imageUrl: 'assets/images/left_profile.png',
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 49,
                    width: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'SeanM',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CurrentCardCountDesktop(
                                color:
                                    index == 0 || index == 1 ? blueColor : null,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              LastCardsContainer(
                radius: 12,
                padding: const EdgeInsets.symmetric(
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
                        const LastCardPlayed(
                          text: '37',
                          cardColor: blueColor,
                        ),
                        VerticalDivider(
                          color: const Color.fromARGB(255, 66, 67, 57),
                          thickness: 1,
                          width: 8,
                          indent: 4,
                          endIndent: 4,
                        ),
                        const LastCardPlayed(
                          text: '40',
                          cardColor: pinkColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              SizedBox(
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
                        SizedBox(height: 5),
                        Text(
                          'Stella',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: ListView.separated(
                            reverse: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const CurrentCardCountDesktop();
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
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
                      color: controller.isUserOneActive.value
                          ? blueColor
                          : pinkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
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
                color: controller.cardColors[index].value,
                textColor: controller.textColors[index].value,
                isClicked: controller.isSquareClicked[index].value,
              ),
            );
          },
        ),
        const SizedBox(height: 18),
        const YourCardContainer(
          radius: 12,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
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
              SizedBox(height: 4)
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
