import 'package:fetch_five/app.dart';
import 'package:fetch_five/app/bindings/services_bindings.dart';
import 'package:fetch_five/app/routes/routes.dart';
import 'package:fetch_five/app/services/local/shared_pref.dart';
import 'package:fetch_five/app/utilities/platform_services.dart';
import 'package:fetch_five/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firsState = await SharedPref().getString(SharedPref.lastRouteKey);
  await PlatformService.adjustWindowSize();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    MyApp(
      firsState: firsState,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String firsState;
  const MyApp({super.key, required this.firsState});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: firsState == RouteState.home.name
              ? AppRoutes.game
              : AppRoutes.login,
          getPages: AppRoutes.routes,
          initialBinding: ServicesBindings(),
          title: "Fetch Five",
        );
      },
    );
  }
}
