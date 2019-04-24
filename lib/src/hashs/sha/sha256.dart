import 'dart:ffi';

import 'package:libsodium/src/ffi/byte_array.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';

Pointer<Uint8> nativeCryptoHashSha256(Pointer<Uint8> bytes, int length) =>
    shaBase(bytes, length, bindings.crypto_hash_sha256_bytes(),
        bindings.crypto_hash_sha256);

List<int> cryptoHashSha256(List<int> codeUnits) {
  var byteArray = ByteArray<Uint8>.fromCodeUnits(codeUnits);
  final out = nativeCryptoHashSha256(byteArray.ptr, codeUnits.length);
  byteArray.ptr.free();
  byteArray = ByteArray<Uint8>(out, bindings.crypto_hash_sha256_bytes());
  final bytes = byteArray.bytes;
  byteArray.ptr.free();
  out.free();
  return bytes;
}

class Sha256 {
  Digest convert(List<int> bytes) => Digest(cryptoHashSha256(bytes));
}
