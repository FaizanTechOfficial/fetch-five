import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';

Color getSquareColor({
  required String thisPlayer,
  required bool thisPlayersTurn,
  required List<int> playerOneSquares,
  required List<int> playerTwoSquares,
  required int number,
}) {
  bool isPlayerOne = thisPlayer == 'player_one';
  bool isThisPlayerTurn = thisPlayersTurn;

  if (isPlayerOne) {
    if (isThisPlayerTurn) {
      if (playerOneSquares.contains(number)) return blueColor;
      if (playerTwoSquares.contains(number)) return pinkColor;
    } else {
      if (playerOneSquares.contains(number)) return blueColor;
      if (playerTwoSquares.contains(number)) return pinkColor;
    }
  } else {
    if (isThisPlayerTurn) {
      if (playerOneSquares.contains(number)) return blueColor;
      if (playerTwoSquares.contains(number)) return pinkColor;
    } else {
      if (playerTwoSquares.contains(number)) return blueColor;
      if (playerOneSquares.contains(number)) return pinkColor;
    }
  }

  return const Color(0xff22222B);
}
