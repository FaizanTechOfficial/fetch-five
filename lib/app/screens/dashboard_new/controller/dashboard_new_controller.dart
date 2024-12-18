import 'package:get/get.dart';

class DashboardNewController extends GetxController {
  RxInt currentIndex = 0.obs;

  void updateIndex(int newIndex) {
    currentIndex.value = newIndex;
    update();
  }
}
