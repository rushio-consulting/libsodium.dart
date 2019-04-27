import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';

typedef SecretBoxMacBytesSignature = int Function();
typedef NativeSecretBoxMacBytesSignature = Int32 Function();

class SecretBoxMacBytesBindings extends Bindings<SecretBoxMacBytesSignature> {
  SecretBoxMacBytesBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_macbytes') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxMacBytesSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef SecretBoxNonceBytesSignature = int Function();
typedef NativeSecretBoxNonceBytesSignature = Int32 Function();

class SecretBoxNonceBytesBindings
    extends Bindings<SecretBoxNonceBytesSignature> {
  SecretBoxNonceBytesBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_noncebytes') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxNonceBytesSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef SecretBoxKeyBytesSignature = int Function();
typedef NativeSecretBoxKeyBytesSignature = Int32 Function();

class SecretBoxKeyBytesBindings extends Bindings<SecretBoxKeyBytesSignature> {
  SecretBoxKeyBytesBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_keybytes') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxKeyBytesSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef SecretBoxKeyGenSignature = void Function(Pointer<Uint8> pointer);
typedef NativeSecretBoxKeyGenSignature = Void Function(Pointer<Uint8> key);

class SecretBoxKeyGenBindings extends Bindings<SecretBoxKeyGenSignature> {
  SecretBoxKeyGenBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_keygen') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxKeyGenSignature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  void call(Pointer<Uint8> pointer) {
    checkAvailability();
    return f(pointer);
  }
}

typedef SecretBoxEasySignature = int Function(
  Pointer<Uint8> cipherText,
  Pointer<Uint8> message,
  int messageLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);
typedef NativeSecretBoxEasySignature = Int32 Function(
  Pointer<Uint8> cipherText,
  Pointer<Uint8> message,
  Uint32 messageLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);

class SecretBoxEasyBindings extends Bindings<SecretBoxEasySignature> {
  SecretBoxEasyBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_easy') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxEasySignature>>(functionName)
          .asFunction();
    } catch (_) {}
  }

  int call(Pointer<Uint8> cipherText, Pointer<Uint8> message, int messageLength,
      Pointer<Uint8> nonce, Pointer<Uint8> key) {
    checkAvailability();
    return f(cipherText, message, messageLength, nonce, key);
  }
}

typedef SecretBoxOpenEasySignature = int Function(
  Pointer<Uint8> decrypted,
  Pointer<Uint8> cipherText,
  int cipherLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);
typedef NativeSecretBoxOpenEasySignature = Int32 Function(
  Pointer<Uint8> decrypted,
  Pointer<Uint8> cipherText,
  Uint32 cipherLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);

class SecretBoxOpenEasyBindings extends Bindings<SecretBoxOpenEasySignature> {
  SecretBoxOpenEasyBindings(DynamicLibrary sodium)
      : super('crypto_secretbox_open_easy') {
    try {
      f = sodium
          .lookup<NativeFunction<NativeSecretBoxOpenEasySignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call(Pointer<Uint8> decrypted, Pointer<Uint8> cipherText,
      int cipherLength, Pointer<Uint8> nonce, Pointer<Uint8> key) {
    checkAvailability();
    return f(decrypted, cipherText, cipherLength, nonce, key);
  }
}
