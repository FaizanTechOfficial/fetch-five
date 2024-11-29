import 'package:get/get.dart';

class ChooseAvatarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectAvatar(int index) {
    selectedIndex.value = index;
  }

  List<String> images = [
    'assets/images/fetchfive-profile-pic-008.png',
    'assets/images/fetchfive-profile-pic-009.png',
    'assets/images/fetchfive-profile-pic-010.png',
    'assets/images/fetchfive-profile-pic-011.png',
    'assets/images/fetchfive-profile-pic-012.png',
    'assets/images/fetchfive-profile-pic-013.png',
    'assets/images/fetchfive-profile-pic-014.png',
    'assets/images/fetchfive-profile-pic-015.png',
    'assets/images/fetchfive-profile-pic-016.png',
    'assets/images/fetchfive-profile-pic-017.png',
    'assets/images/fetchfive-profile-pic-018.png',
    'assets/images/fetchfive-profile-pic-019.png',
    'assets/images/fetchfive-profile-pic-020.png',
    'assets/images/fetchfive-profile-pic-021.png',
    'assets/images/fetchfive-profile-pic-022.png',
    'assets/images/fetchfive-profile-pic-023.png',
    'assets/images/fetchfive-profile-pic-024.png',
    'assets/images/fetchfive-profile-pic-025.png',
    'assets/images/fetchfive-profile-pic-026.png',
    'assets/images/fetchfive-profile-pic-027.png',
    'assets/images/fetchfive-profile-pic-028.png',
    'assets/images/fetchfive-profile-pic-029.png',
    'assets/images/fetchfive-profile-pic-031.png',
    'assets/images/fetchfive-profile-pic-032.png',
    'assets/images/fetchfive-profile-pic-033.png',
    'assets/images/fetchfive-profile-pic-034.png',
    'assets/images/fetchfive-profile-pic-035.png',
    'assets/images/fetchfive-profile-pic-036.png',
    'assets/images/fetchfive-profile-pic-037.png',
    'assets/images/fetchfive-profile-pic-038.png',
    'assets/images/fetchfive-profile-pic-039.png',
    'assets/images/fetchfive-profile-pic-040.png',
    'assets/images/fetchfive-profile-pic-cricket.png',
    'assets/images/fetchfive-profile-pic-gus.png',
    'assets/images/fetchfive-profile-pic-libby.png',
    'assets/images/fetchfive-profile-pic-max.png',
    'assets/images/fetchfive-profile-pic-morgan.png',
    'assets/images/fetchfive-profile-pic-radar.png',
    'assets/images/fetchfive-profile-pic-stella.png',
  ];
}
