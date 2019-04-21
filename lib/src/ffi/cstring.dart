import "dart:convert";
import "dart:ffi";

class CString {
  Pointer<Uint8> ptr;

  CString(this.ptr);

  factory CString.fromCodeUnits(List<int> codeUnits) {
    Pointer<Uint8> ptr = allocate(count: codeUnits.length + 1);
    for (int i = 0; i < codeUnits.length; ++i) {
      ptr.elementAt(i).store(codeUnits[i]);
    }
    ptr.elementAt(codeUnits.length).store(0);
    return CString(ptr);
  }

  factory CString.allocate(String dartStr) {
    List<int> units = Utf8Encoder().convert(dartStr);
    return CString.fromCodeUnits(units);
  }
}
