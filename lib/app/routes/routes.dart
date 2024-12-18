import 'package:fetch_five/app/bindings/bindings.dart';
import 'package:fetch_five/app/screens/auth/create_account/create_account.dart';
import 'package:fetch_five/app/screens/auth/forgot_password/forgot_password.dart';
import 'package:fetch_five/app/screens/dashboard/dashboard.dart';
// import 'package:fetch_five/app/screens/dashboard/items/game_board/game_board.dart';
import 'package:fetch_five/app/screens/auth/login/login.dart';
import 'package:fetch_five/app/screens/dashboard_new/binding/dashboard_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/avatar/binding/avatar_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/game/binding/game_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/home/binding/home_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/instructions/binding/instructions_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/items/resign_game/binding/resign_game_binding.dart';
import 'package:fetch_five/app/screens/dashboard_new/view/dashboard_new.dart';
import 'package:fetch_five/app/screens/new_game/new_game.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const login = '/';
  static const forgotPassword = '/forgotPassword';
  static const createAccount = '/createAccount';
  static const game = '/game';
  static const newGame = '/newGame';

  //////////////////////////////////////
  //////////////////////////////////////
  //////////////////////////////////////
  ///
  ///
  ///

  static const String dashboard = '/dashboard';

  ///
  ///
  ///
  /////////////////////////////////////
  /////////////////////////////////////
  /////////////////////////////////////

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
        bindings: [
          ChooseAvatarBinding(),
        ]),
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
      name: newGame,
      page: () => const NewGame(),
      binding: NewGameBinding(),
    ),

    ////////////////////////////////////////////
    ////////////////////////////////////////////
    ////////////////////////////////////////////
    ///
    ///
    ///
    GetPage(
      name: dashboard,
      page: () => const DashboardNew(),
      bindings: [
        DashboardNewBinding(),
        GameBinding(),
        AvatarBinding(),
        HomeBinding(),
        InstructionsBinding(),
        ResignGameBinding(),
      ],
    ),

    ///
    ///
    ///
    ////////////////////////////////////////////
    ////////////////////////////////////////////
    ////////////////////////////////////////////
  ];
}
