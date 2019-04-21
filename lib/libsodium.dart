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
  Pointer<Uint8> out = allocate<Uint8>(count: cryptoHashSha256Bytes);
  bindings.crypto_hash_sha256(
      out, CString.fromCodeUntis(codeUnits), codeUnits.length);
  int len = 0;
  final units = List<int>(cryptoHashSha256Bytes);
  while (len < cryptoHashSha256Bytes) {
    units[len] = out.elementAt(len).load<int>();
    len++;
  }
  out.free();
  return hex.encode(units);
}

String sha512(List<int> codeUnits) {
  Pointer<Uint8> out = allocate<Uint8>(count: cryptoHashSha512Bytes);
  bindings.crypto_hash_sha512(
      out, CString.fromCodeUntis(codeUnits), codeUnits.length);
  int len = 0;
  final units = List<int>(cryptoHashSha512Bytes);
  while (len < cryptoHashSha512Bytes) {
    units[len] = out.elementAt(len).load<int>();
    len++;
  }
  out.free();
  return hex.encode(units);
}
