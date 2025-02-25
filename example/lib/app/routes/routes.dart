import 'package:example/app/screens/screen1/controller/screen1_controller.dart';
import 'package:example/app/screens/screen1/view/screen1.dart';
import 'package:example/app/screens/screen2/controller/screen2_controller.dart';
import 'package:example/app/screens/screen2/view/screen2.dart';
import 'package:example/app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

class Routes {
  static const String splash = "/";
  static const String screen1 = "screen1";
  static const String screen2 = "screen2";

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (_) => SplashScreen(),
    screen1: (_) => StateProvider(
          stateProvider: StatekitProvider(create: () => Screen1Controller()),
          child: Screen1(),
        ),
    screen2: (_) => StateProvider(
          stateProvider: StatekitProvider(create: () => Screen2Controller()),
          child: Screen2(),
        ),
  };
}
