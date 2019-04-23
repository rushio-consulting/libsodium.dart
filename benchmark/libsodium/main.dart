import 'dart:convert';

import 'package:libsodium/libsodium.dart';

import 'package:libsodium/src/hashs/sha/sha512.dart';
import 'package:libsodium/src/ffi/cstring.dart';

import '../common/base_test.dart';
import '../common/constant.dart'; // for the utf8.encode method

class LibSodiumSHA256Benchmark extends BaseBenchmark {
  LibSodiumSHA256Benchmark() : super("LibSodiumSHA256");

  static void main() {
    new LibSodiumSHA256Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = Sha256().convert(bytes);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    sodiumInit(libPath: '../');
    bytes = utf8.encode(dataToEncrypt); // data being hashed
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}

class LibSodiumSHA512Benchmark extends BaseBenchmark {
  LibSodiumSHA512Benchmark() : super("LibSodiumSHA512");

  static void main() {
    new LibSodiumSHA512Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = Sha512().convert(bytes);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    sodiumInit(libPath: '../');
    bytes = utf8.encode(dataToEncrypt); // data being hashed
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}

class LibSodiumSHA512FFIOnlyBenchmark extends BaseBenchmark {
  CString data;
  List<int> units;
  LibSodiumSHA512FFIOnlyBenchmark() : super("LibSodiumSHA512FFIOnly");

  static void main() {
    new LibSodiumSHA512FFIOnlyBenchmark().report();
  }

  // The benchmark code.
  void run() {
    //  ignore: invalid_use_of_visible_for_testing_member
    digest = nativeCryptoHashSha512(data.ptr, units.length);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    sodiumInit(libPath: '../');
    units = Utf8Encoder().convert(dataToEncrypt);
    data = CString.fromUtf8(dataToEncrypt);
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}

main() {
  // Run TemplateBenchmark
  LibSodiumSHA256Benchmark.main();
  LibSodiumSHA512Benchmark.main();
  LibSodiumSHA512FFIOnlyBenchmark.main();
}
