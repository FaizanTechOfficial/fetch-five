import 'package:fetch_five/app/models/players_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewGameController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  RxList<PlayersModel> filteredData = RxList<PlayersModel>();
  RxBool isNoResultsFound = false.obs;

  List<PlayersModel> humanPlayers1 = [
    PlayersModel('assets/images/fetchfive-profile-pic-022.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-019.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-017.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-009.png', 'Seanm'),
  ];

  List<PlayersModel> humanPlayers2 = [
    PlayersModel('assets/images/fetchfive-profile-pic-010.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-019.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-014.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-015.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-016.png', 'Seanm'),
    PlayersModel('assets/images/fetchfive-profile-pic-015.png', 'Seanm'),
  ];

  List<PlayersModel> humanPlayerSearch = [
    PlayersModel('assets/images/fetchfive-profile-pic-022.png', 'One'),
    PlayersModel('assets/images/fetchfive-profile-pic-019.png', 'Two'),
    PlayersModel('assets/images/fetchfive-profile-pic-017.png', 'Three'),
    PlayersModel('assets/images/fetchfive-profile-pic-009.png', 'Four'),
  ];

  @override
  void onInit() {
    super.onInit();
    filteredData.assignAll(humanPlayerSearch); // Set initial filtered data

    // Listen for changes in the search text
    textEditingController.addListener(() {
      filterData(textEditingController.text);
    });
  }

  // Method to filter data based on the search query
  void filterData(String query) {
    if (query.isEmpty) {
      filteredData
          .assignAll(humanPlayerSearch); // Show all data if query is empty
      isNoResultsFound.value = false; // No results found flag reset
    } else {
      var filteredList = humanPlayerSearch
          .where((player) =>
              player.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (filteredList.isEmpty) {
        isNoResultsFound.value = true; // Set flag when no results are found
      } else {
        isNoResultsFound.value = false; // Reset flag if results are found
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
