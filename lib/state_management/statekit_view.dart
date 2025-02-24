part of "../statekit.dart";

abstract class StatekitView<T extends StateController> extends StatefulWidget {
  StatekitView({super.key, T? controller, this.tag}) {
    _controller = controller ?? Statekit.findOrNull<T>(tag: tag);
  }
  final String? tag;
  T? _controller;
  late final BuildContext Function() _contextGetter;

  T get controller => _controller!;

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

  @override
  void initState() {
    widget._controller ??= Statekit.find<T>(tag: widget.tag);
    widget._contextGetter = _contextGetter;
    super.initState();
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
