part of '../statekit.dart';

typedef StateBuildersBuilder<T> = Widget Function(BuildContext context, T controller, Widget? child);
typedef StateBuildersPlatformBuilder<T> = Widget Function(BuildContext context, T controller, Widget? child);
typedef StateBuilderBuildWhen<T> = bool Function(T controller);

abstract class StateBuilderBase<T extends StateController> extends StatefulWidget {
  StateBuilderBase({super.key, T? controller, this.buildWhen, String? tag}) {
    this.controller = controller ?? Statekit.find<T>(tag: tag);
  }
  late final T? controller;
  final StateBuilderBuildWhen<T>? buildWhen;

  bool get canBuild => buildWhen?.call(controller as T) ?? true;

  @override
  State<StateBuilderBase> createState() => _StateBuilderBaseState();

  @protected
  Widget build(BuildContext context);
}

class _StateBuilderBaseState extends State<StateBuilderBase> {
  @override
  void initState() {
    super.initState();
    widget.controller!._addCallbackFunction(_updateWidgetTree);
  }

  @override
  void dispose() {
    widget.controller!._removeCallbackFunction(_updateWidgetTree);
    super.dispose();
  }

  void _updateWidgetTree() {
    if (mounted && widget.canBuild) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
