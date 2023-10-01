// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "swift-matrix",
  products: [
    .library(name: "Matrix", targets: ["Matrix"])
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
        .brewItem(["liblapack-dev"]),
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
  ]
)
