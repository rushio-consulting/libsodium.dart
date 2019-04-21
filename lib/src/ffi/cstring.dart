import "dart:convert";
import "dart:ffi";

class CString {
  Pointer<Uint8> ptr;
  int length;

  CString(this.ptr, this.length)
      : assert(ptr != null),
        assert(length != null);

  factory CString.fromCodeUnits(List<int> codeUnits) {
    Pointer<Uint8> ptr = allocate(count: codeUnits.length);
    for (int i = 0; i < codeUnits.length; ++i) {
      ptr.elementAt(i).store(codeUnits[i]);
    }
    ptr.elementAt(codeUnits.length).store(0);
    return CString(ptr, codeUnits.length);
  }

  factory CString.fromUtf8(String dartStr) {
    List<int> units = Utf8Encoder().convert(dartStr);
    return CString.fromCodeUnits(units);
  }

  String toString() {
    int len = 0;
    final units = List<int>(length);
    while (len < length) {
      units[len] = ptr.elementAt(len).load<int>();
      len++;
    }
    return utf8.decode(units);
  }
}
