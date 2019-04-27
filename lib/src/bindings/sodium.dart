import 'dart:ffi';

import 'package:libsodium/src/bindings/secret_box.dart';
import 'package:libsodium/src/bindings/sodium_init.dart';
import 'package:libsodium/src/bindings/utils.dart';
import 'package:libsodium/src/ffi/dylib_utils.dart';

class SodiumBindings {
  DynamicLibrary sodium;

  SodiumInitBindings sodiumInit;

  //  utils
  // RandomBytesBufferBindings randomBytesBufferBindings;

  //  secret box bindings
  // SecretBoxMacBytesBindings secretBoxMacBytesBindings;
  // SecretBoxNonceBytesBindings secretBoxNonceBytesBindings;
  // SecretBoxKeyBytesBindings secretBoxKeyBytesBindings;
  // SecretBoxKeyGenBindings secretBoxKeyGenBindings;
  // SecretBoxEasyBindings secretBoxEasyBindings;
  // SecretBoxOpenEasyBindings secretBoxOpenEasyBindings;

  // void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length)
  //     crypto_hash_sha256;
  // void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length)
  //     crypto_hash_sha512;

  // int Function() crypto_hash_sha256_bytes;
  // int Function() crypto_hash_sha512_bytes;

  // int Function() crypto_box_seedbytes;

  // int Function() crypto_pwhash_scryptsalsa208sha256_saltbytes;

  // void Function(Pointer<Uint8> salt, int sizeOfSalt) randombytes_buf;

  // int Function() crypto_pwhash_scryptsalsa208sha256_opslimit_interactive;

  // int Function() crypto_pwhash_scryptsalsa208sha256_memlimit_interactive;

  // int Function(
  //   Pointer<Uint8> key,
  //   int sizeOfKey,
  //   Pointer<Uint8> password,
  //   int passwordLength,
  //   Pointer<Uint8> salt,
  //   int opsLimitInteractive,
  //   int memeLimitInteractive,
  // ) crypto_pwhash_scryptsalsa208sha256;

  // int Function() crypto_pwhash_scryptsalsa208sha256_strbytes;

  // int Function() crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive;

  // int Function() crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive;

  // int Function(
  //   Pointer<Uint8> out,
  //   Pointer<Uint8> password,
  //   int passwordLength,
  //   int opLimitSensitive,
  //   int memLimitSensitive,
  // ) crypto_pwhash_scryptsalsa208sha256_str;

  // int Function(Pointer<Uint8> str, Pointer<Uint8> password, int passwordLength)
  //     crypto_pwhash_scryptsalsa208sha256_str_verify;

  SodiumBindings({String path = './'}) {
    sodium = dlopenPlatformSpecific('sodium', path: path);

    sodiumInit = SodiumInitBindings(sodium);

    //  utils
    // randomBytesBufferBindings = RandomBytesBufferBindings(sodium);

    //  secret box
    // secretBoxMacBytesBindings = SecretBoxMacBytesBindings(sodium);
    // secretBoxNonceBytesBindings = SecretBoxNonceBytesBindings(sodium);
    // secretBoxKeyBytesBindings = SecretBoxKeyBytesBindings(sodium);
    // secretBoxKeyGenBindings = SecretBoxKeyGenBindings(sodium);
    // secretBoxEasyBindings = SecretBoxEasyBindings(sodium);
    // secretBoxOpenEasyBindings = SecretBoxOpenEasyBindings(sodium);

    // crypto_hash_sha256 = sodium
    //     .lookup<NativeFunction<crypto_hash_sha256_t>>('crypto_hash_sha256')
    //     .asFunction();
    // crypto_hash_sha512 = sodium
    //     .lookup<NativeFunction<crypto_hash_sha512_t>>('crypto_hash_sha512')
    //     .asFunction();
    // crypto_hash_sha512_bytes = sodium
    //     .lookup<NativeFunction<crypto_hash_sha512_bytes_t>>(
    //         'crypto_hash_sha512_bytes')
    //     .asFunction();
    // crypto_hash_sha256_bytes = sodium
    //     .lookup<NativeFunction<crypto_hash_sha256_bytes_t>>(
    //         'crypto_hash_sha256_bytes')
    //     .asFunction();
    // crypto_box_seedbytes = sodium
    //     .lookup<NativeFunction<crypto_box_seedbytes_t>>('crypto_box_seedbytes')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_saltbytes = sodium
    //     .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_saltbytes_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_saltbytes')
    //     .asFunction();
    // randombytes_buf = sodium
    //     .lookup<NativeFunction<randombytes_buf_t>>('randombytes_buf')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_opslimit_interactive = sodium
    //     .lookup<
    //             NativeFunction<
    //                 crypto_pwhash_scryptsalsa208sha256_opslimit_interactive_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_opslimit_interactive')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_memlimit_interactive = sodium
    //     .lookup<
    //             NativeFunction<
    //                 crypto_pwhash_scryptsalsa208sha256_memlimit_interactive_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_memlimit_interactive')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256 = sodium
    //     .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_strbytes = sodium
    //     .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_strbytes_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_strbytes')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive = sodium
    //     .lookup<
    //             NativeFunction<
    //                 crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive = sodium
    //     .lookup<
    //             NativeFunction<
    //                 crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_str = sodium
    //     .lookup<NativeFunction<crypto_pwhash_scryptsalsa208sha256_str_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_str')
    //     .asFunction();
    // crypto_pwhash_scryptsalsa208sha256_str_verify = sodium
    //     .lookup<
    //             NativeFunction<
    //                 crypto_pwhash_scryptsalsa208sha256_str_verify_t>>(
    //         'crypto_pwhash_scryptsalsa208sha256_str_verify')
    //     .asFunction();

    // crypto_secretbox_macbytes = sodium
    //     .lookup<NativeFunction<crypto_secretbox_macbytes_t>>(
    //         'crypto_secretbox_macbytes')
    //     .asFunction();
    // crypto_secretbox_noncebytes = sodium
    //     .lookup<NativeFunction<crypto_secretbox_noncebytes_t>>(
    //         'crypto_secretbox_noncebytes')
    //     .asFunction();
    // crypto_secretbox_keybytes = sodium
    //     .lookup<NativeFunction<crypto_secretbox_keybytes_t>>(
    //         'crypto_secretbox_keybytes')
    //     .asFunction();
    // crypto_secretbox_keygen = sodium
    //     .lookup<NativeFunction<crypto_secretbox_keygen_t>>(
    //         'crypto_secretbox_keygen')
    //     .asFunction();
    // crypto_secretbox_easy = sodium
    //     .lookup<NativeFunction<crypto_secretbox_easy_t>>(
    //         'crypto_secretbox_easy')
    //     .asFunction();
    // crypto_secretbox_open_easy = sodium
    //     .lookup<NativeFunction<crypto_secretbox_open_easy_t>>(
    //         'crypto_secretbox_open_easy')
    //     .asFunction();
  }
}
