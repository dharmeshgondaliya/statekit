import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

class SecondScreen extends StatekitView<SecondScreenController> implements SecondScreenBinding {
  SecondScreen({super.key, super.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Statekit.find<HomeController>().incrementCount();
          },
          child: const Text("Click"),
        ),
      ),
    );
  }

  @override
  void showMessage(String text) {
    print("Message: $text");
  }
}

class SecondScreenController extends StateController<SecondScreenBinding> {}

abstract class SecondScreenBinding implements StateBinding {
  void showMessage(String text);
}
