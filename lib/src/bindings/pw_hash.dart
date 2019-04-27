import 'dart:ffi';

import 'package:libsodium/src/bindings/bindings.dart';

typedef PwHashScryptSalsa208Sha256SaltBytesSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256SaltBytesSignature = Uint8 Function();

class PwHashScryptSalsa208Sha256SaltBytesBindings
    extends Bindings<PwHashScryptSalsa208Sha256SaltBytesSignature> {
  PwHashScryptSalsa208Sha256SaltBytesBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_saltbytes') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256SaltBytesSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256OpsLimitInteractiveSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256OpsLimitInteractiveSignature = Uint8
    Function();

class PwHashScryptSalsa208Sha256OpsLimitInteractiveBindings
    extends Bindings<PwHashScryptSalsa208Sha256OpsLimitInteractiveSignature> {
  PwHashScryptSalsa208Sha256OpsLimitInteractiveBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_opslimit_interactive') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256OpsLimitInteractiveSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256MemLimitInteractiveSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256MemLimitInteractiveSignature = Uint8
    Function();

class PwHashScryptSalsa208Sha256MemLimitInteractiveBindings
    extends Bindings<PwHashScryptSalsa208Sha256MemLimitInteractiveSignature> {
  PwHashScryptSalsa208Sha256MemLimitInteractiveBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_memlimit_interactive') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256MemLimitInteractiveSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256OpsLimitSensitiveSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256OpsLimitSensitiveSignature = Uint8
    Function();

class PwHashScryptSalsa208Sha256OpsLimitSensitiveBindings
    extends Bindings<PwHashScryptSalsa208Sha256OpsLimitSensitiveSignature> {
  PwHashScryptSalsa208Sha256OpsLimitSensitiveBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256OpsLimitSensitiveSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256MemLimitSensitiveSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256MemLimitSensitiveSignature = Uint8
    Function();

class PwHashScryptSalsa208Sha256MemLimitSensitiveBindings
    extends Bindings<PwHashScryptSalsa208Sha256MemLimitSensitiveSignature> {
  PwHashScryptSalsa208Sha256MemLimitSensitiveBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256MemLimitSensitiveSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256Signature = int Function(
  Pointer<Uint8> key,
  int sizeOfKey,
  Pointer<Uint8> password,
  int passwordLength,
  Pointer<Uint8> salt,
  int opsLimitInteractive,
  int memLimitInteractive,
);
typedef NativePwHashScryptSalsa208Sha256Signature = Uint8 Function(
  Pointer<Uint8> key,
  Uint8 sizeOfKey,
  Pointer<Uint8> password,
  Uint32 passwordLength,
  Pointer<Uint8> salt,
  Uint8 opsLimitInteractive,
  Uint8 memLimitInteractive,
);

class PwHashScryptSalsa208Sha256Bindings
    extends Bindings<PwHashScryptSalsa208Sha256Signature> {
  PwHashScryptSalsa208Sha256Bindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256') {
    try {
      f = sodium
          .lookup<NativeFunction<NativePwHashScryptSalsa208Sha256Signature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call(
      Pointer<Uint8> key,
      int sizeOfKey,
      Pointer<Uint8> password,
      int passwordLength,
      Pointer<Uint8> salt,
      int opsLimitInteractive,
      int memLimitInteractive) {
    checkAvailability();
    return f(key, sizeOfKey, password, passwordLength, salt,
        opsLimitInteractive, memLimitInteractive);
  }
}

typedef PwHashScryptSalsa208Sha256StrBytesSignature = int Function();
typedef NativePwHashScryptSalsa208Sha256StrBytesSignature = Uint8 Function();

class PwHashScryptSalsa208Sha256StrBytesBindings
    extends Bindings<PwHashScryptSalsa208Sha256StrBytesSignature> {
  PwHashScryptSalsa208Sha256StrBytesBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_strbytes') {
    try {
      f = sodium
          .lookup<
                  NativeFunction<
                      NativePwHashScryptSalsa208Sha256StrBytesSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call() {
    checkAvailability();
    return f();
  }
}

typedef PwHashScryptSalsa208Sha256StrSignature = int Function(
  Pointer<Uint8> out,
  Pointer<Uint8> password,
  int passwordLength,
  int opsLimitSensitive,
  int memLimitSensitive,
);
typedef NativePwHashScryptSalsa208Sha256StrSignature = Uint8 Function(
  Pointer<Uint8> out,
  Pointer<Uint8> password,
  Uint32 passwordLength,
  Uint8 opsLimitSensitive,
  Uint8 memLimitSensitive,
);

class PwHashScryptSalsa208Sha256StrBindings
    extends Bindings<PwHashScryptSalsa208Sha256StrSignature> {
  PwHashScryptSalsa208Sha256StrBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_str') {
    try {
      f = sodium
          .lookup<NativeFunction<NativePwHashScryptSalsa208Sha256StrSignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call(Pointer<Uint8> out, Pointer<Uint8> password, int passwordLength,
      int opsLimitSensitive, int memLimitSensitive) {
    checkAvailability();
    return f(
        out, password, passwordLength, opsLimitSensitive, memLimitSensitive);
  }
}

typedef PwHashScryptSalsa208Sha256StrVerifySignature = int Function(
  Pointer<Uint8> str,
  Pointer<Uint8> password,
  int passwordLength,
);
typedef NativePwHashScryptSalsa208Sha256StrVerifySignature = Uint8 Function(
  Pointer<Uint8> str,
  Pointer<Uint8> password,
  Uint64 passwordLength,
);

class PwHashScryptSalsa208Sha256StrVerifyBindings
    extends Bindings<PwHashScryptSalsa208Sha256StrVerifySignature> {
  PwHashScryptSalsa208Sha256StrVerifyBindings(DynamicLibrary sodium)
      : super('crypto_pwhash_scryptsalsa208sha256_str_verify') {
    try {
      f = sodium
          .lookup<NativeFunction<NativePwHashScryptSalsa208Sha256StrVerifySignature>>(
              functionName)
          .asFunction();
    } catch (_) {}
  }

  int call(Pointer<Uint8> str, Pointer<Uint8> password, int passwordLength) {
    checkAvailability();
    return f(str, password, passwordLength);
  }
}
