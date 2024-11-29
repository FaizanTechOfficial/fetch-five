import 'package:fetch_five/app/screens/dashboard/items/game_board/desktop_board.dart';
import 'package:fetch_five/app/screens/dashboard/items/game_board/mobile_board.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: GameBoardMobileView(), desktop: GameBoardDesktopView());
  }
}
