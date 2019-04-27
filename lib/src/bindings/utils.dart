import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';

typedef void RandomBytesBufferSignature(Pointer<Uint8> salt, int size);
typedef Void NativeRandomBytesBufferSignature(Pointer<Uint8> salt, Uint8 size);

class RandomBytesBufferBindings extends Bindings<RandomBytesBufferSignature> {
  RandomBytesBufferBindings(DynamicLibrary sodium) : super('randombytes_buf') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeRandomBytesBufferSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  void call(Pointer<Uint8> salt, int size) {
    checkAvailability();
    return f(salt, size);
  }
}
