import 'package:fetch_five/app/screens/dashboard_new/controller/dashboard_new_controller.dart';
import 'package:get/get.dart';

class DashboardNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardNewController());
  }
}
