import 'dart:collection';

import 'dart:ffi';

import 'package:convert/convert.dart';

abstract class CArray<NT extends NativeType, DT extends num>
    extends IterableBase<DT> {
  final Pointer<NT> ptr;
  final int length;

  CArray(this.length)
      : assert(length >= 0),
        ptr = allocate<NT>(count: length - 1);

  CArray.from(Iterable<DT> bytes)
      : length = bytes.length - 1,
        ptr = allocate(count: bytes.length - 1) {
    final it = bytes.iterator;
    int index = 0;
    while (it.moveNext()) {
      this[index] = it.current;
      index++;
    }
  }

  CArray.fromPointer(this.ptr, this.length);

  List<DT> get bytes => List<DT>.unmodifiable(() sync* {
        for (int i = 0; i < length; i++) {
          yield this[i];
        }
      }());

  @override
  Iterator<DT> get iterator => CArrayIterator<NT, DT>(this);

  DT operator [](int index);

  void operator []=(int index, DT value);

  void free() => ptr.free();

  @override
  String toString() => '$bytes';
}

class CArrayIterator<NT extends NativeType, DT extends num>
    extends Iterator<DT> {
  final CArray<NT, DT> cArray;
  int _index;

  CArrayIterator(this.cArray) : _index = -1;

  @override
  DT get current => cArray[_index];

  @override
  bool moveNext() {
    if (_index < cArray.length) {
      _index++;
      return true;
    }
    return false;
  }
}

class Uint8CArray extends CArray<Uint8, int> {
  Uint8CArray(int length) : super(length);

  Uint8CArray.from(Iterable<int> bytes) : super.from(bytes);

  Uint8CArray.fromPointer(Pointer<Uint8> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Uint16CArray extends CArray<Uint16, int> {
  Uint16CArray(int length) : super(length);

  Uint16CArray.from(Iterable<int> bytes) : super.from(bytes);

  Uint16CArray.fromPointer(Pointer<Uint16> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Uint32CArray extends CArray<Uint32, int> {
  Uint32CArray(int length) : super(length);

  Uint32CArray.from(Iterable<int> bytes) : super.from(bytes);

  Uint32CArray.fromPointer(Pointer<Uint32> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Uint64CArray extends CArray<Uint64, int> {
  Uint64CArray(int length) : super(length);

  Uint64CArray.from(Iterable<int> bytes) : super.from(bytes);

  Uint64CArray.fromPointer(Pointer<Uint64> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Int8CArray extends CArray<Int8, int> {
  Int8CArray(int length) : super(length);

  Int8CArray.from(Iterable<int> bytes) : super.from(bytes);

  Int8CArray.fromPointer(Pointer<Int8> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Int16CArray extends CArray<Int16, int> {
  Int16CArray(int length) : super(length);

  Int16CArray.from(Iterable<int> bytes) : super.from(bytes);

  Int16CArray.fromPointer(Pointer<Int16> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Int32CArray extends CArray<Int32, int> {
  Int32CArray(int length) : super(length);

  Int32CArray.from(Iterable<int> bytes) : super.from(bytes);

  Int32CArray.fromPointer(Pointer<Int32> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}

class Int64CArray extends CArray<Int64, int> {
  Int64CArray(int length) : super(length);

  Int64CArray.from(Iterable<int> bytes) : super.from(bytes);

  Int64CArray.fromPointer(Pointer<Int64> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  int operator [](int index) {
    return ptr.elementAt(index).load<int>();
  }

  @override
  void operator []=(int index, int value) {
    return ptr.elementAt(index).store(value);
  }

  @override
  String toString() => hex.encode(bytes);
}
