import 'dart:ffi';

import 'bindings.dart';

int Function() crypto_hash_sha256_bytes;
int Function() crypto_hash_sha512_bytes;

typedef Sha256BytesSignature = int Function();
typedef NativeSha256BytesSignature = Uint8 Function();

class Sha256BytesBindings extends Bindings<Sha256BytesSignature> {
  Sha256BytesBindings(DynamicLibrary sodium)
      : super('crypto_hash_sha256_bytes') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSha256BytesSignature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef Sha512BytesSignature = int Function();
typedef NativeSha512BytesSignature = Uint8 Function();

class Sha512BytesBindings extends Bindings<Sha512BytesSignature> {
  Sha512BytesBindings(DynamicLibrary sodium)
      : super('crypto_hash_sha512_bytes') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSha512BytesSignature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef Sha256Signature = void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, int length);
typedef NativeSha256Signature = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Uint32 length);

class Sha256Bindings extends Bindings<Sha256Signature> {
  Sha256Bindings(DynamicLibrary sodium) : super('crypto_hash_sha256') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSha256Signature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  void call(Pointer<Uint8> out, Pointer<Uint8> message, int length) {
    checkAvailability();
    return f(out, message, length);
  }
}

typedef Sha512Signature = void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, int length);
typedef NativeSha512Signature = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Uint32 length);

class Sha512Bindings extends Bindings<Sha512Signature> {
  Sha512Bindings(DynamicLibrary sodium) : super('crypto_hash_sha512') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSha512Signature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  void call(Pointer<Uint8> out, Pointer<Uint8> message, int length) {
    checkAvailability();
    return f(out, message, length);
  }
}
