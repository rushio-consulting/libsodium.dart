library libsodium;

import 'dart:ffi';

import 'package:libsodium/src/bindings/constants.dart';
import 'package:libsodium/src/ffi/cstring.dart';
import 'package:convert/convert.dart';

import 'src/bindings/bindings.dart';

SodiumBindings _cachedBindings;
SodiumBindings get bindings => _cachedBindings;

int sodiumInit({String libPath = './'}) {
  _cachedBindings = SodiumBindings(path: libPath);
  return bindings.sodium_init();
}

String sha256(List<int> codeUnits) {
  CString out = allocate<Uint8>(count: cryptoHashSha256Bytes).cast<CString>();
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

CString _shaBase(CString cString, int length, int outputSize,
    void Function(CString out, CString message, int length) f) {
  CString out = allocate<Uint8>(count: outputSize).cast<CString>();
  f(out, cString, length);
  return out;
}

CString nativeSha512(CString cString, int length) => _shaBase(
    cString, length, cryptoHashSha512Bytes, bindings.crypto_hash_sha512);

String sha512(List<int> codeUnits) {
  final out = nativeSha512(CString.fromCodeUnits(codeUnits), codeUnits.length);
  int len = 0;
  final units = List<int>(cryptoHashSha512Bytes);
  while (len < cryptoHashSha512Bytes) {
    units[len] = out.elementAt(len).load<int>();
    len++;
  }
  out.free();
  return hex.encode(units);
}
