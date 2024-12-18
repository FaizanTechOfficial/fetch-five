import 'package:fetch_five/app/screens/dashboard_new/items/game/controller/game_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/game/view/platform/game_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/game/view/platform/game_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: GameMobileView(
        controller: controller,
      ),
      desktop: GameDesktopView(
        controller: controller,
      ),
    );
  }
}
