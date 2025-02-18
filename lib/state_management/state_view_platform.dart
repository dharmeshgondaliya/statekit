part of '../statekit.dart';

final class StateViewPlatform<T extends _St> extends _StateViewWidget {
  const StateViewPlatform({
    super.key,
    required T value,
    this.builder,
    this.android,
    this.ios,
    this.web,
    this.windows,
    this.mac,
    this.linux,
    this.fuchsia,
    this.child,
  }) : super(value: value);
  final StateViewPLatformBuilder<T>? builder;
  final StateViewPLatformBuilder<T>? web;
  final StateViewPLatformBuilder<T>? android;
  final StateViewPLatformBuilder<T>? ios;
  final StateViewPLatformBuilder<T>? linux;
  final StateViewPLatformBuilder<T>? mac;
  final StateViewPLatformBuilder<T>? windows;
  final StateViewPLatformBuilder<T>? fuchsia;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    StateViewPLatformBuilder<T>? widgetFn;
    if (kIsWeb) {
      widgetFn = web;
    } else if (Platform.isAndroid) {
      widgetFn = android;
    } else if (Platform.isIOS) {
      widgetFn = ios;
    } else if (Platform.isLinux) {
      widgetFn = linux;
    } else if (Platform.isMacOS) {
      widgetFn = mac;
    } else if (Platform.isWindows) {
      widgetFn = windows;
    } else if (Platform.isFuchsia) {
      widgetFn = fuchsia;
    }

    widgetFn ??= builder;

    return widgetFn!(value as T, child);
  }
}
