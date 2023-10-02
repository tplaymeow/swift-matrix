// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "swift-matrix",
  products: [
    .library(name: "Matrix", targets: ["Matrix"])
  ],
  dependencies: [
    .package(url: "https://github.com/google/swift-benchmark", exact: "0.1.2")
  ],
  targets: [
    .systemLibrary(
      name: "COpenBLAS",
      pkgConfig: "openblas",
      providers: [
        .brewItem(["openblas"]),
        .aptItem(["libopenblas-dev"]),
      ]
    ),
    .systemLibrary(
      name: "CLapack",
      pkgConfig: "lapack",
      providers: [
        .brewItem(["lapack"]),
        .aptItem(["liblapack-dev"]),
      ]
    ),
    .target(
      name: "Matrix",
      dependencies: [
        "COpenBLAS",
        "CLapack",
      ]
    ),
    .testTarget(
      name: "MatrixTests",
      dependencies: [
        "Matrix"
      ]
    ),
    .executableTarget(
      name: "MatrixBenchmark",
      dependencies: [
        "Matrix",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ]
    ),
  ]
)
