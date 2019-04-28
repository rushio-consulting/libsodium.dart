import 'dart:ffi';

import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/init.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256Str(
    Pointer<Uint8> password, int passwordLength) {
  final hashedPassword = allocate<Uint8>(
      count: bindings.pwHashScryptSalsa208Sha256StrBytesBindings());
  final result = bindings.pwHashScryptSalsa208Sha256StrBindings(
    hashedPassword,
    password,
    passwordLength,
    bindings.pwHashScryptSalsa208Sha256OpsLimitSensitiveBindings(),
    bindings.pwHashScryptSalsa208Sha256MemLimitSensitiveBindings(),
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
  final d = List<int>(bindings.pwHashScryptSalsa208Sha256StrBytesBindings());
  for (var i = 0;
      i < bindings.pwHashScryptSalsa208Sha256StrBytesBindings();
      i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _data.free();
  return d;
}

int cryptoPwhashScryptsalsa208sha256StrVerify(
        Pointer<Uint8> str, Pointer<Uint8> password, int passwordLength) =>
    bindings.pwHashScryptSalsa208Sha256StrVerifyBindings(
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
