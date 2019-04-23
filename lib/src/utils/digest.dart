import 'package:convert/convert.dart';

class Digest {
  List<int> bytes;

  Digest(this.bytes);

  String toString() => hex.encode(bytes);
}
