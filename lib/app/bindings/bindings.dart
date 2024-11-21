import 'package:fetch_five/app/screens/game_board/game_controller.dart';
import 'package:fetch_five/app/screens/game_board/items/home/home_controller.dart';
import 'package:fetch_five/app/screens/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class GameBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameBoardController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class InstructionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
