part of '../statekit.dart';

final class DataStorage {
  static final DataStorage _ds = DataStorage._();

  static DataStorage get _instance => _ds;

  DataStorage._();

  final Map<String, dynamic> _data = <String, dynamic>{};

  T _put<T>(T obj, String? tag) {
    Type? type;
    if (T != obj.runtimeType) {
      type = obj.runtimeType;
    }
    String key = "${type?.toString() ?? T.toString()}@${tag ?? ''}";
    if (_data.containsKey(key)) {
      throw Exception("$T is already registered.");
    }
    _data[key] = obj;
    return obj;
  }

  T _putIfAbsent<T>(T obj, String? tag) {
    Type? type;
    if (T != obj.runtimeType) {
      type = obj.runtimeType;
    }
    String key = "${type?.toString() ?? T.toString()}@${tag ?? ''}";
    if (_data.containsKey(key)) {
      return _data[key];
    }
    _data[key] = obj;

    return obj;
  }

  T _find<T>(String? tag) {
    String key = "${T.toString()}@${tag ?? ''}";
    if (!_data.containsKey(key)) {
      throw Exception("$T is not registered.");
    }
    return _data[key];
  }

  T? _findOrNull<T>(String? tag) {
    String key = "${T.toString()}@${tag ?? ''}";
    if (!_data.containsKey(key)) {
      return null;
    }
    return _data[key];
  }

  T _replace<T>(T obj, String? tag) {
    Type? type;
    if (T != obj.runtimeType) {
      type = obj.runtimeType;
    }

    String key = "${type?.toString() ?? T.toString()}@${tag ?? ''}";
    if (!_data.containsKey(key)) {
      throw Exception("$T is not registered.");
    }
    _data.remove(key);
    _data[key] = obj;
    return obj;
  }

  void delete<T>(String? tag) {
    String key = "${T.toString()}@${tag ?? ''}";
    _data.remove(key);
  }

  void deleteObject<T>(T obj, String? tag) {
    Type? type;
    if (T != obj.runtimeType) {
      type = obj.runtimeType;
    }
    String key = "${type?.toString() ?? T.toString()}@${tag ?? ''}";
    _data.remove(key);
  }

  void deleteAll() {
    _data.clear();
  }
}
