import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';
import 'package:libsodium/src/signatures/dart/dart_signatures.dart';
import 'package:libsodium/src/signatures/natives/native_signatures.dart';

class SodiumInitBindings
    extends Bindings<SodiumInitSignature, NativeSodiumInitSignature> {
  SodiumInitBindings(DynamicLibrary sodium) : super(sodium, 'sodium_init');

  int call() {
    checkAvailability();
    return f();
  }
}
