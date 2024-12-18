import 'package:fetch_five/app/screens/dashboard_new/items/instructions/controller/instructions_controller.dart';
import 'package:get/get.dart';

class InstructionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InstructionsController());
  }
}
