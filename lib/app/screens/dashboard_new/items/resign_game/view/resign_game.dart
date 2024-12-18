import 'package:fetch_five/app/screens/dashboard_new/items/resign_game/controller/resign_game_controller.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/resign_game/view/platform/resign_game_desktop_view.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/resign_game/view/platform/resign_game_mobile_view.dart';
import 'package:fetch_five/app/utilities/responsive_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResignGame extends GetView<ResignGameController> {
  const ResignGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ResignGameMobileView(resignGameController: controller),
        desktop: ResignGameDesktopView(resignGameController: controller));
  }
}
