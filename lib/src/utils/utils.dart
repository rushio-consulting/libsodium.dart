import 'package:libsodium/src/ffi/c_array.dart';
import 'package:libsodium/src/utils/digest.dart';
import 'package:libsodium/src/utils/native_random_bytes_buf.dart';

class Utils {
  Digest randomBytesBuf(int size) {
    return Digest(
        Uint8CArray.fromPointer(nativeRandomBytesBuf(size), size).bytes);
  }
}
