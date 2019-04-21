import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../common/base_test.dart';
import '../common/constant.dart'; // for the utf8.encode method

class CryptoSHA256Benchmark extends BaseBenchmark {
  CryptoSHA256Benchmark() : super("CryptoSHA256");

  static void main() {
    new CryptoSHA256Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = sha256.convert(bytes);
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
  CryptoSHA256Benchmark.main();
}