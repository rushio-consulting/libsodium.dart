import 'dart:ffi';

import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/generate_salt.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256(
    Pointer<Uint8> password, int passwordLength,
    {Pointer<Uint8> salt}) {
  final key = allocate<Uint8>(count: bindings.crypto_box_seedbytes());
  Pointer<Uint8> _salt;
  if (salt == null) {
    _salt = nativeGenerateSalt(
        bindings.crypto_pwhash_scryptsalsa208sha256_saltbytes());
  }
  bindings.crypto_pwhash_scryptsalsa208sha256(
    key,
    bindings.crypto_box_seedbytes(),
    password,
    passwordLength,
    salt ?? _salt,
    bindings.crypto_pwhash_scryptsalsa208sha256_opslimit_interactive(),
    bindings.crypto_pwhash_scryptsalsa208sha256_memlimit_interactive(),
  );
  _salt?.free();
  return key;
}

List<int> scryptKeyDerivation(List<int> password, {List<int> salt}) {
  if (salt.length != bindings.crypto_pwhash_scryptsalsa208sha256_saltbytes()) {
    throw ArgumentError(
        'salt length must be equal to ${bindings.crypto_pwhash_scryptsalsa208sha256_saltbytes()}');
  }
  Pointer<Uint8> _salt;
  if (salt != null) {
    _salt = allocate<Uint8>(count: salt.length);
    for (var i = 0; i < salt.length; i++) {
      _salt.elementAt(i).store(salt[i]);
    }
  }
  final _password = CString.fromCodeUnits(password);
  final _data = cryptoPwhashScryptsalsa208sha256(
      _password.ptr, _password.codeUnits.length,
      salt: _salt);
  final d = List<int>(bindings.crypto_box_seedbytes());
  for (var i = 0; i < bindings.crypto_box_seedbytes(); i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _salt?.free();
  _data.free();
  _password.ptr.free();
  return d;
}
