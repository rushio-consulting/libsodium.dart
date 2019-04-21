import 'package:libsodium/libsodium.dart';

main() {
  final result = sodiumInit();

  print(sha512('FooBar'.codeUnits));
  print(sha256('FooBar'.codeUnits));
}
