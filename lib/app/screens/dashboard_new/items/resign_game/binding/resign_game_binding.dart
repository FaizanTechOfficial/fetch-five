import 'package:fetch_five/app/screens/dashboard_new/items/resign_game/controller/resign_game_controller.dart';
import 'package:get/get.dart';

class ResignGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ResignGameController());
  }
}
