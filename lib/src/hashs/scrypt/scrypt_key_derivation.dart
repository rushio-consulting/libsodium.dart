import 'dart:ffi';

import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/native_random_bytes_buf.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256(
    Pointer<Uint8> password, int passwordLength,
    {Pointer<Uint8> salt}) {
  final key = allocate<Uint8>(count: bindings.boxSeedBytesBindings());
  Pointer<Uint8> _salt;
  if (salt == null) {
    _salt = nativeRandomBytesBuf(
        bindings.pwHashScryptSalsa208Sha256SaltBytesBindings());
  }
  bindings.pwHashScryptSalsa208Sha256Bindings(
    key,
    bindings.boxSeedBytesBindings(),
    password,
    passwordLength,
    salt ?? _salt,
    bindings.pwHashScryptSalsa208Sha256OpsLimitInteractiveBindings(),
    bindings.pwHashScryptSalsa208Sha256MemLimitInteractiveBindings(),
  );
  _salt?.free();
  return key;
}

List<int> scryptKeyDerivation(List<int> password, {List<int> salt}) {
  if (salt.length != bindings.pwHashScryptSalsa208Sha256SaltBytesBindings()) {
    throw ArgumentError(
        'salt length must be equal to ${bindings.pwHashScryptSalsa208Sha256SaltBytesBindings()}');
  }
  Pointer<Uint8> _salt;
  if (salt != null) {
    _salt = allocate<Uint8>(count: salt.length);
    for (var i = 0; i < salt.length; i++) {
      _salt.elementAt(i).store(salt[i]);
    }
  }
  final _password = Uint8CArray.from(password);
  final _data = cryptoPwhashScryptsalsa208sha256(
      _password.ptr, _password.length,
      salt: _salt);
  final d = List<int>(bindings.boxSeedBytesBindings());
  for (var i = 0; i < bindings.boxSeedBytesBindings(); i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _salt?.free();
  _data.free();
  _password.ptr.free();
  return d;
}
