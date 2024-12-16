import 'package:dio/dio.dart';
import 'package:fetch_five/app/data/gen/assets.gen.dart';
import 'package:fetch_five/app/models/new_game_model.dart';
import 'package:fetch_five/app/models/players_model.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard_controller.dart';
import 'package:fetch_five/app/services/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import 'package:logger/web.dart';

class NewGameController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final dashboardController = Get.find<DashboardController>();
  RxList<PlayersModel> filteredData = RxList<PlayersModel>();
  RxBool isNoResultsFound = false.obs;
  bool _isScreenLoader = false;
  bool get getScreenLoader => _isScreenLoader;
  RxBool screenLoading = false.obs;
  NewGameModel newGameModel = NewGameModel();
  final _dio = Get.find<DioClient>();

  // List<PlayersModel> humanPlayers1 = [
  //   PlayersModel(Assets.images.fetchfiveProfilePic022.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic019.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic017.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic009.path, 'Seanm'),
  // ];

  // List<PlayersModel> humanPlayers2 = [
  //   PlayersModel(Assets.images.fetchfiveProfilePic010.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic019.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic014.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic015.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic016.path, 'Seanm'),
  //   PlayersModel(Assets.images.fetchfiveProfilePic015.path, 'Seanm'),
  // ];

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

  Future newGame(String oppUid) async {
    try {
      screenLoading.value = true;
      final newGameData =
          await _dio.post('new-game', data: {"opp_uid": oppUid});
      newGameModel = NewGameModel.fromJson(newGameData.data);
      dashboardController
          .getYourTurnGameDetails(newGameModel.gameId.toString());

      dashboardController.currentIndex.value == 0;
      dashboardController.isOnGamePlayer.value = false;
      dashboardController.isOnGameBoard.value = true;
      Get.offAndToNamed(AppRoutes.game);
    } catch (e) {
      if (e is DioException) {
        final msg = e.response as Response<dynamic>;
        Get.snackbar(
          msg.data['status'],
          msg.data['message'],
          backgroundColor: const Color(0xff22222b),
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'An unexpected error occurred.',
          backgroundColor: const Color(0xff22222b),
          colorText: Colors.white,
        );
        Logger().e('Unexpected error: $e');
      }
    } finally {
      screenLoading.value = false;
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
