import 'package:libsodium/src/bindings/bindings.dart';

SodiumBindings _cachedBindings;
SodiumBindings get bindings => _cachedBindings;

int sodiumInit({String libPath = './'}) {
  if (_cachedBindings == null) {
    _cachedBindings = SodiumBindings(path: libPath);
    return bindings.sodium_init();
  }
  return 0;
}
