// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "swift-matrix",
  products: [
    .library(name: "Matrix", targets: ["Matrix"])
  ],
  dependencies: [
    .package(url: "https://github.com/google/swift-benchmark", exact: "0.1.2"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
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
      name: "LinearAlgebra",
      dependencies: [
        "COpenBLAS",
        "CLapack",
      ]
    ),
    .target(
      name: "Matrix",
      dependencies: [
        "COpenBLAS",
        "CLapack",
        "LinearAlgebra",
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
