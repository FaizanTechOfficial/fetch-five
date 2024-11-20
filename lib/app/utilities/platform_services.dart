import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformService {
  static Future<void> adjustWindowSize() async {
    if (!kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.macOS)) {
      try {
        const windowSize = Size(440, 880);
        await DesktopWindow.setWindowSize(windowSize);
        await DesktopWindow.setMinWindowSize(windowSize);
        await DesktopWindow.setMaxWindowSize(windowSize);
      } catch (e) {
        debugPrint('Error setting window size: $e');
      }
    }
  }
}
