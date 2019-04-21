import 'dart:ffi';

import '../ffi/dylib_utils.dart';

import 'signatures.dart';
import 'types.dart';

class _SodiumBindings {
  DynamicLibrary sodium;

  int Function() sodium_init;

  _SodiumBindings() {
    sodium = dlopenPlatformSpecific('sodium');
    sodium_init = sodium
        .lookup<NativeFunction<sodium_init_t>>("sodium_init")
        .asFunction();
  }
}

_SodiumBindings _cachedBindings;
_SodiumBindings get bindings => _cachedBindings ??= _SodiumBindings();
