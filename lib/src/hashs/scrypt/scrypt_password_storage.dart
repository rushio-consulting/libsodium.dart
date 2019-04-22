import 'dart:ffi';

import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/init.dart';

Pointer<Uint8> cryptoPwhashScryptsalsa208sha256Str(String password) {
  final hashedPassword =
      allocate<Uint8>(count: bindings.crypto_box_seedbytes());
  final cStringPassword = CString.fromUtf8(password);
  final result = bindings.crypto_pwhash_scryptsalsa208sha256_str(
    hashedPassword,
    cStringPassword.ptr,
    cStringPassword.length,
    bindings.crypto_pwhash_scryptsalsa208sha256_opslimit_sensitive(),
    bindings.crypto_pwhash_scryptsalsa208sha256_memlimit_sensitive(),
  );
  cStringPassword.ptr.free();
  if (result != 0) {
    return null;
  }
  return hashedPassword;
}

List<int> scryptPasswordStorage(String password) {
  final _data = cryptoPwhashScryptsalsa208sha256Str(password);
  if (_data == null) {
    return null;
  }
  final d = List<int>(bindings.crypto_box_seedbytes());
  for (var i = 0; i < bindings.crypto_box_seedbytes(); i++) {
    d[i] = _data.elementAt(i).load<int>();
  }
  _data.free();
  return d;
}
