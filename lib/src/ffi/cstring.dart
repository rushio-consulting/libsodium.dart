import "dart:convert";
import "dart:ffi";

class CString {
  Pointer<Uint8> _ptr;
  int length;

  CString(this._ptr, this.length)
      : assert(_ptr != null),
        assert(length != null);

  Pointer<Uint8> get ptr => _ptr;

  factory CString.fromCodeUnits(List<int> codeUnits) {
    final ptr = allocate<Uint8>(count: codeUnits.length);
    for (int i = 0; i < codeUnits.length; ++i) {
      ptr.elementAt(i).store(codeUnits[i]);
    }
    ptr.elementAt(codeUnits.length).store(0);
    return CString(ptr, codeUnits.length);
  }

  factory CString.fromUtf8(String dartStr) {
    final units = Utf8Encoder().convert(dartStr);
    return CString.fromCodeUnits(units);
  }

  String toString() {
    int len = 0;
    final units = List<int>(length);
    while (len < length) {
      units[len] = _ptr.elementAt(len).load<int>();
      len++;
    }
    return utf8.decode(units);
  }
}
