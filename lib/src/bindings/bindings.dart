import 'dart:ffi';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:libsodium/src/signatures/natives/native_signatures.dart';

abstract class Bindings<DartSignature extends Function, NativeSignature> {
  final String functionName;

  DartSignature f;

  Bindings(DynamicLibrary sodium, this.functionName) {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSodiumInitSignature>>(functionName)
          .asFunction<DartSignature>();
    } catch (_) {}
  }

  bool get isAvailable => f != null;

  @protected
  void checkAvailability() {
    if (!isAvailable) {
      throw BindingIsNotAvailableException(
          'Bindings for $functionName is not available on ${Platform.operatingSystem}');
    }
  }
}

class BindingIsNotAvailableException implements Exception {
  final String message;

  BindingIsNotAvailableException(this.message);

  @override
  String toString() {
    if (message == null) return "BindingIsNotAvailableException";
    return "BindingIsNotAvailableException: $message";
  }
}
