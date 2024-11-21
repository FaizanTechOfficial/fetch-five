import 'package:fetch_five/app/bindings/bindings.dart';
import 'package:fetch_five/app/screens/game_board/game.dart';
import 'package:fetch_five/app/screens/login/login.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const login = '/';
  static const game = '/game';

  static final routes = [
    GetPage(
      name: login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: game,
      page: () => const GameBoard(),
      bindings: [
        GameBoardBinding(),
        HomeBinding(),
        InstructionsBinding(),
      ],
    ),
  ];
}
