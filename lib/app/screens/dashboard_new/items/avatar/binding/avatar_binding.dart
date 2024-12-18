import 'package:fetch_five/app/screens/dashboard_new/items/avatar/controller/avatar_controller.dart';
import 'package:get/get.dart';

class AvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AvatarController());
  }
}
