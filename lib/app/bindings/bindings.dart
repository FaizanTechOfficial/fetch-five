import 'package:fetch_five/app/screens/game/game_controller.dart';
import 'package:fetch_five/app/screens/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
  }
}
