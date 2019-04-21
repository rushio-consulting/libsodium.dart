import 'package:libsodium/libsodium.dart';

main() {
  final result = sodiumInit();

  print(sha512("FooBar"));
  print(sha256("FooBar"));
}
