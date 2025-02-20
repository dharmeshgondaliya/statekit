part of '../statekit.dart';

abstract class StateController<T extends StateBinding> extends StateDataHolder {
  late final Object? arguments;
  T? binding;

  void onInit() {}
  void dispose() {}
}
