part of '../statekit.dart';

final class StateBuilderPlatform<T extends StateController> extends StateBuilderBase<T> {
  StateBuilderPlatform({
    super.key,
    super.tag,
    T? controller,
    this.builder,
    this.android,
    this.ios,
    this.web,
    this.windows,
    this.mac,
    this.linux,
    this.fuchsia,
    this.child,
    super.buildWhen,
  }) : super(controller: controller);
  final StateBuildersPlatformBuilder<T>? builder;
  final StateBuildersPlatformBuilder<T>? web;
  final StateBuildersPlatformBuilder<T>? android;
  final StateBuildersPlatformBuilder<T>? ios;
  final StateBuildersPlatformBuilder<T>? linux;
  final StateBuildersPlatformBuilder<T>? mac;
  final StateBuildersPlatformBuilder<T>? windows;
  final StateBuildersPlatformBuilder<T>? fuchsia;
  final Widget? child;

  @override
  Widget build(context) {
    StateBuildersPlatformBuilder<T>? builderFn;
    if (kIsWeb) {
      builderFn = web;
    } else if (Platform.isAndroid) {
      builderFn = android;
    } else if (Platform.isIOS) {
      builderFn = ios;
    } else if (Platform.isLinux) {
      builderFn = linux;
    } else if (Platform.isMacOS) {
      builderFn = mac;
    } else if (Platform.isWindows) {
      builderFn = windows;
    } else if (Platform.isFuchsia) {
      builderFn = fuchsia;
    }

    builderFn ??= builder;

    return builderFn!(context, _controller as T, child);
  }

  @override
  void dispose() {}

  @override
  void initState() {}
}
