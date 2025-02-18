part of '../statekit.dart';

final class StateView<T extends _St> extends _StateViewWidget {
  const StateView({super.key, required T value, required this.builder}) : super(value: value);
  final StateViewBuilder<T> builder;

  @override
  Widget build(context) => builder(value as T);
}
