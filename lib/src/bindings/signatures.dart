import 'dart:ffi';

typedef sodium_init_t = Int32 Function();

typedef crypto_hash_sha256_t = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Int32 messageLength);

typedef crypto_hash_sha512_t = Void Function(
    Pointer<Uint8> out, Pointer<Uint8> message, Int32 messageLength);

typedef crypto_hash_sha512_bytes_t = Uint64 Function();

typedef crypto_hash_sha256_bytes_t = Uint64 Function();

typedef crypto_box_seedbytes_t = Uint64 Function();

typedef crypto_pwhash_scryptsalsa208sha256_saltbytes_t = Uint64 Function();

typedef randombytes_buf_t = Void Function(
    Pointer<Uint8> salt, Uint8 sizeOfSalt);

typedef crypto_pwhash_scryptsalsa208sha256_opslimit_interactive_t = Uint64
    Function();

typedef crypto_pwhash_scryptsalsa208sha256_memlimit_interactive_t = Uint64
    Function();

typedef crypto_pwhash_scryptsalsa208sha256_t = Uint8 Function(
  Pointer<Uint8> key,
  Uint8 sizeOfKey,
  Pointer<Uint8> password,
  Uint64 passwordLength,
  Pointer<Uint8> salt,
  Uint64 opsLimitInteractive,
  Uint64 memLimitInteractive,
);

typedef crypto_pwhash_scryptsalsa208sha256_strbytes_t = Uint64 Function();

typedef crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive_t = Uint64
    Function();

typedef crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive_t = Uint64
    Function();

typedef crypto_pwhash_scryptsalsa208sha256_str_t = Int64 Function(
  Pointer<Uint8> out,
  Pointer<Uint8> password,
  Uint64 passwordLength,
  Uint64 opLimitSensitive,
  Uint64 memLimitSensitive,
);
