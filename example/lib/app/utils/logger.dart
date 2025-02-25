import 'package:flutter/foundation.dart';

class Logger {
  static void log(String obj) {
    if (kDebugMode) {
      print(obj);
    }
  }
}
