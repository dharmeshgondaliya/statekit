import 'package:example/app/screens/screen1/binding/screen1_binding.dart';
import 'package:statekit/statekit.dart';

class Screen1Controller extends StateController<Screen1Binding> {
  StInt counter = StInt(0);

  void incrementCounter() {
    counter.value = counter.value + 1;
    binding?.showMessage("Count: ${counter.value}");
  }
}
