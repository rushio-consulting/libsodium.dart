import 'dart:ffi';

import 'package:libsodium/src/ffi/byte_array.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';

Pointer<Uint8> nativeCryptoHashSha512(Pointer<Uint8> bytes, int length) =>
    shaBase(bytes, length, bindings.crypto_hash_sha512_bytes(),
        bindings.crypto_hash_sha512);

List<int> cryptoHashSha512(List<int> codeUnits) {
  var bytesArray = ByteArray.fromCodeUnits(codeUnits);
  final out = nativeCryptoHashSha512(bytesArray.ptr, codeUnits.length);
  bytesArray.ptr.free();
  bytesArray = ByteArray(out, bindings.crypto_hash_sha512_bytes());
  final bytes = bytesArray.bytes;
  bytesArray.ptr.free();
  out.free();
  return bytes;
}

class Sha512 {
  Digest convert(List<int> bytes) => Digest(cryptoHashSha512(bytes));
}
