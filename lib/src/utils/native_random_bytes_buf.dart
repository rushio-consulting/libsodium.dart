import 'dart:ffi';

import 'package:libsodium/src/init.dart';

Pointer<Uint8> nativeRandomBytesBuf(int size) {
  final salt = allocate<Uint8>(count: size);
  bindings.randomBytesBufferBindings(salt, size);
  return salt;
}
