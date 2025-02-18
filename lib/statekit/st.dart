part of '../statekit.dart';

sealed class _St<T> extends StateDataHolder {
  _St(this._value);
  T _value;

  T get value => _value;

  set value(T value) {
    _value = value;
    refresh();
  }

  void refresh() {
    update();
  }

  T call() => _value;
}
