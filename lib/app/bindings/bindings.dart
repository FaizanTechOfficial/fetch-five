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
    Get.put(LoginController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotController());
  }
}

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateAccountController());
  }
}

class NewGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewGameController());
  }
}

class ChooseAvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChooseAvatarController());
  }
}
