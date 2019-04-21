import "dart:convert";
import "dart:ffi";

class CString {
  final Pointer<Uint8> _ptr;

  int _length;
  List<int> _codeUnits;

  CString(this._ptr, {List<int> codeUnits, int length})
      : assert(codeUnits != null || length != null),
        _length = (length ??= codeUnits?.length),
        _codeUnits = codeUnits;

  factory CString.fromCodeUnits(List<int> codeUnits) {
    final ptr = allocate<Uint8>(count: codeUnits.length);
    for (int i = 0; i < codeUnits.length; ++i) {
      ptr.elementAt(i).store(codeUnits[i]);
    }
    ptr.elementAt(codeUnits.length).store(0);
    return CString(ptr, codeUnits: codeUnits);
  }

  factory CString.fromUtf8(String dartStr) {
    final units = Utf8Encoder().convert(dartStr);
    return CString.fromCodeUnits(units);
  }

  Pointer<Uint8> get ptr => _ptr;

  int get length {
    if (_length != null) {
      return _length;
    }
    int len = 0;
    while (_ptr.elementAt(len).load<int>() != 0) {
      len++;
    }
    _length = len;
    return _length;
  }

  List<int> get codeUnits {
    if (_codeUnits != null) {
      return _codeUnits;
    }
    int len = 0;
    final units = List<int>(length);
    while (len < length) {
      units[len] = ptr.elementAt(len).load<int>();
      len++;
    }
    _codeUnits = units;
    return _codeUnits;
  }

  String toString() => utf8.decode(codeUnits);
}
