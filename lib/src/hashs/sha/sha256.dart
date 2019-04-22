import 'dart:ffi';

import 'package:convert/convert.dart';
import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';

Pointer<Uint8> nativeCryptoHashSha256(Pointer<Uint8> cString, int length) =>
    shaBase(cString, length, bindings.crypto_hash_sha256_bytes(),
        bindings.crypto_hash_sha256);

String cryptoHashSha256(List<int> codeUnits) {
  var cString = CString.fromCodeUnits(codeUnits);
  final out = nativeCryptoHashSha256(cString.ptr, codeUnits.length);
  cString.ptr.free();
  cString = CString(out, length: bindings.crypto_hash_sha256_bytes());
  final _data = hex.encode(cString.codeUnits);
  cString.ptr.free();
  out.free();
  return _data;
}
