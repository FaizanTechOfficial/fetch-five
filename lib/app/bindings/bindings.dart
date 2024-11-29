import 'package:fetch_five/app/screens/auth/create_account/create_account_controller.dart';
import 'package:fetch_five/app/screens/auth/forgot_password/forgot_controller.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar_controller.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/screens/auth/login/login_controller.dart';
import 'package:fetch_five/app/screens/new_game/new_game_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotController());
  }
}

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
  }
}

class ChooseAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseAvatarController());
  }
}

class NewGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewGameController());
  }
}
