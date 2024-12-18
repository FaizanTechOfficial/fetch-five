import 'package:fetch_five/app/screens/dashboard_new/items/game/controller/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GameController());
  }
}
