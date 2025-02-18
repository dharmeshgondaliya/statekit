library statekit;

import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'statekit/state_data_holder.dart';
part 'statekit/st.dart';
part 'statekit/st_types.dart';
part 'controller/state_controller.dart';
part 'state_management/state_view_base.dart';
part 'state_management/state_view.dart';
part 'state_management/state_view_platform.dart';
part 'state_management/state_builder_base.dart';
part 'state_management/state_builder.dart';
part 'state_management/state_builder_platform.dart';
part 'state_management/state_provider.dart';
part 'data_storage/data_storage.dart';

abstract final class Statekit {
  static T put<T>(T obj, {String? tag}) {
    return DataStorage._instance._put<T>(obj, tag);
  }

  static T putIfAbsent<T>(T obj, {String? tag}) {
    return DataStorage._instance._putIfAbsent<T>(obj, tag);
  }

  static T find<T>({String? tag}) {
    return DataStorage._instance._find<T>(tag);
  }

  static T? findOrNull<T>({String? tag}) {
    return DataStorage._instance._findOrNull<T>(tag);
  }

  static T replace<T>(T obj, {String? tag}) {
    return DataStorage._instance._replace(obj, tag);
  }

  static void delete<T>({String? tag}) {
    return DataStorage._instance.delete<T>(tag);
  }

  static void deleteObject<T>({required T object, String? tag}) {
    return DataStorage._instance.deleteObject<T>(object, tag);
  }

  static void deleteAll<T>() {
    return DataStorage._instance.deleteAll();
  }
}
