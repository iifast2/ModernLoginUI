import 'dart:io';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class Utils {
  static Future<void> enableScreenshotProtection() async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }

  static Future<void> disableScreenshotProtection() async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }
  }
}
