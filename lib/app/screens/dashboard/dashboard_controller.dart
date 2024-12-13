import 'package:dio/dio.dart';
import 'package:fetch_five/app/models/available_players_model.dart';
import 'package:fetch_five/app/models/dashboard_game_model.dart';
import 'package:fetch_five/app/models/game_details_model.dart';
import 'package:fetch_five/app/models/game_model.dart';
import 'package:fetch_five/app/models/games_model.dart';
import 'package:fetch_five/app/models/player_info_model.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/services/dio_client.dart';
import 'package:fetch_five/app/services/local/shared_pref.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:fetch_five/app/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isOnGameBoard = false.obs;
  final _dio = Get.find<DioClient>();
  final SharedPref pref = SharedPref();
  ActiveGamesTurn activeGamesTurn = ActiveGamesTurn();
  PlayerInfoModel playerInfoModel = PlayerInfoModel();
  List<GameModel> completedTurnGame = [];
  AvailablePlayers availablePlayers = AvailablePlayers();
  List<GameModel> yourTurnGame = [];
  List<GameModel> theirTurnGame = [];
  String selectedGameId = '';
  String selectedTurnType = '';
  Rx<GameDetailModel> gameDetails = Rx<GameDetailModel>(GameDetailModel());
  String yourTurnLabel = '';
  String theirTurnLabel = '';
  String completedTurnLabel = '';
  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool screenLoading = false.obs;
  RxBool isDrawerVisible = false.obs;
  final key = GlobalKey<ScaffoldState>();
  RxBool isUserOneActive = true.obs;
  RxList<int> cardNumbers = List.generate(100, (_) => 0).obs;
  RxList<Rx<Color>> cardColors =
      List.generate(100, (_) => Rx<Color>(const Color(0xff22222B))).obs;
  RxList<Rx<Color>> textColors =
      List.generate(100, (_) => Rx<Color>(Colors.white)).obs;
  final List<RxBool> isSquareClicked = List.generate(100, (index) => false.obs);
  String? lastGameId;
  List<Player>? humanPlayers = [];
  List<Player>? robotPlayers = [];

  @override
  void onInit() {
    pref.putString(SharedPref.lastRouteKey, RouteState.home.name);
    super.onInit();
  }

  @override
  void onReady() {
    playerInfo();
    currentIndex.listen((index) {
      if (index == 3 ||
          gameDetails.value.gameStatus == 'new' ||
          gameDetails.value.gameStatus == 'active') {
        isOnGameBoard.value = true;
      } else {
        isOnGameBoard.value = false;
      }
    });
    super.onReady();
  }

  void updateIndex(int newIndex) {
    currentIndex.value = newIndex;
    update();
  }

  void openDrawer() {
    isDrawerVisible.value = true;
  }

  void closeDrawer() {
    isDrawerVisible.value = false;
  }

  // void toggleActiveUser(int index) {
  //   isUserOneActive.value = !isUserOneActive.value;
  //   cardColors[index].value = isUserOneActive.value ? pinkColor : blueColor;
  //   textColors[index].value = Colors.black;
  // }

  void toggleProfileUser() {
    isUserOneActive.value = !isUserOneActive.value;
  }

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  // void refreshScreen() {
  //   cardColors.value =
  //       List.generate(100, (_) => Rx<Color>(const Color(0xff22222B)));
  //   textColors.value = List.generate(100, (_) => Rx<Color>(Colors.white));
  //   for (var i = 0; i < isSquareClicked.length; i++) {
  //     isSquareClicked[i].value = false;
  //   }
  //   update();
  // }

  Future<dynamic> playerInfo() async {
    try {
      screenLoading.value = true;
      final sessionId = await pref.getString('session_id');
      final result = await _dio.get('game-dashboard', sessionId: sessionId);

      final DashboardGameModel dashboardGameModel =
          DashboardGameModel.fromJson(result.data);

      playerInfoModel = dashboardGameModel.playerInfo ??
          PlayerInfoModel(playerName: '', playerProfilePic: '');

      final gamesModel = dashboardGameModel.games;

      final ActiveGamesTurn? completedTurn = gamesModel?.completedGames;
      final ActiveGamesTurn? yourTurn = gamesModel?.activeGamesYourTurn;
      final ActiveGamesTurn? thierTurn = gamesModel?.activeGamesTheirTurn;

      yourTurnLabel = yourTurn?.label ?? '';
      theirTurnLabel = thierTurn?.label ?? '';
      completedTurnLabel = completedTurn?.label ?? '';

      completedTurnGame = completedTurn?.games ?? [];
      yourTurnGame = yourTurn?.games ?? [];
      theirTurnGame = thierTurn?.games ?? [];
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      screenLoading.value = false;
      update();
    }
  }

  Future<void> getYourTurnGameDetails(String gameId) async {
    try {
      screenLoading.value = true;
      selectedGameId = gameId;

      selectedTurnType = 'your';

      final yourTurnDetailsResponse =
          await _dio.post('game-details', data: {"game_id": gameId});

      gameDetails.value =
          GameDetailModel.fromJson(yourTurnDetailsResponse.data);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e);
    } finally {
      screenLoading.value = false;
    }
  }

  Future<void> getTheirTurnGameDetails(String gameId) async {
    try {
      screenLoading.value = true;
      selectedGameId = gameId;
      selectedTurnType = 'their';
      final theirTurnDetailsResponse =
          await _dio.post('game-details', data: {"game_id": gameId});

      gameDetails.value =
          GameDetailModel.fromJson(theirTurnDetailsResponse.data);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e);
    } finally {
      screenLoading.value = false;
    }
  }

  Future<void> getCompletedGameDetails(String gameId) async {
    try {
      selectedTurnType = 'completed';
      screenLoading.value = true;
      selectedGameId = gameId;
      final getCompletedGameDetails =
          await _dio.post('game-details', data: {"game_id": gameId});

      gameDetails.value =
          GameDetailModel.fromJson(getCompletedGameDetails.data);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e);
    } finally {
      screenLoading.value = false;
    }
  }

  Future startNewGame() async {
    try {
      screenLoading.value = true;
      final sessionId = await pref.getString('session_id');
      final response =
          await _dio.get('available-players', sessionId: sessionId);

      AvailablePlayers availablePlayersData =
          AvailablePlayers.fromJson(response.data);
      availablePlayers = availablePlayersData;
      humanPlayers = availablePlayers.humanPlayers;
      robotPlayers = availablePlayers.robotPlayers;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      screenLoading.value = false;
    }
  }

  Future<dynamic> logout() async {
    try {
      isLoading.value = true;
      final sessionId = await pref.getString('session_id');
      await _dio.logout('game-logout', sessionId: sessionId);
      await pref.clear();
      Get.offAllNamed(AppRoutes.login);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<int> numbers = [
    73,
    72,
    71,
    70,
    69,
    68,
    67,
    66,
    65,
    0,
    74,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    99,
    75,
    56,
    21,
    20,
    19,
    18,
    17,
    36,
    37,
    98,
    76,
    55,
    22,
    13,
    14,
    15,
    16,
    35,
    38,
    97,
    77,
    54,
    23,
    12,
    1,
    4,
    5,
    34,
    39,
    96,
    78,
    53,
    24,
    11,
    2,
    3,
    6,
    33,
    40,
    95,
    79,
    52,
    25,
    10,
    9,
    8,
    7,
    32,
    41,
    94,
    80,
    51,
    26,
    27,
    28,
    29,
    30,
    31,
    42,
    93,
    81,
    50,
    49,
    48,
    47,
    46,
    45,
    44,
    43,
    92,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
  ];
}
