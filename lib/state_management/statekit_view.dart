part of "../statekit.dart";

abstract class StatekitView<T extends StateController> extends StatefulWidget {
  StatekitView({super.key, this.tag});
  final String? tag;
  late final BuildContext Function() _contextGetter;
  late final T Function() _controllerGetter;

  T get controller => _controllerGetter.call();

  BuildContext get context => _contextGetter.call();

  @override
  State<StatekitView> createState() => _StatekitViewState<T>();

  @protected
  Widget build(BuildContext context);

  @protected
  @mustCallSuper
  void initState() {}

  @protected
  @mustCallSuper
  void dispose() {}
}

class _StatekitViewState<T extends StateController> extends State<StatekitView> {
  BuildContext _contextGetter() => context;
  T _controllerGetter() => _controller!;

  T? _controller;

  @override
  void initState() {
    _controller ??= Statekit.find<T>(tag: widget.tag);
    widget._contextGetter = _contextGetter;
    widget._controllerGetter = _controllerGetter;
    super.initState();
    _controller ??= Statekit.find<T>(tag: widget.tag);
    widget.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context);
}
