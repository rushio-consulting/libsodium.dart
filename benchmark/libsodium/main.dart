import 'package:libsodium/libsodium.dart';

import '../common/base_test.dart';
import '../common/constant.dart'; // for the utf8.encode method

class LibSodiumSHA256Benchmark extends BaseBenchmark {
  LibSodiumSHA256Benchmark() : super("LibSodiumSHA256");

  static void main() {
    new LibSodiumSHA256Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = sha256(dataToEncrypt);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    sodiumInit(libPath: '../');
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
    digest = sha512(dataToEncrypt);
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    sodiumInit(libPath: '../');
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
}