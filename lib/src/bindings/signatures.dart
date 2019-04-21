import 'dart:ffi';

typedef sodium_init_t = Int32 Function();

typedef crypto_hash_sha256_t = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Int32 messageLength);

typedef crypto_hash_sha512_t = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Int32 messageLength);
