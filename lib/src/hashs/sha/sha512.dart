import 'dart:ffi';

import 'package:convert/convert.dart';
import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';

Pointer<Uint8> nativeCryptoHashSha512(Pointer<Uint8> cString, int length) =>
    shaBase(cString, length, bindings.crypto_hash_sha512_bytes(),
        bindings.crypto_hash_sha512);

String cryptoHashSha512(List<int> codeUnits) {
  var cString = CString.fromCodeUnits(codeUnits);
  final out = nativeCryptoHashSha512(cString.ptr, codeUnits.length);
  cString.ptr.free();
  cString = CString(out, length: bindings.crypto_hash_sha512_bytes());
  final _data = hex.encode(cString.codeUnits);
  cString.ptr.free();
  out.free();
  return _data;
}
