import 'dart:convert';

import '../common/base_test.dart';
import '../common/constant.dart'; // for the utf8.encode method

class LibSodiumSHA1Benchmark extends BaseBenchmark {
  LibSodiumSHA1Benchmark() : super("LibSodiumSHA1");

  static void main() {
    new LibSodiumSHA1Benchmark().report();
  }

  // The benchmark code.
  void run() {
    //digest = sha1.convert(bytes);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    bytes = utf8.encode(dataToEncrypt); // data being hashed
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}

class LibSodiumSHA256Benchmark extends BaseBenchmark {
  LibSodiumSHA256Benchmark() : super("LibSodiumSHA256");

  static void main() {
    new LibSodiumSHA256Benchmark().report();
  }

  // The benchmark code.
  void run() {
    //digest = sha256.convert(bytes);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    bytes = utf8.encode(dataToEncrypt); // data being hashed
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}


main() {
  // Run TemplateBenchmark
  LibSodiumSHA1Benchmark.main();
  LibSodiumSHA256Benchmark.main();
}