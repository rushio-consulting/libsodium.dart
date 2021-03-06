import 'dart:collection';

import 'dart:ffi';

import 'package:convert/convert.dart';

abstract class CArray<NT extends NativeType, DT extends num>
    extends IterableBase<DT> {
  final Pointer<NT> ptr;
  final int length;

  CArray(this.length)
      : assert(length >= 0),
        ptr = allocate<NT>(count: length);

  CArray.from(Iterable<DT> bytes)
      : length = bytes.length,
        ptr = allocate(count: bytes.length) {
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

abstract class _IntCArray<NT extends NativeType> extends CArray<NT, int> {
  _IntCArray(int length) : super(length);

  _IntCArray.from(Iterable<int> bytes) : super.from(bytes);

  _IntCArray.fromPointer(Pointer<NT> ptr, int length)
      : super.fromPointer(ptr, length);

  @override
  String toString() => hex.encode(bytes);
}

class Uint8CArray extends _IntCArray<Uint8> {
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
}

class Uint16CArray extends _IntCArray<Uint16> {
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
}

class Uint32CArray extends _IntCArray<Uint32> {
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
}

class Uint64CArray extends _IntCArray<Uint64> {
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
}

class Int8CArray extends _IntCArray<Int8> {
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
}

class Int16CArray extends _IntCArray<Int16> {
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
}

class Int32CArray extends _IntCArray<Int32> {
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
}

class Int64CArray extends _IntCArray<Int64> {
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
}
