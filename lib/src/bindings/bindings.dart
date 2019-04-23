import 'dart:ffi';

import '../ffi/dylib_utils.dart';

import 'signatures.dart';

class SodiumBindings {
  DynamicLibrary sodium;

  int Function() sodium_init;

  void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length)
      crypto_hash_sha256;
  void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length)
      crypto_hash_sha512;

  int Function() crypto_hash_sha256_bytes;
  int Function() crypto_hash_sha512_bytes;

  int Function() crypto_box_seedbytes;

  int Function() crypto_pwhash_scryptsalsa208sha256_saltbytes;

  void Function(Pointer<Uint8> salt, int sizeOfSalt) randombytes_buf;

  int Function() crypto_pwhash_scryptsalsa208sha256_opslimit_interactive;

  int Function() crypto_pwhash_scryptsalsa208sha256_memlimit_interactive;

  int Function(
    Pointer<Uint8> key,
    int sizeOfKey,
    Pointer<Uint8> password,
    int passwordLength,
    Pointer<Uint8> salt,
    int opsLimitInteractive,
    int memeLimitInteractive,
  ) crypto_pwhash_scryptsalsa208sha256;

  int Function() crypto_pwhash_scryptsalsa208sha256_strbytes;

  int Function() crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive;

  int Function() crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive;

  int Function(
    Pointer<Uint8> out,
    Pointer<Uint8> password,
    int passwordLength,
    int opLimitSensitive,
    int memLimitSensitive,
  ) crypto_pwhash_scryptsalsa208sha256_str;

  int Function(Pointer<Uint8> str, Pointer<Uint8> password, int passwordLength)
      crypto_pwhash_scryptsalsa208sha256_str_verify;

  SodiumBindings({String path = './'}) {
    sodium = dlopenPlatformSpecific('sodium', path: path);
    sodium_init = sodium
        .lookup<NativeFunction<sodium_init_t>>('sodium_init')
        .asFunction();
    crypto_hash_sha256 = sodium
        .lookup<NativeFunction<crypto_hash_sha256_t>>('crypto_hash_sha256')
        .asFunction();
    crypto_hash_sha512 = sodium
        .lookup<NativeFunction<crypto_hash_sha512_t>>('crypto_hash_sha512')
        .asFunction();
    crypto_hash_sha512_bytes = sodium
        .lookup<NativeFunction<crypto_hash_sha512_bytes_t>>(
            'crypto_hash_sha512_bytes')
        .asFunction();
    crypto_hash_sha256_bytes = sodium
        .lookup<NativeFunction<crypto_hash_sha256_bytes_t>>(
            'crypto_hash_sha256_bytes')
        .asFunction();
    crypto_box_seedbytes = sodium
        .lookup<NativeFunction<crypto_box_seedbytes_t>>('crypto_box_seedbytes')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_saltbytes = sodium
        .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_saltbytes_t>>(
            'crypto_pwhash_scryptsalsa208sha256_saltbytes')
        .asFunction();
    randombytes_buf = sodium
        .lookup<NativeFunction<randombytes_buf_t>>('randombytes_buf')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_opslimit_interactive = sodium
        .lookup<
                NativeFunction<
                    crypto_pwhash_scryptsalsa208sha256_opslimit_interactive_t>>(
            'crypto_pwhash_scryptsalsa208sha256_opslimit_interactive')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_memlimit_interactive = sodium
        .lookup<
                NativeFunction<
                    crypto_pwhash_scryptsalsa208sha256_memlimit_interactive_t>>(
            'crypto_pwhash_scryptsalsa208sha256_memlimit_interactive')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256 = sodium
        .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_t>>(
            'crypto_pwhash_scryptsalsa208sha256')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_strbytes = sodium
        .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_strbytes_t>>(
            'crypto_pwhash_scryptsalsa208sha256_strbytes')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive = sodium
        .lookup<
                NativeFunction<
                    crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive_t>>(
            'crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive = sodium
        .lookup<
                NativeFunction<
                    crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive_t>>(
            'crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_str = sodium
        .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_str_t>>(
            'crypto_pwhash_scryptsalsa208sha256_str')
        .asFunction();
    crypto_pwhash_scryptsalsa208sha256_str_verify = sodium
        .lookup<
                NativeFunction<
                    crypto_pwhash_scryptsalsa208sha256_str_verify_t>>(
            'crypto_pwhash_scryptsalsa208sha256_str_verify')
        .asFunction();
  }
}
