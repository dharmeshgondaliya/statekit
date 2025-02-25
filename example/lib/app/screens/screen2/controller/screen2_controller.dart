import 'package:example/app/screens/screen2/binding/screen2_binding.dart';
import 'package:example/app/utils/logger.dart';
import 'package:statekit/statekit.dart';

class Screen2Controller extends StateController<Screen2Binding> {
  int counter = 0;

  @override
  void onInit() {
    super.onInit();
    Logger.log("Arguments: $arguments");
  }

  @override
  void dispose() {
    Logger.log("dispose");
    super.dispose();
  }

  void incrementCounter() {
    counter++;
    update();
  }
}
