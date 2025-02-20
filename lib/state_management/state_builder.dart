part of '../statekit.dart';

final class StateBuilder<T extends StateController> extends StateBuilderBase<T> {
  StateBuilder({super.key, super.tag, T? controller, required this.builder, this.child, super.buildWhen}) : super(controller: controller);
  final StateBuildersBuilder<T> builder;
  final Widget? child;

  @override
  Widget build(context) => builder(context, _controller as T, child);

  @override
  void dispose() {}

  @override
  void initState() {}
}
