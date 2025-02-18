import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StateBuilder<SecondScreenController>(
          builder: (context, controller, child) {
            return MaterialButton(
              onPressed: () {
                Statekit.find<HomeController>().incrementCount();
              },
              child: const Text("Click"),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreenController extends StateController {}
