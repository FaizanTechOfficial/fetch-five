// import 'package:device_preview/device_preview.dart';
import 'package:fetch_five/app.dart';
import 'package:fetch_five/app/utilities/platform_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PlatformService.adjustWindowSize();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}
