import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int currentIndex = 0;
  RxBool isLoading = false.obs;
  RxBool isDrawerVisible = false.obs;
  final key = GlobalKey<ScaffoldState>();
  RxBool isUserOneActive = true.obs;
  RxList<int> cardNumbers = List.generate(100, (_) => 0).obs;
  RxList<Rx<Color>> cardColors =
      List.generate(100, (_) => Rx<Color>(const Color(0xff22222B))).obs;
  RxList<Rx<Color>> textColors =
      List.generate(100, (_) => Rx<Color>(Colors.white)).obs;
  final List<RxBool> isSquareClicked = List.generate(100, (index) => false.obs);

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    update();
  }

  void openDrawer() {
    isDrawerVisible.value = true;
  }

  void closeDrawer() {
    isDrawerVisible.value = false;
  }

  void toggleActiveUser(int index) {
    isUserOneActive.value = !isUserOneActive.value;
    cardColors[index].value = isUserOneActive.value ? pinkColor : blueColor;
    textColors[index].value = Colors.black;
  }

  void toggleProfileUser() {
    isUserOneActive.value = !isUserOneActive.value;
  }

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void refreshScreen() {
    cardColors.value =
        List.generate(100, (_) => Rx<Color>(const Color(0xff22222B)));
    textColors.value = List.generate(100, (_) => Rx<Color>(Colors.white));
    for (var i = 0; i < isSquareClicked.length; i++) {
      isSquareClicked[i].value = false;
    }
    update();
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
