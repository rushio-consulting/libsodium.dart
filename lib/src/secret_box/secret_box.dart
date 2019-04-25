import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';

class SecretBox {
  final nonceLenght = bindings.crypto_secretbox_noncebytes();

  Digest keygen() {
    final key = Uint8CArray(bindings.crypto_secretbox_keybytes());
    bindings.crypto_secretbox_keygen(key.ptr);
    final digest = Digest(key.bytes);
    key.free();
    return digest;
  }

  Digest easy(List<int> message, List<int> nonce, List<int> key) {
    assert(key != null && key.length == bindings.crypto_secretbox_keybytes(),
        'key must be equal to ${bindings.crypto_secretbox_keybytes()}');
    assert(nonce != null && nonce.length >= 2,
        'nonce cannot be null and should be superior at 2');
    final cipherText =
        Uint8CArray(bindings.crypto_secretbox_macbytes() + message.length);
    final messageCArray = Uint8CArray.from(message);
    final nonceCArray = Uint8CArray.from(nonce);
    final keyCArray = Uint8CArray.from(key);
    bindings.crypto_secretbox_easy(cipherText.ptr, messageCArray.ptr,
        message.length, nonceCArray.ptr, keyCArray.ptr);
    messageCArray.free();
    nonceCArray.free();
    keyCArray.free();
    final digest = Digest(cipherText.bytes);
    cipherText.free();
    return digest;
  }

  Digest openEasy(
      int messageLength, List<int> cipherText, List<int> nonce, List<int> key) {
    assert(key != null && key.length == bindings.crypto_secretbox_keybytes(),
        'key must be equal to ${bindings.crypto_secretbox_keybytes()}');
    assert(nonce != null && nonce.length >= 2,
        'nonce cannot be null and should be superior at 2');
    final decrypted = Uint8CArray(messageLength);
    final cipherCArray = Uint8CArray.from(cipherText);
    final nonceCArray = Uint8CArray.from(nonce);
    final keyCArray = Uint8CArray.from(key);
    final result = bindings.crypto_secretbox_open_easy(decrypted.ptr,
        cipherCArray.ptr, cipherText.length, nonceCArray.ptr, keyCArray.ptr);
    if (result != 0) {
      decrypted.free();
      print('result == 0');
      return null;
    }
    final digest = Digest(decrypted.bytes);
    return digest;
  }
}
