import 'dart:convert';

import 'package:libsodium/libsodium.dart';

void main() {
  sodiumInit();

  final utils = Utils();
  final secretBox = SecretBox();
  final key = secretBox.keygen();
  // final nonce = utils.randomBytesBuf(secretBox.nonceLenght);
  final nonce = 'monsuperpassword'.codeUnits;
  final message = 'Hello world !';
  print('key = ${key.bytes}');
  print('nonce = ${nonce.bytes}');
  print('messageLength = ${message.length}');

  final cipherText = secretBox.easy(message.codeUnits, nonce, key.bytes);
  print('cipherText = $cipherText');

  final decryptedText =
      secretBox.openEasy(message.length, cipherText.bytes, nonce, key.bytes);
  final decryptedMessage = utf8.decode(decryptedText.bytes);
  print('decryptedMessage = $decryptedMessage');
}
