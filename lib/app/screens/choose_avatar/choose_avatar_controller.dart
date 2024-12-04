import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:get/get.dart';

class ChooseAvatarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectAvatar(int index) {
    selectedIndex.value = index;
  }

  List<String> images = [
    Assets.images.fetchfiveProfilePic008.path,
    Assets.images.fetchfiveProfilePic009.path,
    Assets.images.fetchfiveProfilePic010.path,
    Assets.images.fetchfiveProfilePic011.path,
    Assets.images.fetchfiveProfilePic012.path,
    Assets.images.fetchfiveProfilePic013.path,
    Assets.images.fetchfiveProfilePic014.path,
    Assets.images.fetchfiveProfilePic015.path,
    Assets.images.fetchfiveProfilePic016.path,
    Assets.images.fetchfiveProfilePic017.path,
    Assets.images.fetchfiveProfilePic018.path,
    Assets.images.fetchfiveProfilePic019.path,
    Assets.images.fetchfiveProfilePic020.path,
    Assets.images.fetchfiveProfilePic021.path,
    Assets.images.fetchfiveProfilePic022.path,
    Assets.images.fetchfiveProfilePic023.path,
    Assets.images.fetchfiveProfilePic024.path,
    Assets.images.fetchfiveProfilePic025.path,
    Assets.images.fetchfiveProfilePic026.path,
    Assets.images.fetchfiveProfilePic027.path,
    Assets.images.fetchfiveProfilePic028.path,
    Assets.images.fetchfiveProfilePic029.path,
    Assets.images.fetchfiveProfilePic031.path,
    Assets.images.fetchfiveProfilePic032.path,
    Assets.images.fetchfiveProfilePic033.path,
    Assets.images.fetchfiveProfilePic034.path,
    Assets.images.fetchfiveProfilePic035.path,
    Assets.images.fetchfiveProfilePic036.path,
    Assets.images.fetchfiveProfilePic037.path,
    Assets.images.fetchfiveProfilePic038.path,
    Assets.images.fetchfiveProfilePic039.path,
    Assets.images.fetchfiveProfilePic040.path,
    Assets.images.fetchfiveProfilePicCricket.path,
    Assets.images.fetchfiveProfilePicGus.path,
    Assets.images.fetchfiveProfilePicLibby.path,
    Assets.images.fetchfiveProfilePicMax.path,
    Assets.images.fetchfiveProfilePicMorgan.path,
    Assets.images.fetchfiveProfilePicRadar.path,
    Assets.images.fetchfiveProfilePicStella.path,
  ];
}
