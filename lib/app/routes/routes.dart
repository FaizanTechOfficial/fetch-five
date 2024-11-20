import 'package:fetch_five/app/screens/home/home.dart';
import 'package:fetch_five/app/screens/login/login.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';

  static final routes = [
    GetPage(
      name: login,
      page: () => const Login(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    ),
  ];
}
