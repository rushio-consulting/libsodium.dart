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

String sha256(List<int> codeUnits) {
  Pointer<Uint8> out = allocate<Uint8>(count: cryptoHashSha256Bytes);
  bindings.crypto_hash_sha256(
      out, CString.fromCodeUnits(codeUnits), codeUnits.length);
  int len = 0;
  final units = List<int>(cryptoHashSha256Bytes);
  while (len < cryptoHashSha256Bytes) {
    units[len] = out.elementAt(len).load<int>();
    len++;
  }
  out.free();
  return hex.encode(units);
}

Pointer<Uint8> _shaBase(Pointer<Uint8> cString, int length, int outputSize,
    void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length) f) {
  Pointer<Uint8> out = allocate<Uint8>(count: outputSize);
  f(out, cString, length);
  return out;
}

Pointer<Uint8> nativeSha512(Pointer<Uint8> cString, int length) => _shaBase(
    cString, length, cryptoHashSha512Bytes, bindings.crypto_hash_sha512);

String cStringToDartString(Pointer<Uint8> cString, int stringLength) {
  int len = 0;
  final units = List<int>(stringLength);
  while (len < cryptoHashSha512Bytes) {
    units[len] = cString.elementAt(len).load<int>();
    len++;
  }
  return hex.encode(units);
}

String sha512(List<int> codeUnits) {
  final out = nativeSha512(CString.fromCodeUnits(codeUnits), codeUnits.length);
  final _data = cStringToDartString(out, cryptoHashSha512Bytes);
  out.free();
  return _data;
}
