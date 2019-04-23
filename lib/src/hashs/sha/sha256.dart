import 'dart:ffi';

import 'package:libsodium/src/ffi/cstring.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';
import 'package:meta/meta.dart';

@visibleForTesting
Pointer<Uint8> nativeCryptoHashSha256(Pointer<Uint8> cString, int length) =>
    shaBase(cString, length, bindings.crypto_hash_sha256_bytes(),
        bindings.crypto_hash_sha256);

@visibleForTesting
List<int> cryptoHashSha256(List<int> codeUnits) {
  var cString = CString.fromCodeUnits(codeUnits);
  final out = nativeCryptoHashSha256(cString.ptr, codeUnits.length);
  cString.ptr.free();
  cString = CString(out, length: bindings.crypto_hash_sha256_bytes());
  final bytes = cString.codeUnits;
  cString.ptr.free();
  out.free();
  return bytes;
}

final sha256 = Sha256._();

class Sha256 {
  Sha256._();

  Sha256 newIntance() => Sha256._();

  Digest convert(List<int> bytes) => Digest(cryptoHashSha256(bytes));
}
