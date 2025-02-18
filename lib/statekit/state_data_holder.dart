part of '../statekit.dart';

sealed class StateDataHolder {
  final List<Function> _callbacks = [];

  void _addCallbackFunction(Function fn) => _callbacks.add(fn);

  void _removeCallbackFunction(Function fn) => _callbacks.remove(fn);

  void update() {
    for (Function fn in _callbacks) {
      fn();
    }
  }
}
