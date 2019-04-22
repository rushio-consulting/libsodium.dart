import 'dart:ffi';

import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/generate_salt.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256(String password,
    {Pointer<Uint8> salt}) {
  final key = allocate<Uint8>(count: bindings.crypto_box_seedbytes());
  if (salt == null) {
    salt =
        generateSalt(bindings.crypto_pwhash_scryptsalsa208sha256_saltbytes());
  }
  final cStringPassword = CString.fromUtf8(password);
  bindings.crypto_pwhash_scryptsalsa208sha256(
    key,
    bindings.crypto_box_seedbytes(),
    cStringPassword.ptr,
    cStringPassword.length,
    salt,
    bindings.crypto_pwhash_scryptsalsa208sha256_opslimit_interactive(),
    bindings.crypto_pwhash_scryptsalsa208sha256_memlimit_interactive(),
  );
  cStringPassword.ptr.free();
  return key;
}

List<int> scryptKeyDerivation(String password, {List<int> salt}) {
  Pointer<Uint8> _salt;
  if (salt != null) {
    _salt = allocate<Uint8>(count: salt.length);
    for (var i = 0; i < salt.length; i++) {
      _salt.elementAt(i).store(salt[i]);
    }
  }
  final _data = cryptoPwhashScryptsalsa208sha256(password, salt: _salt);
  final d = List<int>(bindings.crypto_box_seedbytes());
  for (var i = 0; i < bindings.crypto_box_seedbytes(); i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _salt?.free();
  _data.free();
  return d;
}
