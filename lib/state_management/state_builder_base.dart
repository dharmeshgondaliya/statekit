part of '../statekit.dart';

typedef StateBuildersBuilder<T> = Widget Function(BuildContext context, T controller, Widget? child);
typedef StateBuildersPlatformBuilder<T> = Widget Function(BuildContext context, T controller, Widget? child);
typedef StateBuilderBuildWhen<T> = bool Function(T controller);

abstract class StateBuilderBase<T extends StateController> extends StatefulWidget {
  StateBuilderBase({super.key, T? controller, this.buildWhen, String? tag}) {
    this._controller = controller ?? Statekit.find<T>(tag: tag);
  }
  late final T? _controller;
  final StateBuilderBuildWhen<T>? buildWhen;

  bool get _canBuild => buildWhen?.call(_controller as T) ?? true;

  T get controller => _controller!;

  @override
  State<StateBuilderBase> createState() => _StateBuilderBaseState();

  @protected
  Widget build(BuildContext context);

  void initState();

  void dispose();
}

class _StateBuilderBaseState extends State<StateBuilderBase> {
  @override
  void initState() {
    super.initState();
    widget._controller!._addCallbackFunction(_updateWidgetTree);
    widget.initState();
  }

  @override
  void dispose() {
    widget._controller!._removeCallbackFunction(_updateWidgetTree);
    widget.dispose();
    super.dispose();
  }

  void _updateWidgetTree() {
    if (mounted && widget._canBuild) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
