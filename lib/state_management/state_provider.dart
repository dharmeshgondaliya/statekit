part of '../statekit.dart';

typedef StateProviderCreate<T> = T Function();

class StatekitProvider<T> {
  StatekitProvider({required this.create, this.tag});
  StateProviderCreate<T> create;
  String? tag;
}

class StateProvider<T extends StateController> extends StatefulWidget {
  StateProvider({super.key, required this.stateProvider, required this.child}) : stateProviders = null {
    _putControllers();
  }
  StateProvider.multi({super.key, required this.stateProviders, required this.child}) : stateProvider = null {
    _putControllers();
  }

  final List<StatekitProvider<T>> _providers = [];
  final StatekitProvider<T>? stateProvider;
  final List<StatekitProvider<T>>? stateProviders;
  final Widget child;

  void _putControllers() {
    if (stateProvider != null) {
      _providers.add(stateProvider!);
    } else {
      _providers.addAll(stateProviders!);
    }
    for (int i = 0; i < _providers.length; i++) {
      T controller = Statekit.putIfAbsent(_providers[i].create(), tag: _providers[i].tag);
      if (child is StatekitView && child is StateBinding) {
        controller.binding = child as StateBinding;
      }
    }
  }

  @override
  State<StateProvider> createState() => _StateProviderState<T>();
}

class _StateProviderState<T extends StateController> extends State<StateProvider> {
  void _initControllers() {
    for (int i = 0; i < widget._providers.length; i++) {
      _initStateProviderController(widget._providers[i].create, widget._providers[i].tag);
    }
  }

  void _initStateProviderController<S>(StateProviderCreate<S> creator, String? tag) {
    (Statekit.findOrNull<T>(tag: tag) as StateController)
      ..arguments = ModalRoute.settingsOf(context)?.arguments
      ..onInit();
  }

  void _disposeControllers() {
    for (int i = 0; i < widget._providers.length; i++) {
      _disposeStateProviderController(widget._providers[i].create, widget._providers[i].tag);
    }
  }

  void _disposeStateProviderController<S>(StateProviderCreate<S> creator, String? tag) {
    (Statekit.findOrNull<T>(tag: tag) as StateController).dispose();
    Statekit.delete<T>(tag: tag);
  }

  @override
  void initState() {
    super.initState();
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
