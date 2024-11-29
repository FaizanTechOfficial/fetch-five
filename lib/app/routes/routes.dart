import 'package:fetch_five/app/bindings/bindings.dart';
import 'package:fetch_five/app/screens/auth/create_account/create_account.dart';
import 'package:fetch_five/app/screens/auth/forgot_password/forgot_password.dart';
import 'package:fetch_five/app/screens/choose_avatar/choose_avatar.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard.dart';
import 'package:fetch_five/app/screens/dashboard/items/game_board/game_board.dart';
import 'package:fetch_five/app/screens/auth/login/login.dart';
import 'package:fetch_five/app/screens/new_game/new_game.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const login = '/';
  static const forgotPassword = '/forgotPassword';
  static const createAccount = '/createAccount';
  static const game = '/game';
  static const gameBoard = '/gameBoard';
  static const chooseAvatar = '/chooseAvatar';
  static const newGame = '/newGame';

  static final routes = [
    GetPage(
      name: login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: game,
      page: () => const DashBoard(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: gameBoard,
      page: () => const GameBoard(),
      // binding: GameBoardBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPassword(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: createAccount,
      page: () => const CreateAccount(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: chooseAvatar,
      page: () => const ChooseAvatar(),
      binding: ChooseAvatarBinding(),
    ),
    GetPage(
      name: newGame,
      page: () => const NewGame(),
      binding: NewGameBinding(),
    )
  ];
}
