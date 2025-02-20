part of '../statekit.dart';

final class StateBuilderResponsive<T extends StateController> extends StateBuilderBase<T> {
  StateBuilderResponsive({
    super.key,
    super.tag,
    T? controller,
    this.mobile,
    this.tablet,
    this.desktop,
    this.builder,
    this.child,
    super.buildWhen,
  }) : super(controller: controller);
  final StateBuildersPlatformBuilder<T>? mobile;
  final StateBuildersPlatformBuilder<T>? tablet;
  final StateBuildersPlatformBuilder<T>? desktop;
  final StateBuildersPlatformBuilder<T>? builder;
  final Widget? child;

  @override
  Widget build(context) {
    StateBuildersPlatformBuilder<T>? builderFn;
    final double width = MediaQuery.sizeOf(context).width;

    if (width < 600) {
      builderFn = mobile;
    } else if (width < 1200) {
      builderFn = tablet;
    } else {
      builderFn = desktop;
    }

    builderFn ??= builder;

    return builderFn!(context, _controller as T, child);
  }

  @override
  void dispose() {}

  @override
  void initState() {}
}
