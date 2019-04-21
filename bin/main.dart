import 'package:libsodium/libsodium.dart';

main() {
  final result = sodiumInit();

  print(sha256("FooBar"));
}
