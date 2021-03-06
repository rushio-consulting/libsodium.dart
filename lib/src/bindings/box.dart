import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';

typedef BoxSeedBytesSignature = int Function();
typedef NativeBoxSeedBytesSignature = Uint8 Function();

class BoxSeedBytesBindings extends Bindings<BoxSeedBytesSignature> {
  BoxSeedBytesBindings(DynamicLibrary sodium) : super('crypto_box_seedbytes') {
    try {
      f = sodium.lookupFunction<NativeBoxSeedBytesSignature,
          BoxSeedBytesSignature>(functionName);
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}
