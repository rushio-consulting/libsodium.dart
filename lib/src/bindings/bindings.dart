import 'dart:io';

import 'package:meta/meta.dart';

abstract class Bindings<DartSignature extends Function> {
  final String functionName;

  DartSignature f;

  Bindings(this.functionName);

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
