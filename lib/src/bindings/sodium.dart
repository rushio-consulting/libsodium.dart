import 'dart:ffi';

import 'package:libsodium/src/bindings/box.dart';
import 'package:libsodium/src/bindings/hash.dart';
import 'package:libsodium/src/bindings/pw_hash.dart';
import 'package:libsodium/src/bindings/secret_box.dart';
import 'package:libsodium/src/bindings/sodium_init.dart';
import 'package:libsodium/src/bindings/utils.dart';
import 'package:libsodium/src/ffi/dylib_utils.dart';

class SodiumBindings {
  DynamicLibrary sodium;

  SodiumInitBindings sodiumInit;

  //  utils bindings
  RandomBytesBufferBindings randomBytesBufferBindings;

  //  secret box bindings
  SecretBoxMacBytesBindings secretBoxMacBytesBindings;
  SecretBoxNonceBytesBindings secretBoxNonceBytesBindings;
  SecretBoxKeyBytesBindings secretBoxKeyBytesBindings;
  SecretBoxKeyGenBindings secretBoxKeyGenBindings;
  SecretBoxEasyBindings secretBoxEasyBindings;
  SecretBoxOpenEasyBindings secretBoxOpenEasyBindings;

  //  hash bindings
  Sha256BytesBindings sha256bytesBindings;
  Sha256Bindings sha256bindings;
  Sha512BytesBindings sha512bytesBindings;
  Sha512Bindings sha512bindings;

  //  box bindings
  BoxSeedBytesBindings boxSeedBytesBindings;

  //  pwhash bindings
  PwHashScryptSalsa208Sha256SaltBytesBindings
      pwHashScryptSalsa208Sha256SaltBytesBindings;
  PwHashScryptSalsa208Sha256OpsLimitInteractiveBindings
      pwHashScryptSalsa208Sha256OpsLimitInteractiveBindings;
  PwHashScryptSalsa208Sha256MemLimitInteractiveBindings
      pwHashScryptSalsa208Sha256MemLimitInteractiveBindings;
  PwHashScryptSalsa208Sha256OpsLimitSensitiveBindings
      pwHashScryptSalsa208Sha256OpsLimitSensitiveBindings;
  PwHashScryptSalsa208Sha256MemLimitSensitiveBindings
      pwHashScryptSalsa208Sha256MemLimitSensitiveBindings;
  PwHashScryptSalsa208Sha256Bindings pwHashScryptSalsa208Sha256Bindings;
  PwHashScryptSalsa208Sha256StrBytesBindings
      pwHashScryptSalsa208Sha256StrBytesBindings;
  PwHashScryptSalsa208Sha256StrBindings pwHashScryptSalsa208Sha256StrBindings;
  PwHashScryptSalsa208Sha256StrVerifyBindings
      pwHashScryptSalsa208Sha256StrVerifyBindings;

  SodiumBindings({String path = './'}) {
    sodium = dlopenPlatformSpecific('sodium', path: path);

    sodiumInit = SodiumInitBindings(sodium);

    //  utils
    randomBytesBufferBindings = RandomBytesBufferBindings(sodium);

    //  secret box
    secretBoxMacBytesBindings = SecretBoxMacBytesBindings(sodium);
    secretBoxNonceBytesBindings = SecretBoxNonceBytesBindings(sodium);
    secretBoxKeyBytesBindings = SecretBoxKeyBytesBindings(sodium);
    secretBoxKeyGenBindings = SecretBoxKeyGenBindings(sodium);
    secretBoxEasyBindings = SecretBoxEasyBindings(sodium);
    secretBoxOpenEasyBindings = SecretBoxOpenEasyBindings(sodium);

    //  hash
    sha256bytesBindings = Sha256BytesBindings(sodium);
    sha256bindings = Sha256Bindings(sodium);
    sha512bytesBindings = Sha512BytesBindings(sodium);
    sha512bindings = Sha512Bindings(sodium);

    //  box
    boxSeedBytesBindings = BoxSeedBytesBindings(sodium);

    //  pwhash
    pwHashScryptSalsa208Sha256SaltBytesBindings =
        PwHashScryptSalsa208Sha256SaltBytesBindings(sodium);
    pwHashScryptSalsa208Sha256OpsLimitInteractiveBindings =
        PwHashScryptSalsa208Sha256OpsLimitInteractiveBindings(sodium);
    pwHashScryptSalsa208Sha256MemLimitInteractiveBindings =
        PwHashScryptSalsa208Sha256MemLimitInteractiveBindings(sodium);
    pwHashScryptSalsa208Sha256OpsLimitSensitiveBindings =
        PwHashScryptSalsa208Sha256OpsLimitSensitiveBindings(sodium);
    pwHashScryptSalsa208Sha256MemLimitSensitiveBindings =
        PwHashScryptSalsa208Sha256MemLimitSensitiveBindings(sodium);
    pwHashScryptSalsa208Sha256Bindings =
        PwHashScryptSalsa208Sha256Bindings(sodium);
    pwHashScryptSalsa208Sha256StrBytesBindings =
        PwHashScryptSalsa208Sha256StrBytesBindings(sodium);
    pwHashScryptSalsa208Sha256StrBindings =
        PwHashScryptSalsa208Sha256StrBindings(sodium);
    pwHashScryptSalsa208Sha256StrVerifyBindings =
        PwHashScryptSalsa208Sha256StrVerifyBindings(sodium);
  }
}
