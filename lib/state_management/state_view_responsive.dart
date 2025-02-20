part of '../statekit.dart';

final class StateViewResponsive<T extends _St> extends _StateViewWidget {
  const StateViewResponsive({
    super.key,
    required T value,
    this.mobile,
    this.tablet,
    this.desktop,
    this.builder,
    this.child,
  }) : super(value: value);
  final StateViewPlatformBuilder<T>? mobile;
  final StateViewPlatformBuilder<T>? tablet;
  final StateViewPlatformBuilder<T>? desktop;
  final StateViewPlatformBuilder<T>? builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    StateViewPlatformBuilder<T>? widgetFn;
    final double width = MediaQuery.sizeOf(context).width;

    if (width < 600) {
      widgetFn = mobile;
    } else if (width < 1200) {
      widgetFn = tablet;
    } else {
      widgetFn = desktop;
    }

    widgetFn ??= builder;

    return widgetFn!(value as T, child);
  }
}
