library libsodium;

import 'src/bindings/bindings.dart';

int sodiumInit() => bindings.sodium_init();
