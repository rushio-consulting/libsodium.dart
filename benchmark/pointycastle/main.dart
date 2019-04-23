import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:pointycastle/pointycastle.dart';

import '../common/base_test.dart';
import '../common/constant.dart'; // for the utf8.encode method

class PointyCastleSHA256Benchmark extends BaseBenchmark {
  Digest _digest;

  PointyCastleSHA256Benchmark() : super("PointyCastleSHA256");

  static void main() {
    new PointyCastleSHA256Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = hex.encode(_digest.process(bytes));
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    _digest = Digest('SHA-256');
    bytes = utf8.encode(dataToEncrypt); // data being hashed
    super.setup();
  }

  // Not measures teardown code executed after the benchark runs.
  void teardown() {
    super.teardown();
  }
}

class PointyCastleSHA512Benchmark extends BaseBenchmark {
  Digest _digest;

  PointyCastleSHA512Benchmark() : super("PointyCastleSHA512");

  static void main() {
    new PointyCastleSHA512Benchmark().report();
  }

  // The benchmark code.
  void run() {
    digest = hex.encode(_digest.process(bytes));
  }

  // Not measured setup code executed prior to the benchmark runs.
  void setup() {
    _digest = Digest('SHA-512');
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
  PointyCastleSHA256Benchmark.main();
  PointyCastleSHA512Benchmark.main();
}
