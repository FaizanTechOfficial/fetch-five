import 'package:fetch_five/app/screens/game/game_controller.dart';
import 'package:fetch_five/app/widget/visual_indicators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstructionsDesktop extends GetView<GameController> {
  const InstructionsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 428,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xff22222B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    wordSpacing: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Color(0xff2C2C2C),
              thickness: 1.5,
            ),
            const SizedBox(height: 20),
            const Text(
              'Objective',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'The goal of the game is to capture any 5 adjoining squares in a row.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 95,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff22222b),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Vertical',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Image(
                        image: AssetImage('assets/images/vertical.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 95,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff22222b),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: const [
                      Text(
                        'Horizontal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Image(
                        image: AssetImage('assets/images/horizontal.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 170,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff22222b),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Diagonal',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 106,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:
                                  AssetImage('assets/images/diagonal_one.png'),
                              width: 61,
                            ),
                            Image(
                              image:
                                  AssetImage('assets/images/diagonal_two.png'),
                              width: 61,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Play a Square',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Each player starts with 4 cards. When you select a card, you are able to capture a square on the gameboard with a value equal to or greater than the value shown on the card.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Draw a Card',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "There are 100 cards in the deck, and each card has a unique value from 0 to 99. Each player can have no more than 4 cards in their hand at any given time, and drawing a new card consumes the player's turn.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Visual Indicators',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const VisualIndicatorsDesktop(
              imagePath: 'assets/images/occ_box.png',
              title: "Opponent's Card Count",
              description:
                  "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
            ),
            const SizedBox(height: 10),
            const VisualIndicatorsDesktop(
              imagePath: 'assets/images/occ_pink.png',
              title: "Opponent's Card Count",
              description:
                  "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
            ),
            const SizedBox(height: 10),
            const VisualIndicatorsDesktop(
              imagePath: 'assets/images/occ_blue.png',
              title: "Opponent's Card Count",
              description:
                  "The number cards your opponent is currently holding is depicted by the number card icons filled with solid colors.",
            ),
          ],
        ),
      ),
    );
  }
}
