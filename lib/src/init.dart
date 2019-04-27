import 'package:libsodium/src/bindings/sodium.dart';

SodiumBindings _cachedBindings;
SodiumBindings get bindings => _cachedBindings;

int sodiumInit({String libPath = ''}) {
  if (_cachedBindings == null) {
    _cachedBindings = SodiumBindings(path: libPath);
    return bindings.sodiumInit();
  }
  return 0;
}
