import 'dart:ffi';

import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/hashs/sha/base.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';

Pointer<Uint8> nativeCryptoHashSha512(Pointer<Uint8> bytes, int length) =>
    shaBase(
        bytes, length, bindings.sha512bytesBindings(), bindings.sha512bindings);

List<int> cryptoHashSha512(List<int> codeUnits) {
  if (codeUnits.length == 0) {
    return [];
  }
  var bytesArray = Uint8CArray.from(codeUnits);
  final out = nativeCryptoHashSha512(bytesArray.ptr, codeUnits.length);
  bytesArray.ptr.free();
  bytesArray = Uint8CArray.fromPointer(out, bindings.sha512bytesBindings());
  final bytes = bytesArray.bytes;
  bytesArray.ptr.free();
  out.free();
  return bytes;
}

class Sha512 {
  Digest convert(List<int> bytes) => Digest(cryptoHashSha512(bytes));
}
