
// Create a new benchmark by extending BenchmarkBase
import 'package:benchmark_harness/benchmark_harness.dart';

import 'constant.dart';

class BaseBenchmark extends BenchmarkBase {
  var bytes;
  var digest;

  BaseBenchmark(String name) : super(name);

  @override
  void setup() {
    print('$name: $dataToEncrypt');
    super.setup();
  }

  @override
  void teardown() {
    print('$name: $digest');
    super.teardown();
  }
}