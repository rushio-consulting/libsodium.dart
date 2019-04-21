library libsodium;

import 'dart:ffi';

import 'package:libsodium/src/bindings/constants.dart';
import 'package:libsodium/src/ffi/cstring.dart';
import 'package:convert/convert.dart';

import 'src/bindings/bindings.dart';

export 'src/ffi/cstring.dart';
export 'src/bindings/constants.dart';

SodiumBindings _cachedBindings;
SodiumBindings get bindings => _cachedBindings;

int sodiumInit({String libPath = './'}) {
  _cachedBindings = SodiumBindings(path: libPath);
  return bindings.sodium_init();
}

Pointer<Uint8> _shaBase(Pointer<Uint8> cString, int length, int outputSize,
    void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length) f) {
  Pointer<Uint8> out = allocate<Uint8>(count: outputSize);
  f(out, cString, length);
  return out;
}

Pointer<Uint8> nativeSha256(Pointer<Uint8> cString, int length) => _shaBase(
    cString, length, cryptoHashSha256Bytes, bindings.crypto_hash_sha256);

String sha256(List<int> codeUnits) {
  final out =
      nativeSha256(CString.fromCodeUnits(codeUnits).ptr, codeUnits.length);
  final _data =
      hex.encode(CString(out, length: cryptoHashSha256Bytes).codeUnits);
  out.free();
  return _data;
}

Pointer<Uint8> nativeSha512(Pointer<Uint8> cString, int length) => _shaBase(
    cString, length, cryptoHashSha512Bytes, bindings.crypto_hash_sha512);

String sha512(List<int> codeUnits) {
  final out =
      nativeSha512(CString.fromCodeUnits(codeUnits).ptr, codeUnits.length);
  final _data =
      hex.encode(CString(out, length: cryptoHashSha512Bytes).codeUnits);
  out.free();
  return _data;
}
