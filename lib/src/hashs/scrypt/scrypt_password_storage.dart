import 'dart:ffi';

import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/init.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256Str(
    Pointer<Uint8> password, int passwordLength) {
  final hashedPassword = allocate<Uint8>(
      count: bindings.crypto_pwhash_scryptsalsa208sha256_strbytes());
  final result = bindings.crypto_pwhash_scryptsalsa208sha256_str(
    hashedPassword,
    password,
    passwordLength,
    bindings.crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive(),
    bindings.crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive(),
  );
  if (result != 0) {
    return null;
  }
  return hashedPassword;
}

List<int> scryptPasswordStorage(List<int> password) {
  final p = Uint8CArray.from(password);
  final _data = cryptoPwhashScryptsalsa208sha256Str(p.ptr, password.length);
  p.ptr.free();
  if (_data == null) {
    return null;
  }
  final d = List<int>(bindings.crypto_pwhash_scryptsalsa208sha256_strbytes());
  for (var i = 0;
      i < bindings.crypto_pwhash_scryptsalsa208sha256_strbytes();
      i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _data.free();
  return d;
}

int cryptoPwhashScryptsalsa208sha256StrVerify(
        Pointer<Uint8> str, Pointer<Uint8> password, int passwordLength) =>
    bindings.crypto_pwhash_scryptsalsa208sha256_str_verify(
        str, password, passwordLength);

int scryptPasswordStorageVerify(List<int> hashedPassword, List<int> password) {
  final cHashedPassword = Uint8CArray.from(hashedPassword);
  final cPassword = Uint8CArray.from(password);
  final result = cryptoPwhashScryptsalsa208sha256StrVerify(
      cHashedPassword.ptr, cPassword.ptr, password.length);
  cHashedPassword.ptr.free();
  cPassword.ptr.free();
  return result;
}
