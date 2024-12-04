import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/models/players_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGameController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  RxList<PlayersModel> filteredData = RxList<PlayersModel>();
  RxBool isNoResultsFound = false.obs;

  List<PlayersModel> humanPlayers1 = [
    PlayersModel(Assets.images.fetchfiveProfilePic022.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic019.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic017.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic009.path, 'Seanm'),
  ];

  List<PlayersModel> humanPlayers2 = [
    PlayersModel(Assets.images.fetchfiveProfilePic010.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic019.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic014.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic015.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic016.path, 'Seanm'),
    PlayersModel(Assets.images.fetchfiveProfilePic015.path, 'Seanm'),
  ];

  List<PlayersModel> humanPlayerSearch = [
    PlayersModel(Assets.images.fetchfiveProfilePic022.path, 'One'),
    PlayersModel(Assets.images.fetchfiveProfilePic019.path, 'Two'),
    PlayersModel(Assets.images.fetchfiveProfilePic017.path, 'Three'),
    PlayersModel(Assets.images.fetchfiveProfilePic009.path, 'Four'),
  ];

  @override
  void onInit() {
    super.onInit();
    filteredData.assignAll(humanPlayerSearch);

    textEditingController.addListener(() {
      filterData(textEditingController.text);
    });
  }

  void filterData(String query) {
    if (query.isEmpty) {
      filteredData.assignAll(humanPlayerSearch);
      isNoResultsFound.value = false;
    } else {
      var filteredList = humanPlayerSearch
          .where((player) =>
              player.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (filteredList.isEmpty) {
        isNoResultsFound.value = true;
      } else {
        isNoResultsFound.value = false;
      }
      filteredData.assignAll(filteredList);
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
