// import 'dart:ffi';

// import 'package:libsodium/src/bindings/bindings.dart';
// import 'package:libsodium/src/signatures/dart/dart_signatures.dart';
// import 'package:libsodium/src/signatures/natives/native_signatures.dart';

// class SecretBoxMacBytesBindings extends Bindings<SecretBoxMacBytesSignature,
//     NativeSecretBoxMacBytesSignature> {
//   SecretBoxMacBytesBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_macbytes');

//   int call() => f();
// }

// class SecretBoxNonceBytesBindings extends Bindings<SecretBoxNonceBytesSignature,
//     NativeSecretBoxNonceBytesSignature> {
//   SecretBoxNonceBytesBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_noncebytes');

//   int call() => f();
// }

// class SecretBoxKeyBytesBindings extends Bindings<SecretBoxKeyBytesSignature,
//     NativeSecretBoxKeyBytesSignature> {
//   SecretBoxKeyBytesBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_keybytes');

//   int call() => f();
// }

// class SecretBoxKeyGenBindings
//     extends Bindings<SecretBoxKeyGenSignature, NativeSecretBoxKeyGenSignature> {
//   SecretBoxKeyGenBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_keygen');

//   void call(Pointer<Uint8> pointer) => f(pointer);
// }

// class SecretBoxEasyBindings
//     extends Bindings<SecretBoxEasySignature, NativeSecretBoxEasySignature> {
//   SecretBoxEasyBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_easy');

//   void call(Pointer<Uint8> cipherText, Pointer<Uint8> message,
//           int messageLength, Pointer<Uint8> nonce, Pointer<Uint8> key) =>
//       f(cipherText, message, messageLength, nonce, key);
// }

// class SecretBoxOpenEasyBindings extends Bindings<SecretBoxOpenEasySignature,
//     NativeSecretBoxOpenEasySignature> {
//   SecretBoxOpenEasyBindings(DynamicLibrary sodium)
//       : super(sodium, 'crypto_secretbox_open_easy');

//   int call(Pointer<Uint8> decrypted, Pointer<Uint8> cipherText,
//           int cipherLength, Pointer<Uint8> nonce, Pointer<Uint8> key) =>
//       f(decrypted, cipherText, cipherLength, nonce, key);
// }
