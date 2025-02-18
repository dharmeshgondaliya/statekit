part of '../statekit.dart';

class StInt extends _St<int> {
  StInt(super.value);
}

class StnInt extends _St<int?> {
  StnInt([super.value]);
}

class StDouble extends _St<double> {
  StDouble(super.value);
}

class StnDouble extends _St<double?> {
  StnDouble([super.value]);
}

class StNum extends _St<num> {
  StNum(super.value);
}

class StnNum extends _St<num?> {
  StnNum([super.value]);
}

class StString extends _St<String> {
  StString(super.value);
}

class StnString extends _St<String?> {
  StnString([super.value]);
}

class St<T> extends _St<T> {
  St(super.value);
}

class Stn<T> extends _St<T?> {
  Stn([super.value]);
}
