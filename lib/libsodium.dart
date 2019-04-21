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

String sha256(String message) {
  Pointer<Uint8> out = allocate<Uint8>(count: cryptoHashSha256Bytes);
  bindings.crypto_hash_sha256(out, CString.allocate(message), message.length);
  int len = 0;
  while (len < cryptoHashSha256Bytes) {
    out.elementAt(len).load<int>();
    len++;
  }
  List<int> units = List(len);
  for (int i = 0; i < len; ++i) units[i] = out.elementAt(i).load();
  return hex.encode(units);
}

String sha512(String message) {
  Pointer<Uint8> out = allocate<Uint8>(count: cryptoHashSha512Bytes);
  bindings.crypto_hash_sha512(out, CString.allocate(message), message.length);
  int len = 0;
  while (len < cryptoHashSha512Bytes) {
    out.elementAt(len).load<int>();
    len++;
  }
  List<int> units = List(cryptoHashSha512Bytes);
  for (int i = 0; i < len; ++i) units[i] = out.elementAt(i).load();
  return hex.encode(units);
}
