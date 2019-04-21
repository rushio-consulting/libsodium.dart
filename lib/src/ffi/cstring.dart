import "dart:convert";
import "dart:ffi";

class CString extends Pointer<Uint8> {
  factory CString.fromCodeUnits(List<int> codeUnits) {
    Pointer<Uint8> str = allocate(count: codeUnits.length + 1);
    for (int i = 0; i < codeUnits.length; ++i) {
      str.elementAt(i).store(codeUnits[i]);
    }
    str.elementAt(codeUnits.length).store(0);
    return str.cast();
  }

  factory CString.allocate(String dartStr) {
    List<int> units = Utf8Encoder().convert(dartStr);
    Pointer<Int8> str = allocate(count: units.length + 1);
    for (int i = 0; i < units.length; ++i) {
      str.elementAt(i).store(units[i]);
    }
    str.elementAt(units.length).store(0);
    return str.cast();
  }
}
