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
  final StateViewPlatformBuilder<T>? builder;
  final StateViewPlatformBuilder<T>? web;
  final StateViewPlatformBuilder<T>? android;
  final StateViewPlatformBuilder<T>? ios;
  final StateViewPlatformBuilder<T>? linux;
  final StateViewPlatformBuilder<T>? mac;
  final StateViewPlatformBuilder<T>? windows;
  final StateViewPlatformBuilder<T>? fuchsia;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    StateViewPlatformBuilder<T>? widgetFn;
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
