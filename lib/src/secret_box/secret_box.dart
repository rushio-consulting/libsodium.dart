import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/init.dart';
import 'package:libsodium/src/utils/digest.dart';

class SecretBox {
  Digest keygen() {
    final key = Uint8CArray(bindings.secretBoxKeyBytesBindings());
    bindings.secretBoxKeyGenBindings(key.ptr);
    final digest = Digest(key.bytes);
    key.free();
    return digest;
  }

  Digest easy(List<int> message, List<int> nonce, List<int> key) {
    assert(key != null && key.length == bindings.secretBoxKeyBytesBindings(),
        'key must be equal to ${bindings.secretBoxKeyBytesBindings()}');
    List<int> _nonce = []..addAll(nonce);
    if (_nonce.length < bindings.secretBoxNonceBytesBindings()) {
      while (_nonce.length != bindings.secretBoxNonceBytesBindings()) {
        _nonce.add(0);
      }
    } else if (_nonce.length > bindings.secretBoxNonceBytesBindings()) {
      _nonce = _nonce.sublist(0, bindings.secretBoxNonceBytesBindings());
    }
    assert(_nonce.length == bindings.secretBoxNonceBytesBindings(),
        'nonce must be equal to ${bindings.secretBoxNonceBytesBindings()}');
    final cipherText =
        Uint8CArray(bindings.secretBoxMacBytesBindings() + message.length);
    final messageCArray = Uint8CArray.from(message);
    final nonceCArray = Uint8CArray.from(nonce);
    final keyCArray = Uint8CArray.from(key);
    bindings.secretBoxEasyBindings(cipherText.ptr, messageCArray.ptr,
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
    assert(key != null && key.length == bindings.secretBoxKeyBytesBindings(),
        'key must be equal to ${bindings.secretBoxKeyBytesBindings()}');
    List<int> _nonce = []..addAll(nonce);
    if (_nonce.length < bindings.secretBoxNonceBytesBindings()) {
      while (_nonce.length != bindings.secretBoxNonceBytesBindings()) {
        _nonce.add(0);
      }
    } else if (_nonce.length > bindings.secretBoxNonceBytesBindings()) {
      _nonce = _nonce.sublist(0, bindings.secretBoxNonceBytesBindings());
    }
    assert(_nonce.length == bindings.secretBoxNonceBytesBindings(),
        'nonce must be equal to ${bindings.secretBoxNonceBytesBindings()}');
    final decrypted = Uint8CArray(messageLength);
    final cipherCArray = Uint8CArray.from(cipherText);
    final nonceCArray = Uint8CArray.from(nonce);
    final keyCArray = Uint8CArray.from(key);
    final result = bindings.secretBoxOpenEasyBindings(decrypted.ptr,
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
