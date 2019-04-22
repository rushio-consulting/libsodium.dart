import 'dart:ffi';

Pointer<Uint8> shaBase(Pointer<Uint8> cString, int length, int outputSize,
    void Function(Pointer<Uint8> out, Pointer<Uint8> message, int length) f) {
  Pointer<Uint8> out = allocate<Uint8>(count: outputSize);
  f(out, cString, length);
  return out;
}
