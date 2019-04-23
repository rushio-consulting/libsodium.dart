import 'dart:ffi';

import 'package:convert/convert.dart';

class ByteArray<T extends NativeType> {
  final Pointer<T> ptr;
  final int length;

  ByteArray(this.ptr, this.length)
      : assert(ptr != null),
        assert(length != null);

  factory ByteArray.fromCodeUnits(List<int> codeUnits) {
    final ptr = allocate(count: codeUnits.length);
    for (int i = 0; i < codeUnits.length; i++) {
      ptr.elementAt(i).store(codeUnits[i]);
    }
    return ByteArray(ptr, codeUnits.length);
  }

  List<int> get bytes => List.unmodifiable(() sync* {
        for (int i = 0; i < length; i++) {
          yield ptr.elementAt(i).load<int>();
        }
      }());

  String toString() => hex.encode(bytes);
}
