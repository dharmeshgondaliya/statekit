import 'package:example/app/screens/screen2/binding/screen2_binding.dart';
import 'package:example/app/screens/screen2/controller/screen2_controller.dart';
import 'package:statekit/statekit.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatekitView<Screen2Controller> implements Screen2Binding {
  Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StateBuilder(
                  controller: controller,
                  buildWhen: (controller) => controller.counter % 2 == 0,
                  builder: (context, controller, child) => Column(
                    children: [
                      CountText(),
                      Text(controller.counter.toString()),
                    ],
                  ),
                ),
                StateBuilderPlatform<Screen2Controller>(
                  android: (context, controller, child) => Column(
                    children: [
                      child!,
                      Text(controller.counter.toString()),
                    ],
                  ),
                  builder: (context, controller, child) => Row(
                    children: [
                      child!,
                      Text(controller.counter.toString()),
                    ],
                  ),
                  child: const CountText(),
                ),
                StateBuilderResponsive<Screen2Controller>(
                  controller: controller,
                  mobile: (context, controller, child) => Text(controller.counter.toString()),
                  builder: (context, controller, child) => Row(
                    children: [
                      child!,
                      Text(controller.counter.toString()),
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
    );
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
