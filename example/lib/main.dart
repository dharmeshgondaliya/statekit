import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:statekit/statekit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StatekitProvider(
      stateProvider: StateProvider(create: () => HomeController()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.firstScreen,
        routes: Routes.routes,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController = Statekit.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StateBuilder<HomeController>(
              builder: (context, controller, child) {
                return GestureDetector(
                  onTap: () {
                    controller.count++;
                    controller.update();
                  },
                  child: Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    color: Colors.green.withValues(alpha: 0.1),
                    alignment: Alignment.center,
                    child: child,
                  ),
                );
              },
              child: const TextWidget(),
            ),
            StateBuilderPlatform<HomeController>(
              builder: (context, controller, child) {
                return Text("Builder: ${controller.count.toString()}");
              },
              android: (context, controller, child) {
                return Column(
                  children: [
                    Text("Android: ${controller.count.toString()}"),
                    child!,
                  ],
                );
              },
              child: const TextWidget(),
            ),
            StateBuilder(
              controller: homeController,
              builder: (context, controller, child) {
                return Text(controller.count.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.secondScreen);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HomeController extends StateController {
  int count = 0;

  void incrementCount() {
    count++;
    update();
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello");
  }
}
