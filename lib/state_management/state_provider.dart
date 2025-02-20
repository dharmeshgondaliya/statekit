part of '../statekit.dart';

typedef StateProviderCreate<T> = T Function();

class StateProvider<T> {
  StateProvider({required this.create, this.tag});
  StateProviderCreate<T> create;
  String? tag;
}

class StatekitProvider<T extends StateController> extends StatefulWidget {
  const StatekitProvider({super.key, required this.stateProvider, required this.child}) : stateProviders = null;
  const StatekitProvider.multi({super.key, required this.stateProviders, required this.child}) : stateProvider = null;
  final StateProvider<T>? stateProvider;
  final List<StateProvider<T>>? stateProviders;
  final Widget child;

  @override
  State<StatekitProvider> createState() => _StateProviderState<T>();
}

class _StateProviderState<T extends StateController> extends State<StatekitProvider> {
  _StateProviderState();
  final List<StateProvider<T>> controllers = [];

  _putControllers() {
    if (widget.stateProvider != null) {
      controllers.add(widget.stateProvider as StateProvider<T>);
    } else {
      controllers.addAll(widget.stateProviders! as List<StateProvider<T>>);
    }
    for (int i = 0; i < controllers.length; i++) {
      T? controller = Statekit.putIfAbsent(controllers[i].create(), tag: controllers[i].tag);
      if (widget.child is StatekitView && widget.child is StateBinding) {
        controller?.binding = widget.child as StateBinding;
      }
    }
  }

  void _initControllers() {
    for (int i = 0; i < controllers.length; i++) {
      _initStateProviderController(controllers[i].create, controllers[i].tag);
    }
  }

  void _initStateProviderController(StateProviderCreate<T> creator, String? tag) {
    (Statekit.findOrNull<T>(tag: tag) as StateController)
      ..arguments = ModalRoute.settingsOf(context)?.arguments
      ..onInit();
  }

  void _disposeControllers() {
    for (int i = 0; i < controllers.length; i++) {
      _disposeStateProviderController(controllers[i].create, controllers[i].tag);
    }
  }

  void _disposeStateProviderController(StateProviderCreate<T> creator, String? tag) {
    (Statekit.findOrNull<T>(tag: tag) as StateController).dispose();
    Statekit.delete<T>(tag: tag);
  }

  @override
  void initState() {
    super.initState();
    _putControllers();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) => _initControllers.call());
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
