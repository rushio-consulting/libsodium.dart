import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';

typedef SodiumInitSignature = int Function();
typedef NativeSodiumInitSignature = Int32 Function();

class SodiumInitBindings extends Bindings<SodiumInitSignature> {
  SodiumInitBindings(DynamicLibrary sodium) : super('sodium_init') {
    try {
      f = sodium.lookupFunction<NativeSodiumInitSignature, SodiumInitSignature>(
          functionName);
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}
