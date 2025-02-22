import 'package:example/main.dart';
import 'package:example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

class Routes {
  static const String firstScreen = "/firstScreen";
  static const String secondScreen = "/secondScreen";

  static final Map<String, Widget Function(BuildContext contect)> routes = {
    firstScreen: (_) => const MyHomePage(),
    secondScreen: (_) => StateProvider(
          stateProvider: StatekitProvider(create: () => SecondScreenController()),
          child: SecondScreen(),
        ),
  };
}
