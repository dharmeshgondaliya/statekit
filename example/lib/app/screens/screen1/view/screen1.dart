import 'package:example/app/routes/routes.dart';
import 'package:example/app/screens/screen1/binding/screen1_binding.dart';
import 'package:example/app/screens/screen1/controller/screen1_controller.dart';
import 'package:example/app/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

class Screen1 extends StatekitView<Screen1Controller> implements Screen1Binding {
  Screen1({super.key});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StateView(
                  value: controller.counter,
                  builder: (value) {
                    return Text("Count: ${value.value.toString()}");
                  },
                ),
                StateViewPlatform(
                  value: controller.counter,
                  android: (value, child) => Row(
                    children: [
                      child!,
                      Text(value.value.toString()),
                    ],
                  ),
                  builder: (value, child) => Column(
                    children: [
                      child!,
                      Text(value.value.toString()),
                    ],
                  ),
                  child: const CountText(),
                ),
                StateViewResponsive(
                  value: controller.counter,
                  mobile: (value, child) => Row(
                    children: [
                      child!,
                      Text(value.value.toString()),
                    ],
                  ),
                  builder: (value, child) => Column(
                    children: [
                      child!,
                      Text(value.value.toString()),
                    ],
                  ),
                  child: const CountText(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.incrementCounter();
              },
              child: Text("Increment"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.screen2, arguments: DateTime.now().toString());
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  @override
  void showMessage(String message) async {
    Logger.log(message);
  }
}

class CountText extends StatelessWidget {
  const CountText({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("count text build:");
    return Text("Count: ");
  }
}
