import 'dart:ffi';

typedef int SodiumInitSignature();

// abstract class SodiumInitSignature {
//   int call();
// }

//  utils
typedef void RandomBytesBufferSignature(Pointer<Uint8> salt, int size);

//  secret box dart signature
typedef int SecretBoxMacBytesSignature();
typedef int SecretBoxNonceBytesSignature();
typedef int SecretBoxKeyBytesSignature();
typedef void SecretBoxKeyGenSignature(Pointer<Uint8> pointer);
typedef int SecretBoxEasySignature(
  Pointer<Uint8> cipherText,
  Pointer<Uint8> message,
  int messageLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);
typedef int SecretBoxOpenEasySignature(
  Pointer<Uint8> decrypted,
  Pointer<Uint8> cipherText,
  int cipherLength,
  Pointer<Uint8> nonce,
  Pointer<Uint8> key,
);
