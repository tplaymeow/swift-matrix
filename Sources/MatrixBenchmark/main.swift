import Benchmark
import Matrix

let matrixDouble = try Matrix<Double>(rows: [
  [11, 30, 32, 3, 10, 12, 22, 25, 24, 17, 27, 14, 1, 8, 9],
  [32, 6, 27, 20, 1, 7, 26, 5, 24, 28, 31, 17, 8, 21, 18],
  [11, 25, 26, 29, 32, 12, 18, 5, 2, 1, 17, 31, 7, 10, 21],
  [6, 25, 16, 19, 9, 27, 31, 18, 30, 11, 32, 10, 14, 1, 2],
  [31, 20, 8, 23, 32, 29, 21, 1, 4, 6, 7, 25, 3, 17, 12],
  [27, 17, 29, 3, 21, 19, 5, 32, 4, 16, 28, 9, 13, 1, 25],
  [16, 22, 21, 31, 27, 29, 32, 28, 20, 2, 6, 4, 8, 19, 24],
  [24, 32, 8, 4, 6, 13, 28, 18, 25, 26, 22, 27, 10, 5, 11],
  [13, 16, 28, 4, 19, 20, 29, 21, 23, 18, 10, 2, 14, 3, 12],
  [9, 24, 6, 16, 4, 2, 7, 14, 32, 21, 27, 28, 13, 1, 22],
  [16, 6, 18, 8, 4, 29, 22, 14, 9, 15, 17, 28, 5, 32, 21],
  [8, 5, 28, 2, 29, 6, 1, 30, 23, 19, 15, 32, 31, 11, 12],
  [7, 9, 14, 31, 15, 10, 2, 30, 1, 21, 20, 17, 4, 18, 12],
  [13, 14, 30, 17, 18, 5, 10, 23, 3, 9, 1, 24, 7, 2, 28],
  [22, 23, 31, 29, 1, 17, 2, 32, 21, 5, 15, 12, 28, 16, 20],
])

let matrixFloat = try Matrix<Float>(rows: [
  [11, 30, 32, 3, 10, 12, 22, 25, 24, 17, 27, 14, 1, 8, 9],
  [32, 6, 27, 20, 1, 7, 26, 5, 24, 28, 31, 17, 8, 21, 18],
  [11, 25, 26, 29, 32, 12, 18, 5, 2, 1, 17, 31, 7, 10, 21],
  [6, 25, 16, 19, 9, 27, 31, 18, 30, 11, 32, 10, 14, 1, 2],
  [31, 20, 8, 23, 32, 29, 21, 1, 4, 6, 7, 25, 3, 17, 12],
  [27, 17, 29, 3, 21, 19, 5, 32, 4, 16, 28, 9, 13, 1, 25],
  [16, 22, 21, 31, 27, 29, 32, 28, 20, 2, 6, 4, 8, 19, 24],
  [24, 32, 8, 4, 6, 13, 28, 18, 25, 26, 22, 27, 10, 5, 11],
  [13, 16, 28, 4, 19, 20, 29, 21, 23, 18, 10, 2, 14, 3, 12],
  [9, 24, 6, 16, 4, 2, 7, 14, 32, 21, 27, 28, 13, 1, 22],
  [16, 6, 18, 8, 4, 29, 22, 14, 9, 15, 17, 28, 5, 32, 21],
  [8, 5, 28, 2, 29, 6, 1, 30, 23, 19, 15, 32, 31, 11, 12],
  [7, 9, 14, 31, 15, 10, 2, 30, 1, 21, 20, 17, 4, 18, 12],
  [13, 14, 30, 17, 18, 5, 10, 23, 3, 9, 1, 24, 7, 2, 28],
  [22, 23, 31, 29, 1, 17, 2, 32, 21, 5, 15, 12, 28, 16, 20],
])

let determinantSuite = BenchmarkSuite(name: "Determinant of matrix") {
  $0.benchmark("Double") {
    _ = try matrixDouble.determinant()
  }

  $0.benchmark("Float") {
    _ = try matrixFloat.determinant()
  }
}

let inverseSuite = BenchmarkSuite(name: "Inverse matrix") {
  $0.benchmark("Double") {
    _ = try matrixDouble.inversed()
  }

  $0.benchmark("Float") {
    _ = try matrixFloat.inversed()
  }
}

let transposeSuite = BenchmarkSuite(name: "Transpose matrix") {
  $0.benchmark("Double") {
    _ = matrixDouble.transposed()
  }

  $0.benchmark("Float") {
    _ = matrixFloat.transposed()
  }
}

let multiplySuite = BenchmarkSuite(name: "Multiply matrix") {
  $0.benchmark("Double") {
    _ = try matrixDouble * matrixDouble
  }

  $0.benchmark("Float") {
    _ = try matrixFloat * matrixFloat
  }
}

let sumSuite = BenchmarkSuite(name: "Multiply matrix") {
  $0.benchmark("Row.Double") {
    _ = matrixDouble.sum(axis: .row)
  }

  $0.benchmark("Column.Double") {
    _ = matrixDouble.sum(axis: .column)
  }

  $0.benchmark("Row.Float") {
    _ = matrixFloat.sum(axis: .row)
  }

  $0.benchmark("Column.Float") {
    _ = matrixFloat.sum(axis: .column)
  }
}

Benchmark.main([
  determinantSuite,
  inverseSuite,
  transposeSuite,
  multiplySuite,
  sumSuite,
])
