import 'package:fetch_five/app.dart';
import 'package:fetch_five/app/utilities/platform_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb &&
  //     (defaultTargetPlatform == TargetPlatform.windows ||
  //         defaultTargetPlatform == TargetPlatform.macOS)) {
  //
  //}

  await PlatformService.adjustWindowSize();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const MyApp());
}


// import 'package:desktop_window/desktop_window.dart';
// import 'package:fetch_five/app/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// // void main() => runApp(
// //   DevicePreview(
// //     enabled: !kReleaseMode,
// //     builder: (context) => MyApp(),
// //   ),
// // );

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Set window size before running the app
//   try {
//     const windowSize = Size(440, 880);
//     await DesktopWindow.setWindowSize(windowSize);
//     await DesktopWindow.setMinWindowSize(windowSize);
//     await DesktopWindow.setMaxWindowSize(windowSize);
//     // Or
//     // await DesktopWindow.setMinWindowSize(const Size(800, 600)); // Set minimum size
//   } catch (e) {
//     debugPrint('Error setting window size: $e');
//   }

//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp, // Force portrait mode
//   ]);

//   runApp(const MyApp());
// }

// //void main() {
// //  runApp(MyApp());
// //}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(428, 926),
//       minTextAdapt: true,
//       builder: (context, child) {
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           // useInheritedMediaQuery: true,
//           // locale: DevicePreview.locale(context),
//           title: "Fetch Five",
//           initialRoute: AppRoutes.login,
//           getPages: AppRoutes.routes,
//           // home: HomeScreen(),
//         );
//       },
//     );
//   }
// }
